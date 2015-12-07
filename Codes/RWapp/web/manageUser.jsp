<%-- 
    Document   : manageUser
    Created on : Sep 14, 2015, 12:28:56 PM
    Author     : admin
--%>
<%@page import="src.model.DeveloperDAO"%>
<%@page import="src.model.Developer"%>
<%@page import="src.model.Skill"%>
<%@page import="src.model.SkillDAO"%>
<%@page import="src.model.PersonDAO"%>
<%@page import="java.util.ArrayList"%>
<%@include file="protectSudo.jsp" %>
<%String thisPage = "manageUser"; //This is to change the highlight in Navigation Bar%>
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
                <!--Error/success display-->
                <%  String errorMsg = (String) request.getAttribute("err");
                    String sucess = (String) request.getAttribute("sucess");

                    if (errorMsg != null) {
                %>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="panel-body">
                                <div class="text-danger"><%=errorMsg%></div>
                            </div>
                        </section>
                    </div>
                </div>
                <%
                    }
                    if (sucess != null) {%>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="panel-body">
                                <div class="text-success"><%=sucess%></div>
                            </div>
                        </section>
                    </div>
                </div>
                <%
                    }
                %>


                <!--End of error/success display-->
                <!--Kaiwen's Code-->
                <div class="row">
                    <div class="col-sm-12">
                        <section class="panel">
                            <header class="panel-heading">
                                List of Project Managers
                                <span class="tools pull-right">
                                    <a href="javascript:;" class="fa fa-chevron-down"></a>

                                </span>
                            </header>
                            <div class="panel-body">
                                <table class="table  table-hover general-table">
                                    <thead>
                                        <tr>
                                            <th>Username</th>
                                            <th>Role</th>
                                            <th>Edit</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%
                                            ArrayList<Person> usersList = (ArrayList<Person>) request.getAttribute("users");
                                            if (usersList == null) {
                                                usersList = PersonDAO.retrieveUsers();
                                            }
                                            if (usersList != null) {%>
                                        <%for (Person p : usersList) {
                                                if (p.getType().equals("p")) {%>
                                        <tr>
                                            <td><a href="#"> <%=p.getUsername()%></a></td>
                                            <td> <% 
                                            if (p.getType().equals("p")){
                                                out.println("Project Manager");
                                            } else if (p.getType().equals("c")){
                                                out.println("Developer");
                                            }
                                            %></td>
                                            <td><a href="editUser.jsp?username=<%=p.getUsername()%>"><button type="button" class="btn btn-primary btn-xs">Edit</button></a></td>
                                        </tr>
                                        <%}%>
                                        <%}
                                            } %>
                                    </tbody>
                                </table>
                            </div>
                        </section>
                    </div>
                </div>


                <div class="row">
                    <div class="col-sm-12">
                        <section class="panel">
                            <header class="panel-heading">
                                List of Developers
                                <span class="tools pull-right">
                                    <a href="javascript:;" class="fa fa-chevron-down"></a>

                                </span>
                            </header>
                            <div class="panel-body">
                                <table class="table  table-hover general-table">
                                    <thead>
                                        <tr>
                                            <th>Username</th>
                                            <th>Country</th>
                                            <th>Edit</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%
                                            ArrayList<Person> usersList1 = (ArrayList<Person>) request.getAttribute("users");
                                            if (usersList1 == null) {
                                                usersList1 = PersonDAO.retrieveUsers();
                                            }
                                            if (usersList1 != null) {%>
                                        <%for (Person p : usersList1) {
                                                if (p.getType().equals("c")) {%>
                                        <tr>
                                            <td><a href="#"> <%=p.getUsername()%></a></td>
                                            <td> <% 
                                                String d = DeveloperDAO.retrieveDev(p.getUsername());
                                                out.println(d);
                                            %></td>
                                            <td><a href="editUser.jsp?username=<%=p.getUsername()%>"><button type="button" class="btn btn-primary btn-xs">Edit</button></a></td>
                                        </tr>
                                        <%}%>
                                        <%}
                                            }%>
                                    </tbody>
                                </table>
                            </div>
                        </section>
                    </div>
                </div>
                <!--End of KW's code-->
            </section>
        </section>
    </body>
</html>
