<%-- 
    Document   : viewTrelloCards
    Created on : Oct 5, 2015, 2:15:52 AM
    Author     : admin
--%>

<%@page import="src.model.TrelloCard"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.model.TrelloBoard"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="protect.jsp"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trello</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <% ArrayList<TrelloCard> tb = (ArrayList<TrelloCard>) request.getAttribute("tc"); 
           
           if (tb != null){
               out.println(tb);
           }
            
         
        %>
        
        Trello Board data:
        </br>
        
       
        
        
        
    </body>
</html>
