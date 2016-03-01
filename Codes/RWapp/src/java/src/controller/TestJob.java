/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import org.json.JSONArray;
import org.json.JSONObject;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import src.model.ConnectionManager;
import src.model.CronDAO;
import src.model.Person;
import src.model.PersonDAO;
import src.model.Project;
import src.model.ProjectAllocationDAO;
import src.model.ProjectDAO;
import src.model.TrelloBoard;
import src.model.TrelloConfigDAO;
import src.model.TrelloDetailsDAO;
import src.model.TrelloProperties;

/**
 *
 * @author maxchua
 */
public class TestJob implements Job {

    private static String mainboard;
    private static String devList;
    private static String adminUsername;

    @Override
    public void execute(final JobExecutionContext ctx)
            throws JobExecutionException {

        int pause = TrelloConfigDAO.retrieveCronPause();
        if (pause == 1) {

        } else {

            TrelloProperties tp = TrelloConfigDAO.retrieveConfig();

            mainboard = tp.getMainboard();
            devList = tp.getDevelopmentList();
            adminUsername = tp.getAdmin();
            System.out.println("Cron starts here");
            try {
                //1. get all trello board data
//                System.out.println("try  here");
                String key = TrelloDetailsDAO.retrieveTrelloKey(adminUsername);
                String token = TrelloDetailsDAO.retrieveTrelloToken(adminUsername);
//            System.out.println("KEY:  " + key + " TOKEN : " + token);
//            System.out.println(tp);
                //first url to call the user's boards

                URL memberUrl = new URL("https://api.trello.com/1/members/" + adminUsername + "?fields=username,fullName,url&boards=all&board_fields=name&organizations=all&organization_fields=displayName&key=" + key + "&token=" + token);
                //System.out.println(memberUrl);

                URLConnection con = memberUrl.openConnection();
                InputStream is = con.getInputStream();
                BufferedReader br = new BufferedReader(new InputStreamReader(is));

                String line = null;
                String jsonOutput = "";
                TrelloBoard tb = null;
                // read each line and throw string into JSONObject
                while ((line = br.readLine()) != null) {
                    jsonOutput += line;

                }

                JSONObject obj = new JSONObject(jsonOutput);
                JSONArray boardArr = obj.getJSONArray("boards");
        //iterate through the user's boards and store into an arraylist first

                //masterboardID - id for masterboard need this for the URL
                String masterboardID = "";
                for (int i = 0; i < boardArr.length(); i++) {
                    JSONObject board = boardArr.getJSONObject(i);
                    String name = board.getString("name");
                    if (name.equals(mainboard)) {
                        masterboardID = board.getString("id");
                    }

                }

                //now we will call the api to get the boards and check for projects master board
                URL listUrl = new URL("https://api.trello.com/1/boards/" + masterboardID + "/lists?key=" + key + "&token=" + token);
                con = listUrl.openConnection();
                is = con.getInputStream();
                br = new BufferedReader(new InputStreamReader(is));

                line = null;
                jsonOutput = "";
                while ((line = br.readLine()) != null) {
                    jsonOutput += line;
                }
                //store the id of the List
                String listId = "";

                JSONArray boardList = new JSONArray(jsonOutput);
                for (int i = 0; i < boardList.length(); i++) {
                    JSONObject list = boardList.getJSONObject(i);

                    String listName = list.getString("name");
                    if (listName.equals(devList)) {
                        listId = list.getString("id");
                    }
                }

            //now we will get all cards related to the user
                //and with the masterboardid as well as the listid, we will be able to identify all 
                //cards related to the development list
                URL cardUrl = new URL("https://api.trello.com/1/boards/" + masterboardID + "/cards?key=" + key + "&token=" + token);
                con = cardUrl.openConnection();
                is = con.getInputStream();
                br = new BufferedReader(new InputStreamReader(is));

                line = null;
                jsonOutput = "";
                while ((line = br.readLine()) != null) {
                    jsonOutput += line;
                }

                //get all developers in RW
                ArrayList<Person> devList = PersonDAO.retrievAllDev();

                //get all members in Trello
                ArrayList<String> mTList = new ArrayList<String>();
                URL membersUrl = new URL("https://api.trello.com/1/boards/" + masterboardID + "/members?key=" + key + "&token=" + token);
                con = membersUrl.openConnection();
                is = con.getInputStream();
                br = new BufferedReader(new InputStreamReader(is));

                line = null;
                String jsonOutput1 = "";
                while ((line = br.readLine()) != null) {
                    jsonOutput1 += line;
                }

                JSONArray membArr = new JSONArray(jsonOutput1);
                for (int i = 0; i < membArr.length(); i++) {
                    JSONObject member = membArr.getJSONObject(i);
                    String memUsername = member.getString("username");
                    String memID = member.getString("id");
                    //store the member ID
                    PersonDAO.updateMemberID(memUsername, memID);
                    for (Person toCheck : devList) {

                        if (toCheck.getUsername().contains(memUsername)) {
                            mTList.add(memID);

                        }
                    }
                }
                ArrayList<String> projList = ProjectDAO.retrieveAllProjectNames();
                //get the card, add to arraylist
                JSONArray cardsArr = new JSONArray(jsonOutput);
                ArrayList<Person> pmList = PersonDAO.retrievAllPM();
                ArrayList<String> errList = new ArrayList<String>();

                for (int i = 0; i < cardsArr.length(); i++) {

                    JSONObject tempCard = cardsArr.getJSONObject(i);
                    //System.out.println(tempCard);
                    String idList = tempCard.getString("idList");
                    //System.out.println(idList);
                    JSONArray members = tempCard.getJSONArray("idMembers");
                    ArrayList<String> devToAdd = new ArrayList<String>();
                    boolean unassigned = true;
                    String assignby = "";
                    for (int j = 0; j < members.length(); j++) {

                        String cardmem = members.getString(j);
                        for (String dev : mTList) {

                            if (cardmem.equals(dev)) {
                                unassigned = false;
                                Person devObj = PersonDAO.retrieveUserById(cardmem);
                                devToAdd.add(devObj.getUsername());
                            }
                        }

                    }
                    for (int j = 0; j < members.length(); j++) {
                        String cardmem = members.getString(j);
//                System.out.println("it went in");
//                System.out.println("dev " + cardmem);
                        for (Person pm : pmList) {
                            String id = PersonDAO.retrieveMemberId(pm.getUsername());
                            if (id.equals(cardmem)) {
                                assignby = pm.getUsername();
//                        System.out.println("assignby pmname: " + assignby);
                            }
                        }
                    }
                    boolean success = true;
                    if (idList.equals(listId) && !unassigned && assignby.length() > 0) {
                        String name = tempCard.getString("name");
                        String desc = tempCard.getString("desc").replace("**", "");
                        if (desc.length() >= 8000) {
                            desc = desc.substring(0, 8000);
                        }
                        String due = "";
                        try {
                            due = tempCard.getString("due").substring(0, 10);
                        } catch (Exception de) {
                            Calendar cal = Calendar.getInstance();
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                            due = sdf.format(cal.getTime());
                        }
                        String cardId = tempCard.getString("id");
                        System.out.println("assignby " + assignby);
                        Project proj = ProjectDAO.retrieveProjectById(cardId);

                        if (!projList.contains(name)) {

                            success = ProjectDAO.addCardFromTrello(name, assignby, cardId, desc, due, 2, "to be updated", 30);
                            //tcList.add(new TrelloCard(cardId, name, due, desc));
                            Person pm = PersonDAO.retrieveUser(assignby);
                            try {
                                URL photoUrl = new URL("https://api.trello.com/1/cards/" + cardId + "/attachments?fields=url&key=" + pm.getTrelloKey() + "&token=" + pm.getToken());
                                //System.out.println(memberUrl);

                                URLConnection con1 = photoUrl.openConnection();
                                InputStream is1 = con1.getInputStream();
                                BufferedReader br1 = new BufferedReader(new InputStreamReader(is1));

                                String line1 = null;
                                String jsonOutput2 = "";

                                // read each line and throw string into JSONObject
                                while ((line1 = br1.readLine()) != null) {
                                    jsonOutput2 += line1;

                                }

                                JSONArray obj1 = new JSONArray(jsonOutput2);
                                //masterboardID - id for masterboard need this for the URL
                                String url = "";
//            for (int i = 0; i < obj.length(); i++) {
                                JSONObject jobj = obj1.getJSONObject(0);
                                url = jobj.getString("url");

//            }
                                System.out.println("url " + url);
                                ProjectDAO.addURL(name, url);
                            } catch (Exception e) {

                            }
                            if (!devToAdd.isEmpty()) {
                                for (String devusername : devToAdd) {
                                    ProjectAllocationDAO.addBasicAllocation(name, devusername);
                                }

                            }
                            if (!success) {
                                errList.add(name + " could not be added to the Database, please try again later");
                            }
                        }
//                    else if (proj != null && proj.getName().equals(name)) {
//                  
//                    Person pm = PersonDAO.retrieveUser(assignby);
//                    String url = "";
//                    try {
//                        URL photoUrl = new URL("https://api.trello.com/1/cards/" + cardId + "/attachments?fields=url&key=" + pm.getTrelloKey() + "&token=" + pm.getToken());
//                        //System.out.println(memberUrl);
//
//                        URLConnection con1 = photoUrl.openConnection();
//                        InputStream is1 = con1.getInputStream();
//                        BufferedReader br1 = new BufferedReader(new InputStreamReader(is1));
//
//                        String line1 = null;
//                        String jsonOutput2 = "";
//
//                        // read each line and throw string into JSONObject
//                        while ((line1 = br1.readLine()) != null) {
//                            jsonOutput2 += line1;
//
//                        }
//
//                        JSONArray obj1 = new JSONArray(jsonOutput2);
//                        //masterboardID - id for masterboard need this for the URL
//                        
////            for (int i = 0; i < obj.length(); i++) {
//                        JSONObject jobj = obj1.getJSONObject(0);
//                        url = jobj.getString("url");
//
////            }
//                        System.out.println("url " + url);
//                        ProjectDAO.addURL(name, url);
//                        
//                    } catch (Exception e) {
//
//                    }
//                    success = ProjectDAO.updateCardFromTrello(name, assignby, cardId, desc, due, 2, "to be updated", 30, url);
//                    //get current developers allocated to this project
//                    ArrayList<String> devListForProj = ProjectAllocationDAO.retrieveDev(name);
//                    if (!devToAdd.isEmpty()) {
//                        for (String devusername : devToAdd) {
//                            if(!devListForProj.contains(devusername)){
//                                ProjectAllocationDAO.addBasicAllocation(name, devusername);
//                            }
//                            
//                        }
//
//                    }
//                    if (!success) {
//                        errList.add(name + " could not be added to the Database, please try again later");
//                    }
//                } else {
//                        errList.add("Duplicate entry for " + name+ ". Please amend project name in Trello");
//                    }

                    }
//                else if (){
//                    
//                }
                }

            } catch (Exception e) {
                System.out.println(e);
            }
            CronDAO.addTime(1);
            System.out.println("Trello sync done.");
        }
    }

}
