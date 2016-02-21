/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;
import src.model.ConnectionManager;
import src.model.Person;
import src.model.PersonDAO;
import src.model.Project;
import src.model.ProjectAllocationDAO;
import src.model.ProjectDAO;
import src.model.TrelloBoard;
import src.model.TrelloCard;
import src.model.TrelloDetailsDAO;

/**
 *
 * @author maxchua
 */
public class updateProjectFromTrello extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String PROPS_FILENAME = "/trello.properties";
    private static String mainboard;
    private static String devList;
    private static String adminUsername;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sess = request.getSession();

        String page = request.getParameter("page");
        Person p1 = (Person) sess.getAttribute("loggedInDev");
        Person p2 = (Person) sess.getAttribute("loggedInDesg");
        Person p3 = (Person) sess.getAttribute("loggedInPm");
        Person p4 = (Person) sess.getAttribute("loggedInTester");
        Person currUser = null;

        if (p1 != null) {
            currUser = p1;

        } else if (p2 != null) {
            currUser = p2;

        } else if (p3 != null) {
            currUser = p3;

        } else if (p4 != null) {
            currUser = p4;
        } else {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            InputStream is4 = ConnectionManager.class.getResourceAsStream(PROPS_FILENAME);
            Properties props = new Properties();
            props.load(is4);

            mainboard = props.getProperty("trello.mainboard").trim();
            devList = props.getProperty("trello.developmentList").trim();
            //adminUsername = props.getProperty("trello.admin");
        } catch (Exception ex) {
            // unable to load properties file
            String message = "Unable to load '" + PROPS_FILENAME + "'.";
            // System.out.println(message);
            Logger.getLogger(ConnectionManager.class.getName()).log(Level.SEVERE, message, ex);
            throw new RuntimeException(message, ex);
        }
        //1. get all trello board data
        String username = currUser.getUsername();
        String key = TrelloDetailsDAO.retrieveTrelloKey(username);
        String token = TrelloDetailsDAO.retrieveTrelloToken(username);
        //System.out.println("KEY:  " + key + " TOKEN : " + token);
        //first url to call the user's boards

        URL memberUrl = new URL("https://api.trello.com/1/members/" + username + "?fields=username,fullName,url&boards=all&board_fields=name&organizations=all&organization_fields=displayName&key=" + key + "&token=" + token);
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
                if (!projList.contains(name)) {
                    String desc = tempCard.getString("desc").replace("**", "");
                    if (desc.length() >= 8000) {
                        desc = desc.substring(0, 8000);
                    }
                    String due = "";
                    try {
                        due = tempCard.getString("due").substring(0, 10);
                    } catch (Exception e) {
                        Calendar cal = Calendar.getInstance();
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        due = sdf.format(cal.getTime());
                    }
//                    System.out.println(due);
                    String cardId = tempCard.getString("id");
//                    System.out.println("assignby " + assignby);

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
                } else {
                    //get values and update
                    String desc = tempCard.getString("desc").replace("**", "");
                    if (desc.length() >= 8000) {
                        desc = desc.substring(0, 8000);
                    }
                    String due = "";
                    try {
                        due = tempCard.getString("due").substring(0, 10);
                    } catch (Exception e) {
                        Calendar cal = Calendar.getInstance();
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        due = sdf.format(cal.getTime());
                    }
//                    System.out.println(due);
                    String cardId = tempCard.getString("id");
//                    System.out.println("assignby " + assignby);

                    
                    //tcList.add(new TrelloCard(cardId, name, due, desc));
                    Person pm = PersonDAO.retrieveUser(assignby);
                    String url = "";
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
                        
//            for (int i = 0; i < obj.length(); i++) {
                        JSONObject jobj = obj1.getJSONObject(0);
                        url = jobj.getString("url");

//            }
                        System.out.println("url " + url);
                        ProjectDAO.addURL(name, url);
                        
                    } catch (Exception e) {

                    }
                    success = ProjectDAO.updateCardFromTrello(name, assignby, cardId, desc, due, 2, "to be updated", 30, url);
                    //get current developers allocated to this project
                    ArrayList<String> devListForProj = ProjectAllocationDAO.retrieveDev(name);
                    if (!devToAdd.isEmpty()) {
                        for (String devusername : devToAdd) {
                            if(!devListForProj.contains(devusername)){
                                ProjectAllocationDAO.addBasicAllocation(name, devusername);
                            }
                            
                        }

                    }
                    if (!success) {
                        errList.add(name + " could not be added to the Database, please try again later");
                    }
                }

            }
        }
        RequestDispatcher rd = null;
        if (page.equals("viewAllTrelloCards")) {
            rd = request.getRequestDispatcher("viewAllTrelloCards.jsp");
        } else if (page.equals("viewCompletedProjects")) {
            rd = request.getRequestDispatcher("viewCompletedProjects.jsp");
        } else {
            rd = request.getRequestDispatcher("viewTrelloCards.jsp");
        }

        if (errList.isEmpty()) {
            request.setAttribute("sucess", "Database successfully synced with Trello");
            rd.forward(request, response);
            return;
        } else {
            request.setAttribute("errList", errList);
            rd.forward(request, response);
            return;
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
