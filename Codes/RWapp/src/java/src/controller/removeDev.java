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
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.model.PersonDAO;
import src.model.Project;
import src.model.ProjectAllocationDAO;
import src.model.ProjectDAO;

/**
 *
 * @author maxchua
 */
public class removeDev extends HttpServlet {

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
        boolean success = true;
        ArrayList<String> errList = new ArrayList<String>();
        String id = request.getParameter("projectId");
        Project proj = null;
        if (id == null) {
            errList.add("Something went wrong the the Project ID");
            success = false;
        } else {
            proj = ProjectDAO.retrieveProjectById(id);
        }
        
        String[] dev = request.getParameterValues("dev");
        if (dev == null || dev.length == 0) {
            errList.add("Please select a developer");
            success = false;
        }

        if (success) {
            //call trello
            for (String d : dev) {
                try {
                    String pid = PersonDAO.retrieveMemberId(d);
                    String url = "https://api.trello.com/1/cards/" + id + "/idMembers/" + pid +"?";
                    URL obj = new URL(url);
                    HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();

                    //add reuqest header
                    con.setRequestMethod("DELETE");
                    con.setRequestProperty("User-Agent", "Chrome/45.0.2454.101 m");
                    con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
                    con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

                    String urlParameters = "key=7e35111227918de8a37f8c20844ed555&token=f7f588e4ce535adc2f08539a56b4b7d24caad79d0e7142cebb564fe979cbc565";

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

                    //print result
                    System.out.println(response1.toString());
                    
                    boolean delete = ProjectAllocationDAO.delete(d, proj.getName());
                    if(!delete){
                        errList.add(d + " cannot be deleted!");
                    }
                } catch (Exception e) {
                    errList.add("System cannot send details to Trello, please try again later!");
                    //route back to the deletepage
                }
            }
        }
        
        
        if (!errList.isEmpty()) {
            RequestDispatcher rd = request.getRequestDispatcher("removeDeveloperFromProject.jsp?id=" + id);
            request.setAttribute("err", errList);
            rd.forward(request, response);
            return;
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("viewTrelloCards.jsp");
            request.setAttribute("success", "Developer(s) successfully removed from project");
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