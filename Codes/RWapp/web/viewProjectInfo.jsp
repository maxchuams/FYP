<%-- 
    Document   : viewProjectInfo
    Created on : Jan 21, 2016, 4:29:41 PM
    Author     : Kaiwen
--%>
<%@page import="src.model.ProjectDAO"%>
<%@page import="src.model.Project"%>
<%@page import="src.model.TrelloCardDAO"%>
<%@page import="src.model.TrelloCard"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.model.TrelloBoard"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="protect.jsp"%>
<%String thisPage = "viewTrelloCards"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String projectName = request.getParameter("projectName");
            Project p = ProjectDAO.retrieveProjectByProjectName(projectName);
        %>
        <section id="main-content">
            <section class="wrapper">
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <header class="panel-heading">Viewing: Project <%=p.getName()%></header>
                            <div class="panel-body">
                                To-edit information here
                            </div>
                        </section>
                    </div>
                </div>
            </section>
        </section>
    </body>
</html>
