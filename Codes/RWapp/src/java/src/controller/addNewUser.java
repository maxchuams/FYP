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
import java.sql.Array;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.catalina.tribes.util.Arrays;
import src.model.Developer;
import src.model.DeveloperDAO;
import src.model.Person;
import src.model.PersonDAO;

/**
 *
 * @author maxchua
 */
public class addNewUser extends HttpServlet {

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

        String username = request.getParameter("username");
        String pw1 = request.getParameter("password").trim();
        String pw2 = request.getParameter("password2").trim();
        String type = request.getParameter("type");
        String trellokey = request.getParameter("trellokey").trim();
        String trellotoken = request.getParameter("trellotoken").trim();
        String nationality = request.getParameter("country");
        String eDate = request.getParameter("eDate");
        
       
        boolean valid = true;
        ArrayList<String> errors = new ArrayList<String>();

        //test username
        Person isExist = PersonDAO.retrieveUser(username);
        if (isExist != null) {
            valid = false;
            errors.add("Username has already been chosen, please choose another one!");
        }
        //test password
        if (pw1 == null || pw2 == null || pw1.length() == 0 || pw2.length() == 0) {
            errors.add("Passwords cannot be empty");
            valid = false;
        } else if (!pw1.equals(pw2)) {
            valid = false;
            errors.add("Passwords do not match");
        }
        //validate trell0 key and token if not null
        if (trellotoken != null && trellotoken.length() > 0 && trellokey != null && trellokey.length()>0) {
            try {

                URL memberUrl = new URL("https://api.trello.com/1/members/" + username + "?fields=username,fullName,url&boards=all&board_fields=name&organizations=all&organization_fields=displayName&key=" + trellokey + "&token=" + trellotoken);
                //System.out.println(memberUrl);

                URLConnection con = memberUrl.openConnection();
                
                InputStream is = con.getInputStream();
                BufferedReader br = new BufferedReader(new InputStreamReader(is));
            } catch (IOException e) {
                errors.add("Invalid trello key and/or token");
                valid = false;
            }
        }
        if (trellokey == null || trellokey.length() == 0) {
            trellokey = "";
        }

        if (trellotoken == null || trellotoken.length() == 0) {
            trellotoken = "";
        }
        

        RequestDispatcher rd = request.getRequestDispatcher("addUsers.jsp?username="+username);
        if (valid) {
            if (type.equals("c")) {
                Developer toAdd = new Developer(username, pw1, type, trellokey, trellotoken, eDate, nationality);
                boolean sucess1 = PersonDAO.addPerson((Person) toAdd);
                boolean sucess2 = DeveloperDAO.addDeveloper(toAdd);
                if (sucess1 && sucess2) {
                    request.setAttribute("sucess", "User sucessfully added!");
                } else {
                    request.setAttribute("err", "User could not be added into the database");
                }
                rd.forward(request, response);
            } else {
                Person toAdd = new Person(username, pw1, type, trellokey, trellotoken);
                boolean sucess = PersonDAO.addPerson(toAdd);
                if (sucess) {
                    request.setAttribute("sucess", "User sucessfully added!");
                } else {
                    request.setAttribute("err", "User could not be added into the database");
                }
                rd.forward(request, response);
            }

        } else {
            String toReturn = errors.toString();
            toReturn.replace(",", "");
            request.setAttribute("err", toReturn);
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
