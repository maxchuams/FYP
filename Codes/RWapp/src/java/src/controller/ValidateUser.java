/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.model.Person;
import src.model.PersonDAO;

/**
 *
 * @author admin
 */
public class ValidateUser extends HttpServlet {

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
        String hash = "";
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            String username = request.getParameter("username");
            username = username.trim();
            String password = request.getParameter("password");
            
            try {
                MessageDigest md = MessageDigest.getInstance("MD5");
                md.update(password.getBytes());

                byte byteData[] = md.digest();

                //convert the byte to hex format method 1
                StringBuffer sb = new StringBuffer();
                for (int i = 0; i < byteData.length; i++) {
                    sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
                }

               hash = sb.toString();
            } catch (Exception e){
                
            }
            HttpSession session = request.getSession();
            if (session.getAttribute("loggedInDev") != null
                    || session.getAttribute("loggedInTester") != null
                    || session.getAttribute("loggedInPm") != null
                    || session.getAttribute("loggedInDesg") != null
                    || session.getAttribute("loggedInSudo") != null) {
                response.sendRedirect("index.jsp");
            } else {
                Person person = PersonDAO.retrieveUser(username);

                if (person != null && person.getPassword().equals(hash)) {
                    //redirect to webpage
                    if (person.getType().equals("c")) {
                        session.setAttribute("loggedInDev", person);
                        response.sendRedirect("index.jsp");
                    } else if (person.getType().equals("p")) {
                        session.setAttribute("loggedInPm", person);
                        response.sendRedirect("index.jsp");
                    } else if (person.getType().equals("d")) {
                        session.setAttribute("loggedInDesg", person);
                        response.sendRedirect("index.jsp");
                    } else if (person.getType().equals("s")) {
                        session.setAttribute("loggedInSudo", person);
                        response.sendRedirect("index.jsp");
                    } else if (person.getType().equals("t")) {
                        session.setAttribute("loggedInTester", person);
                        response.sendRedirect("index.jsp");
                    }
                } else {
                    //send error message
                    request.setAttribute("errorMsg", "Wrong username/password");

                    RequestDispatcher view = request.getRequestDispatcher("login.jsp");
                    view.forward(request, response);
                }

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
