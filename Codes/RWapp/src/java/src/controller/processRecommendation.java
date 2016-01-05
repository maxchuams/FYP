/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.model.Person;
import src.model.PersonDAO;
import src.model.Project;
import src.model.ProjectAllocationDAO;
import src.model.ProjectDAO;
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
        ArrayList<String> errList = new ArrayList<String>();
        String[] dev = request.getParameterValues("dev");
//        System.out.println(dev);
        String projName = request.getParameter("projName");
        String type = request.getParameter("type");
        String priority = request.getParameter("priority");
        String due = request.getParameter("due");
//        Date date = null;
//        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
//        try {
//
//            date = formatter.parse(due);
//            System.out.println(date);
//        } catch (ParseException e) {
//            errList.add("Date contains errors");
//        }
        String desc = request.getParameter("desc");
        //trello card id
        String id = request.getParameter("id");
        String pmname = request.getParameter("pmname");
        String psize = request.getParameter("psize");
        int priorityInt = Integer.parseInt(priority);
        boolean success = false;
        if (errList.isEmpty()) {
            Project toAdd = new Project(projName, "", desc, pmname, due, Integer.parseInt(priority), 0, type, Integer.parseInt(psize));
            success = ProjectDAO.add(toAdd);
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
            for (String developer : dev) {
                String[] strarr = developer.split(",");
                //for multiple allocation
                trelloID.add(PersonDAO.retrieveMemberId(strarr[0]));
                //update project allocation DAO
                //HOLD: Need to figure out plan start and plan end
//                String projName, String dev, String dateAllocated, String planStart, String planEnd, String actualStart) {
                
                updateAllocationDAO = ProjectAllocationDAO.addAllocation(projName, strarr[0], strarr[1], strarr[2], strarr[1]);
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
          //make connection to trello:

                String url = "https://api.trello.com/1/cards/" + id + "?";
                URL obj = new URL(url);
                HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();

                //add reuqest header
                con.setRequestMethod("PUT");
                con.setRequestProperty("User-Agent", "Chrome/45.0.2454.101 m");
                con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
                con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
                Person pm = PersonDAO.retrieveUser(pmname);
                String urlParameters = "idMembers=" + memIdList + "&key=" + pm.getTrelloKey() + "&token=" + pm.getToken();

                // Send post request
                con.setDoOutput(true);
                DataOutputStream wr = new DataOutputStream(con.getOutputStream());
                wr.writeBytes(urlParameters);
                wr.flush();
                wr.close();

                int responseCode = con.getResponseCode();
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

        RequestDispatcher rd = request.getRequestDispatcher("viewTrelloCards.jsp");
        if (errList.isEmpty()) {
            request.setAttribute("sucess", "Project sucessfully assigned!");
            rd.forward(request, response);

        } else {

            request.setAttribute("errList", errList);
            rd.forward(request, response);
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
