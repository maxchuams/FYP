<%-- 
    Document   : managePmProfile
    Created on : Sep 14, 2015, 12:28:56 PM
    Author     : admin
--%>
<%@include file="protectPM.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Profile</title>
    </head>
    <body>
        <h1>The PM profile management page</h1>
        
        <a href="index.jsp">home</a>
        </br>
        
         <%
            
         

            String errorMsg = (String) request.getAttribute("err");
            String sucess = (String) request.getAttribute("sucess");
            if (errorMsg == null) {
                errorMsg = "";
            } 
            
            if(sucess == null){
                sucess = "";
            }


        %>
        <b style="color:blue;"><%=sucess%></b><b style="color:red;"><%=errorMsg%></b>
         </br>
        Current profile details: </br>
        Username: <%= pm.getUsername()%> </br>
       
        </br>

        <h2>Edit</h2>

        </br>
        <form action="ManageProfile" method="POST">
            Password: <input type="password" name="password1" /> </br>
            Confirm password again: <input type="password" name="password2" /> </br>
         
            <button type="submit">submit!</button>
        </form>

    </body>
</html>
