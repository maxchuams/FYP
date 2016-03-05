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
import src.model.TrelloConfigDAO;

/**
 *
 * @author maxchua
 */
public class updateCronActivity extends HttpServlet {

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
        String active = request.getParameter("active");
        String passSwitch2 = "nothing";
        int pause=-1;
        String switch2 = request.getParameter("switch2");
        if(switch2==null){
            pause=1;
            passSwitch2="off";
        }else if(switch2.equals("on")){
            pause=0;
            passSwitch2="on";
        }
        ArrayList<String> errList = new ArrayList<String>();
        
        try{
            //pause = Integer.parseInt(active);
        } catch (Exception e){
            errList.add("Please select an option");
        }
        boolean success = TrelloConfigDAO.updateCronPause(pause);
        RequestDispatcher rd = request.getRequestDispatcher("cronSettings.jsp");
        if (success){
            String toreturn = "";
            if(pause == 0 ){
                toreturn = "on";
            } else {
                toreturn = "off";
            }
            request.setAttribute("passSwitch2",passSwitch2);
            request.setAttribute("success","Cron is now " +  toreturn);
            rd.forward(request, response);
            return;
        }else {
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
