<%-- 
    Document   : manageUser
    Created on : Sep 14, 2015, 12:28:56 PM
    Author     : admin
--%>
<%@page import="src.model.Skill"%>
<%@page import="src.model.SkillDAO"%>
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

        <%             String errorMsg = (String) request.getAttribute("err");
            String sucess = (String) request.getAttribute("sucess");
            if (errorMsg == null) {
                errorMsg = "";
            }

            if (sucess == null) {
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
                  if (users != null) {%>
            <table border="1"><tr> 
                    <td> Username </td>
                    <td> Password </td>
                    <td> Type </td>
                    <%for (Person p : users) {%>
                <tr>
                    <td> <%=p.getUsername()%></td>
                    <td><%=p.getPassword()%> </td>
                    <td> <%=p.getTrelloKey()%></td>
                    <td><%=p.getToken()%></td>
                </tr>
                <%}%>
                </tr>
                <%} %>

                <tr></table>

            <button type="submit">update</button>
        </form>
        <h2>Edit Sudo Password</h2>
        <form action="ManageProfile" method="POST">
            Password: <input type="password" name="password1" required/> </br>
            Confirm password again: <input type="password" name="password2" required/> </br>
            <button type="submit">submit!</button>
        </form>
        <div id="trelloForm">
            <%
                ArrayList<Person> pList = PersonDAO.retrieveUsers();


            %>
            </br>
            <h2>Update Trello Details</h2>
            <form action="updateTrelloDetails" method="POST">
                Username:
                <select name="user">
                    <%                         for (Person p : pList) {
                            if (!p.getUsername().equals("admin")) {
                    %>
                    <option value="<%=p.getUsername()%>"><%=p.getUsername()%></option>



                    <%
                             }
                         } %>
                </select>
                </br>
                Trello Key: <input type="text" name="key" required/>
                </br>
                Trello Token: <input type="text" name="token" required/>
                </br>
                <input type="submit" value="Update!"/>
            </form>
        </div>

        <div>
            <h2>Update Developer's Skillz</h2>
            <table border='1'>
                <thead>
                <th>name</th>
                <th>skills</th>
                </thead>
                <%
                    for (Person p : pList) {
                        if (!p.getUsername().equals("admin") && p.getType().equals("c")) {
                            ArrayList<Skill> sList = SkillDAO.retrieveDevSkill(p.getUsername());

                %>
                <tr>
                    <td><%=p.getUsername()%></td>
                    <td>
                        <%
                                    for (int i = 0; i < sList.size(); i++) {
                                        Skill s = sList.get(i);
                                        out.print(s.getSkill());
                                        if (i != sList.size() - 1) {
                                            out.print(", ");
                                        }
                                    }
                                }
                            }
                        %>
                    </td>
                </tr>
            </table>
            <form action="updateDevSkill" method="GET">
                Username:
                <select name="user">
                    <%
                        for (Person p : pList) {
                            if (!p.getUsername().equals("admin") && p.getType().equals("c")) {
                    %>
                    <option value="<%=p.getUsername()%>"><%=p.getUsername()%></option>



                    <%
                             }
                         }%>
                </select>
                Add skills: 
                <select name="skills">
                    <option value="Wordpress">Wordpress</option>
                    <option value="eCommerce">eCommerce</option>
                    <option value="Custom">Custom</option>
                </select>
               
                </br>
                <input type='submit' value='Add Skillz'/>
            </form>
        </div>
                
                </br>
                <div>
            <h1>Change User Password</h1>
            </br>
            Select User: 
            <form action="changeUserPassword" method="POST">
                <select name="user">
                    <%
                        for (Person p : pList) {
                            if (!p.getUsername().equals("admin")) {
                    %>
                    <option value="<%=p.getUsername()%>"><%=p.getUsername()%></option>



                    <%
                             }
                         }%>
                </select>
                </br>
                 Password: <input type="password" name="password1" required/> </br>
                 Confirm password again: <input type="password" name="password2" required/> </br>
                <button type="submit">submit!</button>
                
            </form>
             </div>
    </body>
</html>
