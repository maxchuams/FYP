<%-- 
    Document   : manageUser
    Created on : Sep 14, 2015, 12:28:56 PM
    Author     : admin
--%>
<%@page import="src.model.PersonDAO"%>
<%@page import="java.util.ArrayList"%>
<%@include file="protectSudo.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Users Page</title>
    </head>
    <body>
        <h1>The user management page</h1>
        
        <a href="sudo.jsp">home(sudo)</a>
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


          <h2>List of Users</h2>
        <form action="ManageUser" method="POST">
              <% 
             ArrayList<Person> users = (ArrayList<Person>) request.getAttribute("users");
            if (users == null) {

                users = PersonDAO.retrieveUsers();

            }
             if(users!=null) {%>
                <table border="1"><tr> 
             <td> Username </td>
             <td> Password </td>
             <td> Type </td>
             <%for(Person p: users){%>
             <tr>
             <td> <%=p.getUsername()%></td>
             <td><%=p.getPassword()%> </td>
             <td> <%=p.getType()%></td>
             </tr>
             <%}%>
                </tr>
             <%} %>
              
              <tr></table>

            <button type="submit">update</button>
        </form>
          <h2>Edit Sudo Password</h2>
        <form action="ManageProfile" method="POST">
            Password: <input type="password" name="password1" /> </br>
            Confirm password again: <input type="password" name="password2" /> </br>
            <button type="submit">submit!</button>
        </form>
        

    </body>
</html>
