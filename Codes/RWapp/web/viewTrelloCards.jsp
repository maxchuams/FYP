<%-- 
    Document   : viewTrelloCards
    Created on : Oct 5, 2015, 2:15:52 AM
    Author     : admin
--%>

<%@page import="src.model.ProjectDAO"%>
<%@page import="src.model.Project"%>
<%@page import="src.model.TrelloCardDAO"%>
<%@page import="src.model.TrelloCard"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.model.TrelloBoard"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="protect.jsp"%>
<%String thisPage = "viewTrelloCards"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trello</title>
    </head>
    <body>
        <%
            String userid = "";
            String role = "";
            if (dev != null) {
                userid = dev.getUsername();
                role = "dev";
            }
            if (pm != null) {
                userid = pm.getUsername();
                role = "pm";
            }
            ArrayList<Project> tList = ProjectDAO.retrieveByUser(role, userid);

        %>
        <section id="main-content">
            <section class="wrapper">
                <!--kw code-->
                <!--                <div class="row">
                                    <div class="col-sm-12">
                                        <section class="panel">
                                            <header class="panel-heading">
                                                View All Projects
                                                <span class="tools pull-right">
                                                    <a href="javascript:;" class="fa fa-chevron-down"></a>
                                                </span>
                                            </header>
                                            <div class="panel-body">
                                                <table class="table  table-hover general-table">
                                                    <thead>
                                                        <tr>
                                                            <th>Project Name</th>
                                                            <th>type</th>
                                                            <th>Due Date</th>
                <% if (dev != null && pm == null) {%>
            <th>Assigned By</th>
                <%}%>
            <th>Members</th>
        </tr>
    </thead>
    <tbody>
                <%
                    for (Project t : tList) {
                %> 
                <tr>
                    <td><%=t.getName()%></td>
                    <td><%=t.getType()%></td>
                    <td><%=t.getDuedate()%></td>
                <% if (dev != null && pm == null) {%>
                <td><%=t.getAssignedBy()%></td>
                <%}%>

                <td>
                <%//ArrayList<Person> memberList = t.getMembers(); 
                    //for(Person p : memberList){
                    //   p.getUsername();
                    //}%>
                </td>
            </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
    </div>
</section>
</div>-->
                <!--kw code-->
                <%
                %>

                </br>

                <%             String errorMsg = (String) request.getAttribute("err");
                    String sucess = (String) request.getAttribute("sucess");
                    ArrayList<String> errorList = (ArrayList<String>) request.getAttribute("errList");
                    if (errorMsg == null) {
                        errorMsg = "";
                    }

                    if (sucess == null) {
                        sucess = "";
                    }

                    if (errorList == null || errorList.isEmpty()) {

                    }
                %>


                <div class="row">
                    <div class="col-sm-12">
                        <div class="row-fluid" id="draggable_portlets">
                            <div class="row">
                                <%
                                    for (Project t : tList) {
                                %> 
                                <!-- BEGIN Portlet PORTLET-->
                                <% out.println("<a href='viewProjectInfo.jsp?projectName="+t.getName()+"'>");  %>
                                <div class="col-md-4">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            Project <%=t.getName()%>
                                            <span class="tools pull-right">
                                            </span>
                                        </div>
                                        <div class="panel-body">
                                            <ul class="nav nav-pills nav-stacked">
                                                <li> <span class="badge label-danger pull-left r-activity"><i class="fa fa-bell-o"></i>  <%=t.getDuedate()%></span></li>
                                                <span class="pull-right">
                                                    <li> <b>Type:</b> <%=t.getType()%> </li>
                                                        <% if (dev != null && pm == null) {%>
                                                    <li> <b>Assigned by:</b> <%=t.getAssignedBy()%> <%}%></li>
                                                </span>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </a>
                                <!-- END Portlet PORTLET-->
                                <% }%>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </section>
        </section>
    </body>
</html>
