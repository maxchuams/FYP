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
import javax.servlet.http.HttpSession;
import src.model.Person;
import src.model.ProjectDAO;

/**
 *
 * @author maxchua
 */
public class editProjectType extends HttpServlet {

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
        
        HttpSession sess = request.getSession();
       
        
        Person p1 = (Person) sess.getAttribute("loggedInDev");
        Person p2 = (Person) sess.getAttribute("loggedInDesg");
        Person p3 = (Person) sess.getAttribute("loggedInPm");
        Person p4 = (Person) sess.getAttribute("loggedInTester");
        Person currUser = null;

        if (p1 != null) {
            currUser = p1;

        } else if (p2 != null) {
            currUser = p2;

        } else if (p3 != null) {
            currUser = p3;

        } else if (p4 != null) {
            currUser = p4;
        } else {
            response.sendRedirect("login.jsp");
        }
        String[] type = request.getParameterValues("type");

        ArrayList<String> errList = new ArrayList<String>();
        if (type == null || type.length == 0) {
            errList.add("Please select a type to replace");
        }

        String replacedText = request.getParameter("replacedText");
        
        String typeOption = request.getParameter("typeOption");
        
        String toChange = "";
        if (replacedText != null && replacedText.length() > 0) {
            toChange = replacedText;
        } else if (typeOption != null && typeOption.length() >0) {
            toChange = typeOption;
           
            
        } else {
            errList.add("Please select a replacement type");
        }

        RequestDispatcher rd = request.getRequestDispatcher("updateProjectType.jsp");
        if (errList.isEmpty()) {
            boolean success = false;
            for (String s : type) {
                success = ProjectDAO.replaceType(s, toChange);
                if (!success) {
                    //handle
                    request.setAttribute("err", "Something happened, could not connect to the database!");
                    rd.forward(request, response);
                    return;
                }
            }
            //return with success message
            request.setAttribute("success", "Changes to the project type made successfully!");
            rd.forward(request, response);
            return;
        } else {
            //handle
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
