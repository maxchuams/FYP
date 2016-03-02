<%-- 
    Document   : manageUser
    Created on : Sep 14, 2015, 12:28:56 PM
    Author     : admin
--%>
<%@page import="src.model.ProjectAllocationDAO"%>
<%@page import="src.model.DeveloperDAO"%>
<%@page import="src.model.Developer"%>
<%@page import="src.model.Skill"%>
<%@page import="src.model.SkillDAO"%>
<%@page import="src.model.PersonDAO"%>
<%@page import="java.util.ArrayList"%>
<%@include file="protectPMandSudo.jsp" %>
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
                            <div class="alert alert-block alert-danger fade in">
                                <button data-dismiss="alert" class="close close-sm" type="button">
                                    <i class="fa fa-times"></i>
                                </button>
                                <%=errorMsg%>
                            </div>
                        </section>
                    </div>
                </div>
                <%
                    }%>
                    <%if (sucess != null) {%>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="alert alert-success fade in">
                                <button data-dismiss="alert" class="close close-sm" type="button">
                                    <i class="fa fa-times"></i>
                                </button>
                                <%=sucess%>
                            </div>
                        </section>
                    </div>
                </div>
                <%}%>

                <!--End of error/success display-->
                <!--Kaiwen's Code-->
                
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
                                            <th colspan="2">User</th>
                                            <th>Country</th>
                                            <th>Number of on-going projects</th>
                                            <% if(sudo!=null){ %>
                                            <th>Edit</th>
                                            <%}%>
                                            <th>View Stats</th>
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
                                            <td>
                                                <div class="tm-avatar">
                                                        <img src="ImageServlet?imageid=<%=p.getUsername()%>" alt=""/>
                                                </div>
                                            </td>
                                            <td><%=p.getUsername()%></td>
                                            <td> <% 
                                                String d = DeveloperDAO.retrieveDevCountry(p.getUsername());
                                                out.println(d);
                                            %></td>
                                            <td>
                                                <%ArrayList<String> getNumberAllocated = ProjectAllocationDAO.retrieveDevInProgress(p.getUsername());%>
                                                <%=getNumberAllocated.size()%>
                                            </td>
                                            <% if(sudo!=null){ %>
                                            <td><a href="editUser.jsp?username=<%=p.getUsername()%>"><button type="button" class="btn btn-info btn-xs">Edit</button></a></td>
                                            <% } %>
                                            <td><a href="statdemo.jsp?devusername=<%=p.getUsername()%>"><button type="button" class="btn btn-primary btn-xs">View</button></a></td>
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
