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
import javax.servlet.http.HttpSession;
import src.model.ConnectionManager;
import src.model.Person;

/**
 *
 * @author KIANLAM
 */
@WebServlet(name = "uploadServlet", urlPatterns = {"/uploadServlet"})
@MultipartConfig(maxFileSize = 16177215)
public class UploadFileController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sess = request.getSession();
       
        
        Person p1 = (Person) sess.getAttribute("loggedInDev");
        Person p2 = (Person) sess.getAttribute("loggedInDesg");
        Person p3 = (Person) sess.getAttribute("loggedInPm");
        Person p4 = (Person) sess.getAttribute("loggedInTester");
        Person currUser = null;

        if (p1 != null) {
            currUser = p1;

        } else if (p2 != null) {
            currUser = p2;

        } else if (p3 != null) {
            currUser = p3;

        } else if (p4 != null) {
            currUser = p4;
        } else {
            response.sendRedirect("login.jsp");
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        InputStream inputStream = null;

        Connection conn = null;
        String username = (request.getParameter("username"));
       
        Part filePart = request.getPart("file_uploaded");
        

        String delete = request.getParameter("delete");

        if (delete == null) {
 
            if (filePart != null) {
                  //check image format
                if (!("image/png".equals(filePart.getContentType()) 
                        || "image/jpeg".equals(filePart.getContentType()))) {
                    RequestDispatcher rd = request.getRequestDispatcher("profilePage.jsp");
                    request.setAttribute("err", "Sorry. Image can only be JPEG or PNG format.");
                    rd.forward(request, response);
                    return;
                }

                //check blank photo
                if (filePart.getSize() == 0) {
                    RequestDispatcher rd = request.getRequestDispatcher("profilePage.jsp");
                    request.setAttribute("err", "Do not upload blank image!");
                    rd.forward(request, response);
                    return;
                }
                //System.out.println(filePart.getName());
                //System.out.println(filePart.getSize());
                //System.out.println(filePart.getContentType());

                inputStream = filePart.getInputStream();
            }

            try {

                conn = ConnectionManager.getConnection();

                String sql = "Update user set photo = ? where username = ?";
                PreparedStatement statement = conn.prepareStatement(sql);

                statement.setString(2, username);

                if (inputStream != null) {
                    statement.setBinaryStream(1, inputStream, (int) filePart.getSize());
                }

                int row = statement.executeUpdate();
                if (row > 0) {
                    conn.close();
                    RequestDispatcher rs = request.getRequestDispatcher("profilePage.jsp");
                    rs.include(request, response);
                } else {
                    conn.close();

                    RequestDispatcher rs = request.getRequestDispatcher("profilePage.jsp");

                    rs.include(request, response);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {

            try {
                conn = ConnectionManager.getConnection();

                String sql = "UPDATE user SET photo = '' WHERE username = ?";
                PreparedStatement statement = conn.prepareStatement(sql);

                statement.setString(1, username);

                statement.executeUpdate();

                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

            RequestDispatcher rs = request.getRequestDispatcher("profilePage.jsp");
            rs.include(request, response);
        }
    }
}
