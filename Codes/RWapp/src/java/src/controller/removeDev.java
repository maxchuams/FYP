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
import javax.servlet.http.HttpSession;
import src.model.Person;
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
        HttpSession sess = request.getSession();
       
        
        Person p1 = (Person) sess.getAttribute("loggedInDev");
        Person p2 = (Person) sess.getAttribute("loggedInDesg");
        Person p3 = (Person) sess.getAttribute("loggedInPm");
        Person p4 = (Person) sess.getAttribute("loggedInTester");
        Person p5 = (Person) sess.getAttribute("loggedInSudo");
        Person currUser = null;

        if (p1 != null) {
            currUser = p1;

        } else if (p2 != null) {
            currUser = p2;

        } else if (p3 != null) {
            currUser = p3;

        } else if (p4 != null) {
            currUser = p4;
        } else if (p5 != null){
            currUser = p5;
            
        }else {
            response.sendRedirect("login.jsp");
            return;
        }
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
        String pmname = request.getParameter("pmname");
        Person pm = PersonDAO.retrieveUser(pmname);
        
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

                    String urlParameters = "key=" + pm.getTrelloKey() +"&token=" + pm.getToken();

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
                    
                    boolean alter = ProjectAllocationDAO.setIsComplete(proj.getName(),d, -1);
                    if(!alter){
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
