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
import src.model.TrelloConfigDAO;
import src.model.TrelloProperties;


/**
 *
 * @author maxchua
 */
public class modifyTrelloProperties extends HttpServlet {

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
        String mainboard = request.getParameter("mainboard");
        if (mainboard == null) {
            errList.add("Main board field cannot be empty");
        }
        String developmentlist = request.getParameter("developmentlist");
        if (developmentlist == null) {
            errList.add("Development List field cannot be empty");
        }
        String postdevlist = request.getParameter("postdevlist");
        if (postdevlist == null) {
            errList.add("Post development list field cannot be empty");
        }
        String admin = request.getParameter("admin");
        if (admin == null) {
            errList.add("Admin list cannot be empty");
        }
        RequestDispatcher rd = request.getRequestDispatcher("trelloProperties.jsp");
        if (errList.isEmpty()) {
            TrelloProperties tp = new TrelloProperties(mainboard, developmentlist, postdevlist, admin);
            boolean success = TrelloConfigDAO.updateConfig(tp);
            if (success) {
                request.setAttribute("success", "Properties file successfully updated");
                rd.forward(request, response);
                return;
            } else {
                request.setAttribute("err", "Database error, please try again!");
                rd.forward(request, response);
                return;
            }

        } else {
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
