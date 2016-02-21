/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.controller;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.model.GanttDAO;
import src.model.Gnatt;
import src.model.Person;

/**
 *
 * @author calvin
 */
@WebServlet(name = "GnattJSON", urlPatterns = {"/GnattJSON"})
public class GnattJSON extends HttpServlet {

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
        try {
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
            PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */

            GanttDAO gdao = new GanttDAO();
            ArrayList<Gnatt> ff = gdao.retrieveGnattPm("xx");

            JsonObject jO = new JsonObject();
            JsonArray jA = new JsonArray();
            String dev = "";
            int count = -1;
            for (Gnatt cb : ff) {
                JsonObject jj = new JsonObject();
                long duration = (cb.getPlanend().getTime() - cb.getPlanstart().getTime()) / 1000 * 60 * 60 * 24;
                if (dev.equals(cb.getDeveloperName())) {

                    jj.addProperty("id", count);
                    jj.addProperty("name", cb.getDeveloperName());
                    jj.addProperty("Code", cb.getDeveloperName());
                    jj.addProperty("level", 1);
                    jj.addProperty("status", "STATUS_ACTIVE");
                    jj.addProperty("canWrite", true);
                    jj.addProperty("start", cb.getPlanstart().getTime());
                    jj.addProperty("duration", duration);
                    jj.addProperty("end", cb.getPlanend().getTime());
                    jj.addProperty("startISMilestone", true);
                    jj.addProperty("endISMilestone", false);
                    jj.addProperty("collapsed", false);
                    jj.addProperty("hasChild", false);

                } else {

                    jj.addProperty("id", count);
                    jj.addProperty("name", cb.getDeveloperName());
                    jj.addProperty("Code", cb.getDeveloperName());
                    jj.addProperty("level", 0);
                    jj.addProperty("status", "STATUS_ACTIVE");
                    jj.addProperty("canWrite", true);
                    jj.addProperty("start", cb.getPlanstart().getTime());
                    jj.addProperty("duration", duration);
                    jj.addProperty("end", cb.getPlanend().getTime());
                    jj.addProperty("startISMilestone", true);
                    jj.addProperty("endISMilestone", false);
                    jj.addProperty("collapsed", false);
                    jj.addProperty("hasChild", false);
                    dev = cb.getDeveloperName();
                }
                jA.add(jj);
                count = count - 1;
            }
            jO.add("tasks", jA);
            jO.addProperty("selectedRow", 0);
            jO.addProperty("canWrite", true);
            jO.addProperty("canWriteOnParent", true);
        }
        catch(Exception e){}
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
