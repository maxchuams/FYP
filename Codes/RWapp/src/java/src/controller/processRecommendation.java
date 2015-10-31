/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.model.Person;
import src.model.PersonDAO;
import src.model.ProjectAllocationDAO;
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

        String[] dev = request.getParameterValues("dev");
        String projName = request.getParameter("projName");
        String type = request.getParameter("type");
        String priority = request.getParameter("priority");
        String due = request.getParameter("due");
        String desc = request.getParameter("desc");
        String id = request.getParameter("id");

        int priorityInt = Integer.parseInt(priority);

        //Person toAdd = PersonDAO.retrieveUser(dev);
        TrelloCard toAssign = new TrelloCard(projName, id, desc, due, priorityInt, type);
            //toAssign.addMember(toAdd);

        //get todays date
        String today = null;
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
        try {
            today = formatter.format(new Date());

        } catch (Exception e) {
        }

        boolean sucess = TrelloCardDAO.addCard(toAssign);
        boolean insertionSucess = true;
        for (String user : dev) {
            //Person toAdd = PersonDAO.retrieveUser(user);
            boolean allocated = ProjectAllocationDAO.addAllocation(projName, user,today);
            if(!allocated){
                insertionSucess = false;
            }

        }
        
        
        RequestDispatcher rd = request.getRequestDispatcher("viewTrelloCards.jsp");
        if(sucess && insertionSucess){
            request.setAttribute("sucess", "Project sucessfully assigned!");
            rd.forward(request, response);

        } else {
            
            request.setAttribute("err", "Passwords do not match");
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
