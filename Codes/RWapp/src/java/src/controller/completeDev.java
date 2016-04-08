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
public class completeDev extends HttpServlet {

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
        } else if (p5 != null) {
            currUser = p5;

        } else {
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
            for (String devname : dev) {
                boolean complete = ProjectAllocationDAO.setIsComplete(proj.getName(), devname, 1);
                if (!complete) {
                    errList.add("There was an error updating the completion status for " + devname);
                    RequestDispatcher rd = request.getRequestDispatcher("removeDeveloperFromProject.jsp?id=" + id);
                    request.setAttribute("err", errList);
                    rd.forward(request, response);
                    return;
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
            request.setAttribute("success", "Completion status for the developer(s) successfully updated");
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
