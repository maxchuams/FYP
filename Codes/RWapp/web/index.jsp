<%-- 
    Document   : index
    Created on : Sep 7, 2015, 1:30:53 PM
    Author     : admin
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
        <h1>Hello World!</h1>
        
        <h2>LOG IN SUCCESS YAY!</h2>
        <a href="Logout">Log Out</a>
        
        <ul>
            <li><a href="manageProfile.jsp">Manage your Profile</a></li>
            <li><a href="viewTrelloCards.jsp">View Trello Cards</a></li>
            <li><a href="addNewProject.jsp">Add New Project</a></li>
            <%
            if (pm!= null){
                %>
            <li><a href="assignProject">View Unassigned Cards</a></li>
            <%
            }
            %>
            
        </ul>
           
        
        
        
        
    </body>
</html>
