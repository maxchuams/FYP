/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import src.model.ConnectionManager;
/**
 *
 * @author KIANLAM
 */
@WebServlet(name = "uploadServlet", urlPatterns = {"/uploadServlet"})
@MultipartConfig(maxFileSize = 16177215)

public class UploadFileController extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
        
                InputStream inputStream = null;

                
                
                String username=(request.getParameter("username"));
                Part filePart = request.getPart("file_uploaded");
                
                if (filePart != null) 
                {
                    System.out.println(filePart.getName());
                    System.out.println(filePart.getSize());
                    System.out.println(filePart.getContentType());

                    inputStream = filePart.getInputStream();
                }
                Connection conn = null;
                try 
                {
                    
                    conn = ConnectionManager.getConnection();
                    
                    String sql = "Update user set photo = ? where username = ?";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    
                    statement.setString(2, username);
                    
                    if (inputStream != null) 
                    {
                        statement.setBinaryStream(1, inputStream, (int) filePart.getSize());
                    }
                    
                    int row = statement.executeUpdate();
                    if (row > 0) 
                    {
                        //out.println("File uploaded!!!");
                        
                        conn.close();
                        
                        RequestDispatcher rs = request.getRequestDispatcher("profilePage.jsp");
                        //request.setAttribute("xx", "File Uploaded!!");
                        rs.include(request, response);
                    }
                    else
                    {
                        //out.println("Couldn't upload your file!!!");
                        
                        conn.close();
                        
                        RequestDispatcher rs = request.getRequestDispatcher("profilePage.jsp");
                        //request.setAttribute("xx", "File Not Uploaded Please Try Again!!");
                        rs.include(request, response);
                    }    

                }catch(Exception e){e.printStackTrace();}     
    }   
}