<%-- 
    Document   : login
    Created on : Sep 9, 2015, 9:09:03 AM
    Author     : admin
--%>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@page import="src.model.Person"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Log in!</h1>
        
   

<%
    
    
// check if user is authenticated

    Person dev = (Person) session.getAttribute("loggedInUser");
    Person desg = (Person) session.getAttribute("loggedInDesg");
    Person pm = (Person) session.getAttribute("loggedInPm");
    
    if (pm != null || dev != null || desg != null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String errorMsg = (String) request.getAttribute("errorMsg");
    if (errorMsg == null) {
        errorMsg = "";
    }

  
%>
        
        <form method="POST" action="ValidateUser">
            Username: <input type="text" placeholder="username" name="username" required> </br>
         
            Password: <input type="password" placeholder="password" name="password" required>
            
            <button type="submit">Sign in</button>
        </form>

        <b style="color:red;"><%=errorMsg%></b>
    </body>
</html>
