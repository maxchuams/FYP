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
import src.model.ProjectDAO;

/**
 *
 * @author maxchua
 */
public class updateProject extends HttpServlet {

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
        
        String pname = request.getParameter("pname");
        
        try{
        String assignedby = request.getParameter("assignedby");
        String due = request.getParameter("duedate");
        String priority = request.getParameter("priority");
        int pInt = Integer.parseInt(priority);
        String iscomplete= request.getParameter("iscomplete");
        int cInt = Integer.parseInt(iscomplete);
        String days = request.getParameter("days");
        int dInt = Integer.parseInt(days);
        String type = request.getParameter("type");
        
        boolean success = ProjectDAO.updateProject(assignedby, due, pInt, cInt, dInt, type, pname);
        if(success){
             RequestDispatcher rd = request.getRequestDispatcher("editProject.jsp?pname="+pname);
            request.setAttribute("success", "Project successfully updated");
            rd.forward(request, response);
            return;
        } else {
             RequestDispatcher rd = request.getRequestDispatcher("editProject.jsp?pname="+pname);
            request.setAttribute("err", "Project could not be updated. Please try again!");
            rd.forward(request, response);
            return;
        }
        } catch (Exception e){
            RequestDispatcher rd = request.getRequestDispatcher("editProject.jsp?pname="+pname);
            request.setAttribute("err", "Project could not be updated. Please try again!");
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
