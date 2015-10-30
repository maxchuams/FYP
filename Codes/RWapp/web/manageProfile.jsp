<%-- 
    Document   : mangeProfile
    Created on : Sep 14, 2015, 12:14:29 PM
    Author     : admin
--%>
<%@include file="protect.jsp" %>
<%@include file="navbar.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
    </head>
    <body>
        <section id="main-content">
        <section class="wrapper">
        <h1>Manage your profile!</h1>
        <%            
           if(dev!= null){
               response.sendRedirect("manageDevProfile.jsp");
           } else if (desg!=null){
               response.sendRedirect("manageDesgProfile.jsp");
           } else if (pm!=null){
               response.sendRedirect("managePmProfile.jsp");
           } else if (sudo!=null){
               response.sendRedirect("manageUser.jsp");
           }
        %>
        </section>
        </section>
    </body>
</html>
