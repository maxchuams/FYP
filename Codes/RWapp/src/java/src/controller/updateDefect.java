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
import src.model.Defect;
import src.model.DefectDAO;

/**
 *
 * @author maxchua
 */
public class updateDefect extends HttpServlet {

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
        String pname = request.getParameter("projname");
        String dname = request.getParameter("defname");
        String defid = request.getParameter("id");
        int id = Integer.parseInt(defid);
        String severity = request.getParameter("severity");
        int sev = Integer.parseInt(severity);
        String desc = request.getParameter("desc");
        String complete = request.getParameter("complete");
        int isComplete = Integer.parseInt(complete);
        String pm = request.getParameter("pmname");
      
        boolean success = DefectDAO.updateDefect(id,dname,desc,pm,isComplete,sev);
        
        RequestDispatcher rd = request.getRequestDispatcher("editDefect.jsp");
        if (success){
            request.setAttribute("sucess", "Details successfully changed!");
        } else {
            request.setAttribute("err", "Defect could not be updated");
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
