/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.model.Person;
import src.model.PersonDAO;
import src.model.SkillDAO;

/**
 *
 * @author admin
 */
public class ManageProfile extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            HttpSession sess = request.getSession();
            Person p1 = (Person) sess.getAttribute("loggedInDev");
            Person p2 = (Person) sess.getAttribute("loggedInDesg");
            Person p3 = (Person) sess.getAttribute("loggedInPm");
            String type = null;
            Person currUser = null;
            if (p1 != null) {
                currUser = p1;
                type = "dev";
            } else if (p2 != null) {
                currUser = p2;
                type = "desg";
            } else {
                currUser = p3;
                type = "pm";
            }
            String password1 = request.getParameter("password1");
            String password2 = request.getParameter("password2");
            String skill = request.getParameter("skills");

            if ((password1 == null && password2 == null && skill == null)
                    || ((password1.length() == 0) || password2.length() == 0) && skill.length() == 0) {
                RequestDispatcher rd = null;
                if (type.equals("dev")) {
                    rd = request.getRequestDispatcher("manageDevProfile.jsp");

                } else if (type.equals("pm")) {
                    rd = request.getRequestDispatcher("managePmProfile.jsp");
                } else {
                    rd = request.getRequestDispatcher("manageDesgProfile.jsp");
                }

                request.setAttribute("err", "Fields are empty");
                rd.forward(request, response);

            } else {
                if (password1 != null && password2 != null && password1.length() > 0) {
                    if (password1.equals(password2)) {
                        currUser.setPassword(password1);
                    } else {
                        RequestDispatcher rd = null;

                        if (type.equals("dev")) {
                            rd = request.getRequestDispatcher("manageDevProfile.jsp");

                        } else if (type.equals("pm")) {
                            rd = request.getRequestDispatcher("managePmProfile.jsp");
                        } else {
                            rd = request.getRequestDispatcher("manageDesgProfile.jsp");
                        }
                        request.setAttribute("err", "Passwords do not match");
                        rd.forward(request, response);
                    }
                }

                if (skill != null && skill.length() > 0) {
                    //need to do, validation for duplicate skill
                    
                    boolean added = SkillDAO.addDevSkill(currUser.getUsername(), skill);
                    
                    if (!added){
                        RequestDispatcher rd = request.getRequestDispatcher("manageDevProfile.jsp");
                        request.setAttribute("err", "You already have that skill added!");
                        rd.forward(request, response);

                    }

                }
                
                PersonDAO.updateUser(currUser);

                RequestDispatcher rd = null;

                if (type.equals("dev")) {
                    rd = request.getRequestDispatcher("manageDevProfile.jsp");

                } else if (type.equals("pm")) {
                    rd = request.getRequestDispatcher("managePmProfile.jsp");
                } else {
                    rd = request.getRequestDispatcher("manageDesgProfile.jsp");
                }
                request.setAttribute("sucess", "Changes sucessfully updated!");
                rd.forward(request, response);

            }

        } finally {
            out.close();
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
