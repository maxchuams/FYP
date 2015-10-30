<%-- 
    Document   : manageSudoProfile
    Created on : Oct 30, 2015, 1:01:12 PM
    Author     : calvin
--%>
<%@include file="protectSudo.jsp" %>
<%@include file="navbar.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <section id="main-content">
        <section class="wrapper">
        <h1>The Sudo profile management page</h1>

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
        Username: <%= sudo.getUsername()%> </br>
       
        </br>

        <h2>Edit</h2>

        </br>
        <form action="ManageProfile" method="POST">
            Password: <input type="password" name="password1" /> </br>
            Confirm password again: <input type="password" name="password2" /> </br>
         
            <button type="submit">submit!</button>
        </form>
        </section>
        </section>
    </body>
</html>
