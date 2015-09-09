<%-- 
    Document   : login
    Created on : Sep 9, 2015, 9:09:03 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Log in!</h1>
        
        <form method="POST" action="ValidateUser">
            Username: <input type="text" placeholder="username" name="username" required> </br>
         
            Password: <input type="password" placeholder="password" name="password" required>
            
            <button type="submit">Sign in</button>
        </form>
    </body>
</html>
