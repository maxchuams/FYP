/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.model.DefectDAO;
import src.model.Person;

/**
 *
 * @author maxchua
 */
public class defectComplete extends HttpServlet {

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
        }
        String defId = request.getParameter("id");
        int id = Integer.parseInt(defId);
        String casenum = request.getParameter("case");
        String status = "";
        boolean  success = false;
        if (casenum.equals("1")){
            //pm marks complete
            success = DefectDAO.markComplete(id);
            status = "marked as complete by PM";
        } else if (casenum.equals("0")){
            //pm deletes defect
            success = DefectDAO.deleteDefect(id);
            status = "deleted";
        } else if (casenum.equals("2")){
            //dev marks complete
            success = DefectDAO.devMarkComplete(id);
            status = "marked by developer as complete";
        
        }
        
        
        RequestDispatcher rd = null;
        if (casenum.equals("2")){
            rd = request.getRequestDispatcher("viewDefects.jsp");
        } else {
            rd = request.getRequestDispatcher("manageDefects.jsp");
        }
        
        if(success){
            request.setAttribute("sucess", "Defect has been " + status);
        } else{
            request.setAttribute("err", "Defect could not be " + status);
        }
        
        rd.forward(request,response);
        return;
        
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
