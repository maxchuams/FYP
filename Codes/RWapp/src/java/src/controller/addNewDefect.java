/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
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
import src.model.ProjectAllocationDAO;

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
        String projname = request.getParameter("projectname").trim();
        String defname = request.getParameter("defname").trim();
        String desc = request.getParameter("desc").trim();
        String sev = request.getParameter("severity");
        String pmname = request.getParameter("pmName");
        String duedateStr = request.getParameter("duedate");
        String filter = request.getParameter("filter");
        Date duedate = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(false);

        ArrayList<String> errList = new ArrayList<String>();
        if (projname == null) {
            errList.add("Please fill in a project name");
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

        if (defname == null) {
            errList.add("Please fill in the name of the defect");
        }
        if (desc == null || desc.length() == 0) {
            errList.add("Please give a description of the defect");
        }
        if (sev == null) {
            errList.add("Please give a severity rating for the defect");
        }

        boolean success = false;
        if (errList.isEmpty()) {
            ArrayList<String> devList = ProjectAllocationDAO.retrieveDev(projname);
            if (devList.size() > 1 && filter.equals("yes")) {
                //return error
                RequestDispatcher rd = request.getRequestDispatcher("addDefect.jsp");
                request.setAttribute("err", "Project selected contains more than 1 developer. Please select no and select a developer as well.");
                rd.forward(request, response);
                return;
                
            }  else if ("no".equals(filter) || devList.size()==0 ) {
                String devname = request.getParameter("devname");
                if (devname == null) {
                    errList.add("Please select a developer");
                } else if(devList.size()==0){
                    errList.add("No developer pre-assign to this project. Manually select one");
                }else {
                    int severity = Integer.parseInt(sev);
                    success = DefectDAO.addDefect(projname, defname, desc, pmname, severity, duedateStr, devname);
                }
            } else if ("yes".equals(filter)) {
                int severity = Integer.parseInt(sev);
                success = DefectDAO.addDefect(projname, defname, desc, pmname, severity, duedateStr, devList.get(0));
            }

            if (success) {
                Defect d = DefectDAO.retrieveDefectByName(defname,projname);
                int id = d.getId();
                RequestDispatcher rd = request.getRequestDispatcher("viewDefectInfo.jsp?defectId=" + id);
                request.setAttribute("sucess", "Defect " + defname + "  from Project " + projname + " has been successfully added into the system");
                rd.forward(request, response);
                return;
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("addDefect.jsp");
                request.setAttribute("err1", errList);
                request.setAttribute("err", "Database Error: Defect could not be added into the system");
                rd.forward(request, response);
                return;
            }

        } else {
            RequestDispatcher rd = request.getRequestDispatcher("addDefect.jsp");
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
