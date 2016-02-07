/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import src.model.ConnectionManager;
import src.model.DefectScreenshotDAO;



/**
 *
 * @author KIANLAM
 */
@MultipartConfig(maxFileSize = 16177215)
public class DefectScreenshotController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
        
                InputStream inputStream = null;

                Connection conn = null;
                String defectid=(request.getParameter("defectid"));
                String updatetime=(request.getParameter("updatetime"));
                Part filePart = request.getPart("file_uploaded");
                String delete = request.getParameter("delete");
                
                ArrayList<String> imgList = DefectScreenshotDAO.getScreenshotTimestamp(defectid);
        
                if(delete==null){
                if (imgList.size() == 3){
                    RequestDispatcher rd = request.getRequestDispatcher("defectscreenshot.jsp?id="+defectid);
                    request.setAttribute("err" , "You can only upload a maximum of 3 images");
                    rd.forward(request, response);
                    return;
                }
                if (filePart != null) 
                {
                 if (filePart.getSize() == 0){
                    RequestDispatcher rd = request.getRequestDispatcher("defectscreenshot.jsp?id="+defectid);
                    request.setAttribute("err" , "Do not upload blank image!");
                    rd.forward(request, response);
                    return;
                }
                    
                    
                    System.out.println(filePart.getName());
                    System.out.println(filePart.getSize());
                    System.out.println(filePart.getContentType());

                    inputStream = filePart.getInputStream();
                }else{
                    //kes to catch filePath object null, not doing anything null 
                    //bcos I cant think of a null scenario
                }
                
                try 
                {
                    
                    conn = ConnectionManager.getConnection();
                    
                    String sql = "INSERT into defectscreenshot (defectid,photo) value (?,?)";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    
                    statement.setString(1, defectid);

                    
                    if (inputStream != null) 
                    {
                        statement.setBinaryStream(2, inputStream, (int) filePart.getSize());
                    }
                    
                    int row = statement.executeUpdate();
                    if (row > 0) 
                    {
                        conn.close();
                        request.setAttribute("sucess" , "Image successfully uploaded.");
                        RequestDispatcher rs = request.getRequestDispatcher("defectscreenshot.jsp?id="+defectid);
                        rs.include(request, response);
                    }
                    else
                    {   
                        conn.close();
                        
                        RequestDispatcher rs = request.getRequestDispatcher("defectscreenshot.jsp?id="+defectid);
                        request.setAttribute("err" , "Sorry, image could not be updated due to database issue.");
                        rs.include(request, response);
                    }    
                }catch(Exception e){e.printStackTrace();}     
    
                }else{
                
                    try{
                    conn = ConnectionManager.getConnection();
                    
                    String sql = "delete from defectscreenshot  WHERE defectid = ? and updatetime = ?";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    
                    statement.setString(1, defectid);
                    statement.setString(2, updatetime);
                    System.out.println(statement.toString());
                    statement.executeUpdate();
                    System.out.println(statement.toString());
                    conn.close();
                    }catch(Exception e){e.printStackTrace();}
                    
                        RequestDispatcher rs = request.getRequestDispatcher("defectscreenshot.jsp?id="+defectid);
                        rs.include(request, response);
                }
    }   

}
