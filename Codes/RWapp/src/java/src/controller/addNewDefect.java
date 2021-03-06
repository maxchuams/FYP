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
import java.util.HashMap;
import src.model.NotificationDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.model.Defect;
import src.model.DefectCommitBy;
import src.model.DefectCommitByDAO;
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
        
        HashMap<String,String> toReturn = new HashMap<String,String>();
        String projname = request.getParameter("projectname").trim();
        toReturn.put("projectname", projname);
        String defname = request.getParameter("defname").trim();
        toReturn.put("defname", defname);
        String desc = request.getParameter("desc").trim();
        toReturn.put("desc", desc);
        String sev = request.getParameter("severity");
        toReturn.put("severity", sev);
        String pmname = request.getParameter("pmName");
        
        String duedateStr = request.getParameter("duedate");
        toReturn.put("duedate", duedateStr);
        String filter = request.getParameter("filter");
        Date duedate = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(false);
        String[] blameArr = request.getParameterValues("blame");
        ArrayList<String> errList = new ArrayList<String>();
        if (projname == null) {
            errList.add("Please fill in a project name");
        }
        
        if(blameArr == null || blameArr.length == 0){
            errList.add("Please select a developer that commit the defect");
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
                request.setAttribute("formdetails", toReturn);
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
                    if(success){
                        int id = DefectDAO.retrieveDefectByName(defname, projname).getId();
                        for(String b : blameArr){
                            boolean blameSuccess = DefectCommitByDAO.addBlame(new DefectCommitBy(id,b));
                            if(!blameSuccess){
                                errList.add("Defect cannot be blamed, please try again later");
                            }
                        }
                    }
                }
            } else if ("yes".equals(filter)) {
                int severity = Integer.parseInt(sev);
                success = DefectDAO.addDefect(projname, defname, desc, pmname, severity, duedateStr, devList.get(0));
                if(success){
                        int id = DefectDAO.retrieveDefectByName(defname, projname).getId();
                        for(String b : blameArr){
                            boolean blameSuccess = DefectCommitByDAO.addBlame(new DefectCommitBy(id,b));
                            if(!blameSuccess){
                                errList.add("Defect cannot be blamed, please try again later");
                            }
                        }
                    }
            }

            if (success) {
                Defect d = DefectDAO.retrieveDefectByName(defname,projname);
                int id = d.getId();
                RequestDispatcher rd = request.getRequestDispatcher("viewDefectInfo.jsp?defectId=" + id);
                // i start from here
                   NotificationDAO notifDAO = new NotificationDAO();
                   notifDAO.addNotification(d.getAssignto(), "assignedDefect" + id, d.getProjectName());
                //
                request.setAttribute("sucess", "Defect " + defname + "  from Project " + projname + " has been successfully added into the system");
                rd.forward(request, response);
                return;
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("addDefect.jsp");
                request.setAttribute("err1", errList);
                request.setAttribute("err", "Database Error: Defect could not be added into the system");
                request.setAttribute("formdetails", toReturn);
                rd.forward(request, response);
                return;
            }

        } else {
            RequestDispatcher rd = request.getRequestDispatcher("addDefect.jsp");
            request.setAttribute("err1", errList);
            request.setAttribute("formdetails", toReturn);
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
