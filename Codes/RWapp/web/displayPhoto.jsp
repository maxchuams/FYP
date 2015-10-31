<%-- 
    Document   : manageDevProfile
    Created on : Sep 14, 2015, 12:29:13 PM
    Author     : admin
--%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="src.model.DisplayPictureDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html">
        <title>Manage Profile</title>
    </head>
    <body>
        <h1>The developer's profile management page</h1>
        
         
        <a href="index.jsp">home</a>
   
        PHOTO </br>
        <%
            
            out.println("Lau Guo Xi");

           
           
        %>
        <img src="ImageServlet?imageid=recom1" align="center"/>
        <!--recom1 = username-->
        
        
        
        
        
        
        </br>
        
        
                <form method="post" action="uploadServlet" enctype="multipart/form-data">
            <center>
                <table border="1" width="25%" cellpadding="5">
                    <thead> 
                            <th colspan="3">Upload File</th>        
                    </thead>
                    <tbody>
                        <tr>    
                            <td>Name : </td>
                            <td><input type="text" name="username" size="30"></td>
                        </tr>
                        <tr>
                            <td>Choose File : </td>
                            <td><input type="file" name="file_uploaded" /></td>
                        </tr>
                        <tr>
                            <td colspan="3"><center><input type="submit" value="Upload"></center></td>
                        </tr>
                    </tbody>             
                </table>
            </center>
        </form>
        
    </body>
</html>
