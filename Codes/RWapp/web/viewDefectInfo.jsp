<%-- 
    Document   : viewDefectInfo
    Created on : Jan 15, 2016, 1:12:03 PM
    Author     : Kaiwen
--%>
<%@page import="src.model.Project"%>
<%@page import="src.model.ProjectDAO"%>
<%@page import="src.model.DefectScreenshotDAO"%>
<%@page import="src.model.Defect"%>
<%@page import="src.model.DefectDAO"%>
<%@page import="java.util.ArrayList"%>
<%@include file="protectPMandDev.jsp" %>
<%String thisPage = "manageDefects"; //This is to change the highlight in Navigation Bar%>
<%String selected = null;%>
<%@include file="navbar.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String defectId = request.getParameter("defectId");
            Defect d = DefectDAO.retrieveDefect(Integer.parseInt(defectId));
        %>
        <section id="main-content">
            <section class="wrapper">
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <header class="panel-heading">Viewing: <%=d.getDefectName()%></header>
                            <div class="panel-body">
                                <table class="table  table-hover general-table">
                                    <thead><tr><td>Defect status</td><td><%if (d.getIsComplete() == 0) {out.println("<span class='label label-danger label-mini'>Defect is incomplete</span>");
                                    }else if(d.getIsComplete()==1){out.println("<span class='label label-warning label-mini'>Defect is done, please check and then mark complete</span>");
                            }else if(d.getIsComplete()==2){out.println("<span class='label label-success label-mini'>Defect has been fixed</span>");} %></td></tr>
                                    <tr><td>Defect severity</td><td><% int sevInt = d.getSeverity(); if(sevInt==1){out.println("Low");} else if(sevInt==2){out.println("Medium");} else if(sevInt==3){out.println("High");} %></td></tr><thead>
                                    <tr><td>Defect description</td><td><%=d.getDesc()%></td></tr>
                                    <tr>
                                        <td>Reported by</td>
                                        <td><%=d.getReportedBy()%></td>
                                    </tr>
                                    <tr>
                                        <td>Last updated time</td>
                                        <td><% out.println(d.getUpdateTime().subSequence(0, 16)); %></td>
                                    </tr>
                                    <tr>
                                        <td>Screenshots uploaded</td>
                                        <% int size = DefectScreenshotDAO.getScreenshotTimestamp("" + d.getId()).size(); %>
                                        <td><%if (size == 0) {%>NIL
                                            <%} else {%>
                                            <a href="viewScreenshot.jsp?id=<%=d.getId()%>&updatetime=<%=d.getUpdateTime()%>"><%=DefectScreenshotDAO.getScreenshotTimestamp("" + d.getId()).size()%><%}%></a></td>
                                    </tr>
                                </table>
                            </div>
                        </section>
                    </div>
                </div>
            </section>
        </section>
    </body>
</html>
