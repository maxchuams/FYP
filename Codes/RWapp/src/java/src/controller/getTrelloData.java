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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.*;
import src.model.TrelloBoard;
import src.model.TrelloMember;

/**
 *
 * @author admin
 */
public class getTrelloData extends HttpServlet {

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
        URL url = new URL("https://api.trello.com/1/members/testaccount166/boards?key=f44ba45fa92dd5b68d1b85398850d545&token=2e6fa53153c8030dd08949e0c3d363404aadb828e67a148131a4f71d17a556e7");
        
        //key:7e35111227918de8a37f8c20844ed555
        //token:2e6fa53153c8030dd08949e0c3d363404aadb828e67a148131a4f71d17a556e7
        //sharedsecret:65852f2f5652ead0ebed9907bca780a67dcc11aeec6105ac4bd8cf42e559adb6
        URLConnection con = url.openConnection();
        InputStream is = con.getInputStream();
        BufferedReader br = new BufferedReader(new InputStreamReader(is));

        String line = null;
        String jsonOutput= "";
        TrelloBoard tb = null;
        // read each line and write to System.out
        while ((line = br.readLine()) != null) {
            jsonOutput += line;
            
        }
        JSONArray arr = new JSONArray(jsonOutput);
        for(int i = 0; i < arr.length() ; i++){
            JSONObject main = arr.getJSONObject(i);
            String boardName = main.getString("name");
            if(boardName.equals("Projects Master Board")){
                String id = main.getString("id");
                JSONArray mArr = main.getJSONArray("memberships");
                ArrayList<TrelloMember> tmList = new ArrayList<TrelloMember> ();
                for(int j = 0; j<mArr.length(); j++){
                    String membershipId = mArr.getJSONObject(i).getString("idMember");
                    TrelloMember tm = new TrelloMember(membershipId);
                    tmList.add(tm);
                }
                tb = new TrelloBoard(boardName, id, tmList);
            }
        }
        RequestDispatcher rd = request.getRequestDispatcher("viewTrelloCards.jsp");
        request.setAttribute("trelloBoard", tb);
        rd.forward(request, response);
              
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
