<%-- 
    Document   : manageDesgProfile
    Created on : Sep 14, 2015, 12:28:44 PM
    Author     : admin
--%>
<%@include file="protectDesg.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit your profile</title>
    </head>
    <body>
        <h1>Profile Management Page for Designers</h1>

        </br>
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
        Username: <%= desg.getUsername()%> </br>
       
        </br>

        <h2>Edit</h2>

        </br>
        <form action="ManageProfile" method="POST">
            Password: <input type="password" name="password1" /> </br>
            Confirm password again: <input type="password" name="password2" /> </br>
            
            </br>
            <button type="submit">submit!</button>
        </form>

    </body>
</html>
