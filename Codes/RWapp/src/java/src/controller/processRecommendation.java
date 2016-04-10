/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;
import src.model.Person;
import src.model.PersonDAO;
import src.model.Project;
import src.model.ProjectAllocationDAO;
import src.model.RecommedationDAO;
import src.model.ProjectDAO;
import src.model.NotificationDAO;
import src.model.Recommendation;
import src.model.TrelloBoard;
import src.model.TrelloCard;
import src.model.TrelloCardDAO;

/**
 *
 * @author maxchua
 */
public class processRecommendation extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sess = request.getSession();

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
        ArrayList<String> errList = new ArrayList<String>();
        String devList = request.getParameter("dev");
        boolean manual = false;
        if(devList == null){
            manual = true;
            String[] devnames = request.getParameterValues("devM");
            devList = 1 + "";
            for(String devs: devnames){
                devList+= "," + devs;
            }
            
        }

        ArrayList<ArrayList<Recommendation>> rlist = (ArrayList<ArrayList<Recommendation>>) sess.getAttribute("rList");
        sess.removeAttribute("rList");

        String[] dev = devList.split(",");

        String projName = request.getParameter("projName");
        String type = request.getParameter("type");
        String priority = request.getParameter("priority");
        String due = request.getParameter("due");

        String desc = request.getParameter("desc");
        //trello card id
        String id = request.getParameter("id");
        String pmname = request.getParameter("pmname");
        String psize = request.getParameter("psize");
        int priorityInt = Integer.parseInt(priority);
        boolean success = false;
        Person pm = PersonDAO.retrieveUser(pmname);
        if (errList.isEmpty()) {
            //to add in code to check if project exist
            ArrayList<String> pList = ProjectDAO.retrieveAllProjectNames();
            Project toAdd = new Project(projName, id, desc, pmname, due, Integer.parseInt(priority), 0, type, Integer.parseInt(psize));
            if (pList.contains(projName)){
               success =  ProjectDAO.updateProject(pmname, due, Integer.parseInt(priority), 0, Integer.parseInt(psize), type, projName);
            } else {
                success = ProjectDAO.add(toAdd);
            }
            
            
            try {
                URL memberUrl = new URL("https://api.trello.com/1/cards/" + id + "/attachments?fields=url&key=" + pm.getTrelloKey() + "&token=" + pm.getToken());
                //System.out.println(memberUrl);

                URLConnection con = memberUrl.openConnection();
                InputStream is = con.getInputStream();
                BufferedReader br = new BufferedReader(new InputStreamReader(is));

                String line = null;
                String jsonOutput1 = "";

                // read each line and throw string into JSONObject
                while ((line = br.readLine()) != null) {
                    jsonOutput1 += line;

                }

                JSONArray obj = new JSONArray(jsonOutput1);
                //masterboardID - id for masterboard need this for the URL
                String url = "";
//            for (int i = 0; i < obj.length(); i++) {
                JSONObject jobj = obj.getJSONObject(0);
                url = jobj.getString("url");

//            }
                System.out.println("url " + url);
                ProjectDAO.addURL(projName, url);
            } catch (Exception e) {

            }
        }

        //TO DO:
        //1. add new project to the project table
        if (!success) {
            errList.add("Project could not be added to Database");
        } else if (errList.isEmpty()) {
            //-if successful
            //need to pull the trello id:
            ArrayList<String> trelloID = new ArrayList<String>();
            trelloID.add(PersonDAO.retrieveMemberId(pmname));
            boolean updateAllocationDAO = false;
            // add to allocation table
            for (int i = 1; i < dev.length - 1; i += 3) {
                //for multiple allocation
                trelloID.add(PersonDAO.retrieveMemberId(dev[i]));
                //update project allocation DAO
                //HOLD: Need to figure out plan start and plan end
                //String projName, String dev, String dateAllocated, String planStart, String planEnd, String actualStart) {

                updateAllocationDAO = ProjectAllocationDAO.addAllocation(projName, dev[i], dev[i + 1], dev[i + 2], dev[i + 1]);

            }
            if (updateAllocationDAO) {
                //update trello
                String memIdList = "";
                for (int i = 0; i < trelloID.size(); i++) {
                    if (i == trelloID.size() - 1) {
                        memIdList += trelloID.get(i);
                    } else {
                        memIdList += trelloID.get(i) + ",";
                    }

                }

                //https://api.trello.com/1/cards/568c92514a3b3bcdcbc42106?fields=idMembers&key=7e35111227918de8a37f8c20844ed555&token=f7f588e4ce535adc2f08539a56b4b7d24caad79d0e7142cebb564fe979cbc565
                //make connection to trello:
                //get exisiting members, store on the list
                URL memberUrl = new URL("https://api.trello.com/1/cards/" + id + "?fields=idMembers&key=" + pm.getTrelloKey() + "&token=" + pm.getToken());
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
                JSONArray memArr = obj.getJSONArray("idMembers");
                //iterate through the user's boards and store into an arraylist first

                //masterboardID - id for masterboard need this for the URL
                for (int i = 0; i < memArr.length(); i++) {

                    String memId = memArr.getString(i);
                    if (!memIdList.contains(memId)) {
                        memIdList += "," + memId;
                    }

                }

                String url = "https://api.trello.com/1/cards/" + id + "?";
                URL obj1 = new URL(url);
                HttpsURLConnection con1 = (HttpsURLConnection) obj1.openConnection();

                //add reuqest header
                con1.setRequestMethod("PUT");
                con1.setRequestProperty("User-Agent", "Chrome/45.0.2454.101 m");
                con1.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
                con1.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

                String urlParameters = "idMembers=" + memIdList + "&key=" + pm.getTrelloKey() + "&token=" + pm.getToken();

                // Send post request
                con1.setDoOutput(true);
                DataOutputStream wr = new DataOutputStream(con1.getOutputStream());
                wr.writeBytes(urlParameters);
                wr.flush();
                wr.close();

                int responseCode = con1.getResponseCode();
                System.out.println("\nSending 'POST' request to URL : " + url);
                System.out.println("Post parameters : " + urlParameters);
                System.out.println("Response Code : " + responseCode);

                BufferedReader in = new BufferedReader(
                        new InputStreamReader(con.getInputStream()));
                String inputLine;
                StringBuffer response1 = new StringBuffer();

                while ((inputLine = in.readLine()) != null) {
                    response1.append(inputLine);
                }
                in.close();

            } else {
                errList.add("Project could not be allocated to the selected Developer");
            }
        }
        System.out.println("projectname: " + projName);
        
        if (errList.isEmpty()) {
            //i start here
            NotificationDAO notificationDAO = new NotificationDAO();
            for (int i = 1; i < dev.length - 1; i += 3) {
             notificationDAO.addNotification(dev[i], "assignedProject", projName);
            }
            //
            
            RequestDispatcher rd = request.getRequestDispatcher("viewProjectInfo.jsp?projectName=" + URLEncoder.encode(projName, "UTF-8"));
            if(!manual && rlist != null){
              RecommedationDAO.logRecommendation(rlist, rlist.get(Integer.parseInt(dev[0].trim())-1), projName, Integer.parseInt(dev[0].trim()));
            }
            else if(manual){
              RecommedationDAO.logRecommendation(new ArrayList<ArrayList<Recommendation>>(), new ArrayList<Recommendation>(), projName, -1);
            }
            request.setAttribute("sucess", "Developer(s) successfully assigned to project " + projName);
            rd.forward(request, response);
            return;

        } else {
            RequestDispatcher rd = request.getRequestDispatcher("viewUnassignedCards.jsp");
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
