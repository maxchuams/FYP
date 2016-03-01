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
        String cronex = "";
        String updateby = request.getParameter("updateby");
        if (updateby == null || updateby.length() == 0) {
            errList.add("Please select an update by method");
            RequestDispatcher rd = request.getRequestDispatcher("cronSettings.jsp");
            request.setAttribute("errList", errList);
            rd.forward(request, response);
            return;
        } else if (updateby.equals("mins")) {
            String minutes = request.getParameter("minutes");
            int minNum = -1;
            try {
                minNum = Integer.parseInt(minutes);
            } catch (Exception e) {
                errList.add("Please enter a number");
            }
            if (minNum < 0 || minNum > 59) {
                errList.add("Please select a number from 0 - 59");
            }
            if (errList.isEmpty()) {
                URL cronurl = new URL("http://www.cronmaker.com/rest/minutes/" + minutes);
                //System.out.println(memberUrl);

                URLConnection con = cronurl.openConnection();
                InputStream is = con.getInputStream();
                BufferedReader br = new BufferedReader(new InputStreamReader(is));
                String line = null;

                while ((line = br.readLine()) != null) {
                    cronex += line;
                }
                System.out.println(cronex);
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("cronSettings.jsp");
                request.setAttribute("errList", errList);
                rd.forward(request, response);
                return;
            }

        } else if (updateby.equals("hourly")) {
            //hourly -> http://www.cronmaker.com/rest/hourly/every/1

            String hour = request.getParameter("hour");
            int hourNum = -1;
            try {
                hourNum = Integer.parseInt(hour);
            } catch (Exception e) {
                errList.add("Please enter a number");
            }
            if (hourNum < 0 || hourNum > 23) {
                errList.add("Please select number from 0 - 23");
            }
            if (errList.isEmpty()) {
                URL cronurl = new URL("http://www.cronmaker.com/rest/hourly/every/" + hour);
                //System.out.println(memberUrl);

                URLConnection con = cronurl.openConnection();
                InputStream is = con.getInputStream();
                BufferedReader br = new BufferedReader(new InputStreamReader(is));
                String line = null;

                while ((line = br.readLine()) != null) {
                    cronex += line;
                }
                System.out.println(cronex);
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("cronSettings.jsp");
                request.setAttribute("errList", errList);
                rd.forward(request, response);
                return;
            }

        } else if (updateby.equals("daily")) {
            String day = request.getParameter("day");
            if (day == null) {
                errList.add("please select an option");
            } else if ("0".equals(day)) {
                String daynum = request.getParameter("daynum");
                int dayNum = -1;
                try {
                    dayNum = Integer.parseInt(daynum);
                } catch (Exception e) {
                    errList.add("Please enter a number");
                }
                if (dayNum < 0 || dayNum > 30) {
                    errList.add("Please select number from 0 - 30");
                }

                String hourvalue = request.getParameter("hourvalue");
                String minvalue = request.getParameter("minvalue");

                int hourvaluenum = -1;
                try {
                    hourvaluenum = Integer.parseInt(hourvalue);
                } catch (Exception e) {
                    errList.add("Please enter a number");
                }
                if (hourvaluenum < 0 || hourvaluenum > 23) {
                    errList.add("Please select number from 0 - 23");
                }
                int minvaluenum = -1;
                try {
                    minvaluenum = Integer.parseInt(minvalue);
                } catch (Exception e) {
                    errList.add("Please enter a number");
                }
                if (minvaluenum < 0 || minvaluenum > 59) {
                    errList.add("Please select number from 0 - 59");
                }
                if (errList.isEmpty()) {
                    URL cronurl = new URL("http://www.cronmaker.com/rest/daily/everyDay?hour=" + hourvalue + "&minute=" + minvalue);
                    //System.out.println(memberUrl);

                    URLConnection con = cronurl.openConnection();
                    InputStream is = con.getInputStream();
                    BufferedReader br = new BufferedReader(new InputStreamReader(is));
                    String line = null;

                    while ((line = br.readLine()) != null) {
                        cronex += line;
                    }
                    System.out.println(cronex);
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("cronSettings.jsp");
                    request.setAttribute("errList", errList);
                    rd.forward(request, response);
                    return;
                }

            } else {
                String hourvalue = request.getParameter("hourvalue");
                String minvalue = request.getParameter("minvalue");

                int hourvaluenum = -1;
                try {
                    hourvaluenum = Integer.parseInt(hourvalue);
                } catch (Exception e) {
                    errList.add("Please enter a number");
                }
                if (hourvaluenum < 0 || hourvaluenum > 23) {
                    errList.add("Please select number from 0 - 23");
                }
                int minvaluenum = -1;
                try {
                    minvaluenum = Integer.parseInt(minvalue);
                } catch (Exception e) {
                    errList.add("Please enter a number");
                }
                if (minvaluenum < 0 || minvaluenum > 59) {
                    errList.add("Please select number from 0 - 59");
                }
                if (errList.isEmpty()) {
                    URL cronurl = new URL("http://www.cronmaker.com/rest/daily/weekdays?hour=" + hourvalue + "&minute=" + minvalue);
                    //System.out.println(memberUrl);

                    URLConnection con = cronurl.openConnection();
                    InputStream is = con.getInputStream();
                    BufferedReader br = new BufferedReader(new InputStreamReader(is));
                    String line = null;

                    while ((line = br.readLine()) != null) {
                        cronex += line;
                    }
                    System.out.println(cronex);
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("cronSettings.jsp");
                    request.setAttribute("errList", errList);
                    rd.forward(request, response);
                    return;
                }
            }

        } else if (updateby.equals("weekly")) {
            String[] weeks = request.getParameterValues("weeks");
            if (weeks == null || weeks.length == 0) {
                errList.add("Please select a day");
            }

            String hourvaluew = request.getParameter("hourvaluew");
            String minvaluew = request.getParameter("minvaluew");

            int hourvaluenumw = -1;
            try {
                hourvaluenumw = Integer.parseInt(hourvaluew);
            } catch (Exception e) {
                errList.add("Please enter a number");
            }
            if (hourvaluenumw < 0 || hourvaluenumw > 23) {
                errList.add("Please select number from 0 - 23");
            }
            int minvaluenumw = -1;
            try {
                minvaluenumw = Integer.parseInt(minvaluew);
            } catch (Exception e) {
                errList.add("Please enter a number");
            }
            if (minvaluenumw < 0 || minvaluenumw > 59) {
                errList.add("Please select number from 0 - 59");
            }
            String toappend = "";
            for (int i = 0; i < weeks.length; i++) {
                if (i == 0) {
                    toappend += weeks[i];
                } else {
                    toappend += "," + weeks[i];
                }
            }

            if (errList.isEmpty()) {
                URL cronurl = new URL("http://www.cronmaker.com/rest/weekly?days=" + toappend + "&hour=" + hourvaluew + "&minute=" + minvaluew);
                //System.out.println(memberUrl);

                URLConnection con = cronurl.openConnection();
                InputStream is = con.getInputStream();
                BufferedReader br = new BufferedReader(new InputStreamReader(is));
                String line = null;

                while ((line = br.readLine()) != null) {
                    cronex += line;
                }
                System.out.println(cronex);
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("cronSettings.jsp");
                request.setAttribute("errList", errList);
                rd.forward(request, response);
                return;
            }

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
        if (errList.isEmpty()) {
            RequestDispatcher rd = request.getRequestDispatcher("cronSettings.jsp");
            request.setAttribute("success", "Cron settings has been updated!");
            rd.forward(request, response);
            return;
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("cronSettings.jsp");
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
