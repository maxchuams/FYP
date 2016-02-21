/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.model.Defect;
import src.model.DefectDAO;
import src.model.Person;

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
            return;
        }
        String pname = request.getParameter("projname");
        String dname = request.getParameter("defname");
        String defid = request.getParameter("id");
        int id = Integer.parseInt(defid);
        String severity = request.getParameter("severity");
        int sev = 0;
        String desc = request.getParameter("desc");
        String complete = request.getParameter("complete");
        int isComplete = Integer.parseInt(complete);
        String pm = request.getParameter("pmname");
        String duedateStr = request.getParameter("duedate");
        String devname = request.getParameter("devname");

        ArrayList<String> errList = new ArrayList<String>();

        Date duedate = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(false);

        if (dname == null) {
            errList.add("Please fill in a defect name");
        }

        //validate date to be after today
        if (duedateStr == null) {
            errList.add("Please fill in a due date");
        } else {
            try {
                duedate = sdf.parse(duedateStr);
            } catch (Exception e) {
                System.out.println("Date object parsing error");
            }
            if (duedate.before(new Date())) {
                errList.add("Date cannot be before today");
            }
        }
        if (desc == null || desc.length() == 0) {
            errList.add("Please give a description of the defect");
        }
        if (severity == null) {
            errList.add("Please give a severity rating for the defect");
        }
        if (complete == null) {
            errList.add("Please set the completion status for the defect");
        } else {
            sev = Integer.parseInt(severity);
        }
        if (devname == null){
            errList.add("Please assign a developer");
        }

        boolean success = false;

        if (errList.size() == 0) {

            success = DefectDAO.updateDefect(id, dname, desc, pm, isComplete, sev, duedateStr, devname);
            if (success) {
                RequestDispatcher rd = request.getRequestDispatcher("manageDefects.jsp");
                request.setAttribute("sucess", "Details successfully changed!");
                rd.forward(request, response);
                return;
            }else{
                RequestDispatcher rd = request.getRequestDispatcher("editDefect.jsp");
                request.setAttribute("id", defid);
                request.setAttribute("err", "Database Error: Defect could not be added into the system");
                rd.forward(request, response);
                return;
            }
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("editDefect.jsp");
            request.setAttribute("id", defid);
            request.setAttribute("err1", errList);
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
