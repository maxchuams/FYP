/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.model.DisplayPictureDAO;
import src.model.ImageDTOBean;

/**
 *
 * @author KIANLAM
 */
public class ImageServlet extends HttpServlet{



  public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        processAction(request,response); 
  } 

  public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
       processAction(request,response);
  }


  protected void processAction(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{

         
        String imageName = request.getParameter("imageid");

        //ImageDTOBean ibto = BIZDelegate.getImageDTO(imageName);
           ImageDTOBean ibto = DisplayPictureDAO.getImageData(imageName);
        if(ibto != null){
          response.setContentType(ibto.getImageContentType());
          response.setContentLength(ibto.getImageBuffer().length);
          FileService.exportBuffer(ibto.getImageBuffer(),response.getOutputStream()); 
        }else
          log("No Data Found");                                                          
  } 
}
