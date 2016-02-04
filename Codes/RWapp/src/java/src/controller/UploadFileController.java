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

public class UploadFileController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        InputStream inputStream = null;

        Connection conn = null;
        String username = (request.getParameter("username"));
        Part filePart = request.getPart("file_uploaded");
        String delete = request.getParameter("delete");

        if (delete == null) {
            if (filePart != null) {
                if (filePart.getSize() == 0) {
                    RequestDispatcher rd = request.getRequestDispatcher("profilePage.jsp");
                    request.setAttribute("err", "Do not upload blank image!");
                    rd.forward(request, response);
                    return;
                }
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());

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
