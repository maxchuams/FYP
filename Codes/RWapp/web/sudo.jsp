<%-- 
    Document   : index
    Created on : Sep 7, 2015, 1:30:53 PM
    Author     : sudo
--%>
<%@include file="protect.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>SUPER ADMIN PAGE</h1>
        
        <h2>LOG IN SUCCESS & I CAN DO ANYTHING!</h2>
        <a href="Logout">Log Out</a>
        <ul>
            <li>
                <a href="manageProfile.jsp">Manage users</a>
            </li>
            <li>
                 <a href="addUsers.jsp">Add Users</a>
            </li>
        </ul>
       
        
    </body>
</html>
