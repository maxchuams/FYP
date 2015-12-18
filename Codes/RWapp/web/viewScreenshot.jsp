<%-- 
    Document   : viewScreenshot
    Created on : Dec 18, 2015, 12:44:00 PM
    Author     : maxchua
--%>

<%@page import="src.model.DefectScreenshotDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="protectDev.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Screenshot</title>
    </head>
    <body>
        <%            String id = request.getParameter("id");
            String updatetime = request.getParameter("updatetime");

            ArrayList<String> timestamps = DefectScreenshotDAO.getScreenshotTimestamp(id);
            for (String stamp : timestamps) {
        %>
        <img src='DefectScreenshotServlet?defectid=<%=id%>&updatetime=<%=stamp%>' align="center"/>
        <br/>Defect ID: <%=id%>_<%=stamp%>

        <%
            }
        %>
    </body>
</html>
