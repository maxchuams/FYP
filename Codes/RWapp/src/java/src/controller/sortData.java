/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class sortData extends HttpServlet {

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
        String caseType = request.getParameter("case");
        String sortby = request.getParameter("sortby");
        if(sortby == null)
            sortby = "";
        String filterby = request.getParameter("filter");
        if (filterby == null)
            filterby="";
        
        String filterText = "";
        if(filterby.equals("projectname")){
            filterText = request.getParameter("inputP");
        } else if (filterby.equals("severity")){
            filterText = request.getParameter("inputS");
        }
          
        
        String username= request.getParameter("username");
        
        ArrayList<Defect> dList = null;
        RequestDispatcher rd= null;
        if (caseType.equals("pm")) {
            dList = DefectDAO.filterSortDefectsPm(filterby, filterText, sortby, username);
            rd = request.getRequestDispatcher("sortedDefects.jsp");
        } else if(caseType.equals("dev")){
            dList= DefectDAO.filterSortDefectsDev(filterby, filterText, sortby, username);
            rd= request.getRequestDispatcher("viewSortedDefects.jsp");
        }

         
        if (dList != null && !dList.isEmpty()) {
            request.setAttribute("sucess", dList);
        } else {
            request.setAttribute("err", "No data found, please try again!");
        }
        rd.forward(request, response);
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
