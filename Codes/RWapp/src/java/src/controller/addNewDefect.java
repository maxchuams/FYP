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
public class addNewDefect extends HttpServlet {

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
        String projname = request.getParameter("projectname").trim();
        String defname = request.getParameter("defname").trim();
        String desc = request.getParameter("desc").trim();
        String sev = request.getParameter("severity");
            
        String pmname = request.getParameter("pmName");
        
        ArrayList<String> errList = new ArrayList<String>();
        if(projname == null){
            errList.add("Please fill in a project name");
        }
        if (defname== null){
            errList.add("Please fill in the name of the defect");
        }
        if (desc == null || desc.length()==0){
            errList.add("Please give a descriotion of the defect");
        }
        if (sev == null){
            errList.add("Please give a severity rating for the defect");
        }
        int severity = Integer.parseInt(sev);
        
        boolean success = DefectDAO.addDefect(projname, defname, desc, pmname, severity);
        RequestDispatcher rd = request.getRequestDispatcher("addDefect.jsp");
        if (!errList.isEmpty()){
            request.setAttribute("err1", errList );
              rd.forward(request,response);
              return;
        } else if(!success){
            request.setAttribute("err", "Defect could not be added into the System");
              rd.forward(request,response);
              return;
        } else if(success){
            request.setAttribute("sucess", "Defect "+ defname+ "  from Project " + projname + " has been added into the system.");
              rd.forward(request,response);
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
