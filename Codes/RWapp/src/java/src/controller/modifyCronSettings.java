/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.quartz.CronScheduleBuilder;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.TriggerKey;
import org.quartz.impl.StdSchedulerFactory;

/**
 *
 * @author maxchua
 */
public class modifyCronSettings extends HttpServlet {

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
        ArrayList<String> errList = new ArrayList<String>();
        String updateby = request.getParameter("updateby");
        if (updateby==null || updateby.length() == 0){
            errList.add("Please select an update by method");
            RequestDispatcher rd=  request.getRequestDispatcher("cronSettings.jsp");
            request.setAttribute("errList", errList);
            rd.forward(request, response);
            return;
        } else if (updateby.equals("mins")){
            
            
        } else if (updateby.equals("hourly")){
            
        } else if (updateby.equals("daily")){
            
        } else if (updateby.equals("weekly")){
            
        }
       

        ServletContext ctx = request.getServletContext();
        StdSchedulerFactory factory = (StdSchedulerFactory) ctx.getAttribute(QuartzListener.QUARTZ_FACTORY_KEY);
        Scheduler scheduler = null;
        try {
            scheduler = factory.getScheduler();
        } catch (SchedulerException ex) {
            errList.add("Error connecting to scheduler");
            Logger.getLogger(modifyCronSettings.class.getName()).log(Level.SEVERE, null, ex);
        }
        Trigger trigger = TriggerBuilder.newTrigger().withIdentity("simple").withSchedule(
                CronScheduleBuilder.cronSchedule(cronex)).startNow().build();
        try {
            Date date = scheduler.rescheduleJob(new TriggerKey("simple"), trigger);
        } catch (SchedulerException ex) {
            errList.add("Error updating scheduler");
            Logger.getLogger(modifyCronSettings.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Generate a CRON expression is a string comprising 6 or 7 fields separated
     * by white space.
     *
     * @param seconds mandatory = yes. allowed values = {@code  0-59    * / , -}
     * @param minutes mandatory = yes. allowed values = {@code  0-59    * / , -}
     * @param hours mandatory = yes. allowed values = {@code 0-23   * / , -}
     * @param dayOfMonth mandatory = yes. allowed values =
     * {@code 1-31  * / , - ? L W}
     * @param month mandatory = yes. allowed values =
     * {@code 1-12 or JAN-DEC    * / , -}
     * @param dayOfWeek mandatory = yes. allowed values =
     * {@code 0-6 or SUN-SAT * / , - ? L #}
     * @param year mandatory = no. allowed values = {@code 1970–2099    * / , -}
     * @return a CRON Formatted String.
     */
    private static String generateCronExpression(final String seconds, final String minutes, final String hours,
            final String dayOfMonth,
            final String month, final String dayOfWeek, final String year) {
        return String.format("%1$s %2$s %3$s %4$s %5$s %6$s %7$s", seconds, minutes, hours, dayOfMonth, month, dayOfWeek, year);
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
