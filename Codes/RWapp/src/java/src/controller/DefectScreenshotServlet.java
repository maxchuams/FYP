/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.model.DefectScreenshotDAO;
import src.model.DisplayPictureDAO;
import src.model.ImageDTOBean;

/**
 *
 * @author KIANLAM
 */
public class DefectScreenshotServlet extends HttpServlet {
    
  public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        processAction(request,response); 
  } 

  public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
       processAction(request,response);
  }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processAction(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String defectid = request.getParameter("defectid");
        String updatetime = request.getParameter("updatetime");
        

        //ImageDTOBean ibto = BIZDelegate.getImageDTO(imageName);
           ImageDTOBean ibto = DefectScreenshotDAO.getScreenshot(defectid, updatetime);
        if(ibto != null){
          response.setContentType(ibto.getImageContentType());
          response.setContentLength(ibto.getImageBuffer().length);
          FileService.exportBuffer(ibto.getImageBuffer(),response.getOutputStream()); 
        }else
          log("No Data Found");                                                          
  }

}
