/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.model.Person;
import src.model.PersonDAO;

/**
 *
 * @author maxchua
 */
public class updateTrelloDetails extends HttpServlet {

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
        String username = request.getParameter("user");
        String trellokey = request.getParameter("key");
        String trellotoken = request.getParameter("token");

        //in future, need to auth the trello key and token?
        System.out.println(username);
        Person toUpdate = PersonDAO.retrieveUser(username);
        RequestDispatcher view = request.getRequestDispatcher("manageUser.jsp");
        try {
            URL memberUrl = new URL("https://api.trello.com/1/members/" + username + "?fields=username,fullName,url&boards=all&board_fields=name&organizations=all&organization_fields=displayName&key=" + trellokey + "&token=" + trellotoken);
            //System.out.println(memberUrl);

            URLConnection con = memberUrl.openConnection();

            InputStream is = con.getInputStream();
            BufferedReader br = new BufferedReader(new InputStreamReader(is));
        } catch (IOException e) {
            request.setAttribute("err", "Invalid trello key and/or token");

            view.forward(request, response);
        }

        toUpdate.setToken(trellotoken);
        toUpdate.setTrelloKey(trellokey);

        boolean update = PersonDAO.updateUser(toUpdate);

        if (update) {
            request.setAttribute("sucess", "Changes sucessfully updated!");
            view.forward(request, response);
        } else {
            request.setAttribute("err", "Trello details could not be updated, please contact team Pjs :)");

            view.forward(request, response);
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
