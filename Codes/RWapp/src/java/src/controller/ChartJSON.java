/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.model.ChartJSDAO;

/**
 *
 * @author KIANLAM
 */
@WebServlet(name = "ChartJSON", urlPatterns = {"/ChartJSON"})
public class ChartJSON extends HttpServlet {

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

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        try {

            HttpSession sess = request.getSession();
            String devusername = request.getParameter("devusername");
            String chart = request.getParameter("chart");
            Gson gson = new GsonBuilder().setPrettyPrinting().create();
            

            
           
            
            
            
            //start of pieexp
            if (chart != null && "exppie".equals(chart)) {
                HashMap<String, Integer> expmap = ChartJSDAO.getProjectExp(devusername);
                JsonArray pieDataSet = new JsonArray();

                Iterator<Map.Entry<String, Integer>> iterator = expmap.entrySet().iterator();

                while (iterator.hasNext()) {
                    Map.Entry<String, Integer> entry = iterator.next();
                    Random ran = new Random();

                    JsonObject piedata = new JsonObject();
                    piedata.addProperty("value", entry.getValue());
                    piedata.addProperty("color", ChartJSDAO.getColor(ran.nextInt(14) + 1));
                    piedata.addProperty("label", entry.getKey());

                    pieDataSet.add(piedata);
                }
                String jsonString = gson.toJson(pieDataSet);
                
                response.setContentType("application/json");
                response.getWriter().write(jsonString);
            }
            //end of pieexp
            
            

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
