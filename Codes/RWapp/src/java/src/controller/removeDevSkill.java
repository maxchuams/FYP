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
import src.model.Skill;
import src.model.SkillDAO;

/**
 *
 * @author maxchua
 */
public class removeDevSkill extends HttpServlet {

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
      String username = request.getParameter("user");
      String skill = request.getParameter("skill");
      
     boolean skillThere = checkSkill(username, skill);
             
      
      
      
       RequestDispatcher rd = request.getRequestDispatcher("manageUser.jsp");
       if(!skillThere){
           request.setAttribute("err", "No such skill");
            rd.forward(request, response);
       }
       
       boolean sucess = SkillDAO.deleteSkill(username,skill);
      if (sucess){
           request.setAttribute("sucess","Skill for " + username + " sucessfully removed");
           rd.forward(request,response);
        } else {
            request.setAttribute("err", "Failed to delete skill, please try again later");
            rd.forward(request, response);
            
        }
    }
    private boolean checkSkill(String username, String skill){
        ArrayList<Skill> slist = SkillDAO.retrieveDevSkill(username);
        for(Skill s : slist){
            String sname = s.getSkill();
            if (sname.equals(skill)){
                return true;
            }
        }
        return false;
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
