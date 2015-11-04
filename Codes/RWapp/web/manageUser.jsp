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
<%@include file="navbar.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recco</title>
    </head>
    <body>
        <section id="main-content">
        <section class="wrapper">
            
            <!--Kaiwen's Code-->
            <div class="row">
            <div class="col-sm-12">
                <section class="panel">
                    <header class="panel-heading">
                        List of users
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                            
                         </span>
                    </header>
                    <div class="panel-body">
                        <table class="table  table-hover general-table">
                            <thead>
                            <tr>
                                <th>Username</th>
                                <th>Password</th>
                                <th>Key</th>
                                <th>Token</th>
                                <th>Delete</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><a href="#">Graphics</a></td>
                                <td class="hidden-phone">Lorem Ipsum dorolo imit</td>
                                <td>1320.00$ </td>
                                <td><span class="label label-info label-mini">Due</span></td>
                                <td>
                                    <div class="progress progress-striped progress-xs">
                                        <div style="width: 40%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-success">
                                            <span class="sr-only">40% Complete (success)</span>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="#">
                                        ThemeBucket
                                    </a>
                                </td>
                                <td class="hidden-phone">Lorem Ipsum dorolo</td>
                                <td>556.00$ </td>
                                <td><span class="label label-warning label-mini">Due</span></td>
                                <td>
                                    <div class="progress progress-striped progress-xs">
                                        <div style="width: 70%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-danger">
                                            <span class="sr-only">70% Complete (success)</span>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="#">
                                        XYZ
                                    </a>
                                </td>
                                <td class="hidden-phone">Lorem Ipsum dorolo</td>
                                <td>13240.00$ </td>
                                <td><span class="label label-success label-mini">Paid</span></td>
                                <td>
                                    <div class="progress progress-striped progress-xs">
                                        <div style="width: 55%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-warning">
                                            <span class="sr-only">55% Complete (success)</span>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="#">
                                        BCSE
                                    </a>
                                </td>
                                <td class="hidden-phone">Lorem Ipsum dorolo</td>
                                <td>3455.50$ </td>
                                <td><span class="label label-danger label-mini">Paid</span></td>
                                <td>
                                    <div class="progress progress-striped progress-xs">
                                        <div style="width: 90%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-info">
                                            <span class="sr-only">90% Complete (success)</span>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><a href="#">AVC Ltd</a></td>
                                <td class="hidden-phone">Lorem Ipsum dorolo imit</td>
                                <td>110.00$ </td>
                                <td><span class="label label-primary label-mini">Due</span></td>
                                <td>
                                    <div class="progress progress-striped progress-xs">
                                        <div style="width: 60%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-success">
                                            <span class="sr-only">60% Complete (success)</span>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="#">
                                        Themeforest
                                    </a>
                                </td>
                                <td class="hidden-phone">Lorem Ipsum dorolo</td>
                                <td>456.00$ </td>
                                <td><span class="label label-warning label-mini">Due</span></td>
                                <td>
                                    <div class="progress progress-striped progress-xs">
                                        <div style="width: 40%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-danger">
                                            <span class="sr-only">40% Complete (success)</span>
                                        </div>
                                    </div>
                                </td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                </section>
            </div>
        </div>
            <!--End of KW's code-->

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

        <section class="panel">
        <h2>List of Users</h2>
        <form action="ManageUser" method="POST">
            <%
                ArrayList<Person> users = (ArrayList<Person>) request.getAttribute("users");
                if (users == null) {

                    users = PersonDAO.retrieveUsers();

                  }
                  if (users != null) {%>
            <table class="table table-hover"><tr> 
                    <td> Username </td>
                    <td> Password </td>
                    <td> Key </td>
                    <td> Token </td>
                    <%for (Person p : users) {%>
                <tr>
                    <td class="JustifyCenter"> <%=p.getUsername()%></td>
                    <td><%=p.getPassword()%> </td>
                    <td> <%=p.getTrelloKey()%></td>
                    <td><%=p.getToken()%></td>
                </tr>
                <%}%>
                </tr>
                <%} %>

                <tr></table>

            <button class="btn btn-default" type="submit">update</button>
            <%
                ArrayList<Person> pList = PersonDAO.retrieveUsers();


            %>
        </form>
        </section>
        <section class="panel">
                <h2>Remove user</h2>
                <form action="removeUser">
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
                <p></p>
                <input class="btn btn-info" type="submit" value="Remove"/>
                </form>
                </br>
        </section>
        <section class="panel">
        <div id="trelloForm">
            
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
                <input class="btn btn-danger" type="submit" value="Update!"/>
            </form>
        </div>
        </section>
                <section class="panel">
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
                <input class="btn btn-warning" type='submit' value='Add Skillz'/>
            </form>
        </div>
                </section>
                <section class="panel">
                <h2>Remove developer's skill</h2>
                <form action='removeDevSkill'>
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
                </br>
                Skill to remove:
                <select name="skill">
                    <option value="Wordpress">Wordpress</option>
                    <option value="eCommerce">eCommerce</option>
                    <option value="Custom">Custom</option>
                </select>
                <input class="btn btn-success" type='submit' value='Remove Skill!'/>
                </form>
                
                </br>
                
                </section>
                <section class="panel">
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
                <button class="btn-primary" type="submit">submit!</button>
                
            </form>
             </div>
                </section>
    </section>
</section>
    </body>
</html>
