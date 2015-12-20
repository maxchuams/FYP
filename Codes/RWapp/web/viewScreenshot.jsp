<%-- 
    Document   : viewScreenshot
    Created on : Dec 18, 2015, 12:44:00 PM
    Author     : maxchua
--%>

<%@page import="src.model.DefectScreenshotDAO"%>
<%@page import="src.model.Defect"%>
<%@page import="src.model.DefectDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="protect.jsp" %>
<%String thisPage = "manageDefects"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Screenshot</title>
    </head>
    <body>
        <section id="main-content">
            <section class="wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <section class="panel">
                            <header class="panel-heading">
                                <%            String id = request.getParameter("id");
                                    String updatetime = request.getParameter("updatetime");

                                    ArrayList<String> timestamps = DefectScreenshotDAO.getScreenshotTimestamp(id);
                                    for (String stamp : timestamps) {
                                %>
                                View Screenshot ID <%=id%>_<%=stamp%>
                            </header>
                            <div class="panel-body">
                                <% if (pm!=null) {%>
                                <a href="manageDefects.jsp"><i class="fa fa-arrow-left"> </i>  &nbsp;&nbsp;Return to previous page</a>
<%}%>
<% if (dev!=null) {%>
                                <a href="viewDefects.jsp">Return</a>
<%}%>
<br/><br/>
                                <img src='DefectScreenshotServlet?defectid=<%=id%>&updatetime=<%=stamp%>' align="center"/>
                                

                                <%
                                    }
                                %>
                            </div>
                        </section>
                    </div>
                </div>
            </section>
        </section>
    </body>
</html>
