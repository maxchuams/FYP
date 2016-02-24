/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.controller;

import src.model.identicon.*;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.model.DisplayPictureDAO;
import src.model.ImageDTOBean;
import src.model.Person;
import src.model.identicon.HashGeneratorInterface;
import src.model.identicon.IdenticonGenerator;
import src.model.identicon.MessageDigestHashGenerator;

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
        HttpSession sess = request.getSession();
       
        
        Person p1 = (Person) sess.getAttribute("loggedInDev");
        Person p2 = (Person) sess.getAttribute("loggedInDesg");
        Person p3 = (Person) sess.getAttribute("loggedInPm");
        Person p4 = (Person) sess.getAttribute("loggedInTester");
        Person p5 = (Person) sess.getAttribute("loggedInSudo");
        Person currUser = null;

        if (p1 != null) {
            currUser = p1;
        } else if (p2 != null) {
            currUser = p2;
        } else if (p3 != null) {
            currUser = p3;
        } else if (p4 != null) {
            currUser = p4;
        } else if (p5 != null){
            currUser = p5;
        } else {
            response.sendRedirect("login.jsp");
            return;
        }
         
        String imageName = request.getParameter("imageid");

        //ImageDTOBean ibto = BIZDelegate.getImageDTO(imageName);
           ImageDTOBean ibto = DisplayPictureDAO.getImageData(imageName);
        
           
           //System.out.println("Image size: " +ibto.getImageBuffer().length );
           
          
          if(ibto.getImageBuffer().length == 0){
               //replace with some nice photo
               //System.out.println(imageName);
                HashGeneratorInterface hashGenerator = new MessageDigestHashGenerator("MD5");
		BufferedImage identicon = IdenticonGenerator.generate(imageName, hashGenerator);
		//convert to byte array
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                ImageIO.write(identicon, "png", baos);
                byte[] bytes = baos.toByteArray();
                ibto.setImageBuffer(bytes);
           };
           
        if(ibto != null){
          response.setContentType(ibto.getImageContentType());
          response.setContentLength(ibto.getImageBuffer().length);
          FileService.exportBuffer(ibto.getImageBuffer(),response.getOutputStream()); 
        }else
          log("No Data Found");                                                          
  } 
}
