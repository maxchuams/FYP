<%-- 
    Document   : viewDefects
    Created on : Dec 11, 2015, 6:27:02 PM
    Author     : maxchua
--%>
<%@page import="src.model.Project"%>
<%@page import="src.model.ProjectDAO"%>
<%@page import="src.model.DefectScreenshotDAO"%>
<%@page import="src.model.Defect"%>
<%@page import="src.model.DefectDAO"%>
<%@page import="java.util.ArrayList"%>
<%@include file="protectDev.jsp" %>
<%String thisPage = "viewDefects"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Defects</title>

        <script type="text/javascript">
            $(document).ready(function () {
                $('#pname').hide(); //hide field on start
                $('#severity').hide();
                $('#completed').hide();
                $('#role').change(function () {

                    var $index = $('#role').index(this);
                    if ($('#role').val() == 'projectname') { //if this value is NOT selected
                        $('#pname').show();
                        $('#completed').hide();
                        $('#severity').hide();//this field is hidden
                    }
                    if ($('#role').val() == 'severity') { //if this value is NOT selected
                        $('#pname').hide();
                        $('#completed').hide();
                        $('#severity').show();//this field is hidden
                    }
                    if ($('#role').val() == 'iscomplete') { //if this value is NOT selected
                        $('#pname').hide();
                        $('#completed').show();
                        $('#severity').hide();//this field is hidden
                    }
                });
            });
        </script>
    </head>
    <body>
        <section id="main-content">
            <section class="wrapper">
                <!--Error/success display-->
                <%  ArrayList<Project> pList = ProjectDAO.retrieveAll();
                    String errorMsg = (String) request.getAttribute("err");
                    String sucess = (String) request.getAttribute("sucess");
                    ArrayList<String> errorList = (ArrayList<String>) request.getAttribute("errList");

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
                    if (errorList != null && !errorList.isEmpty()) { %>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="panel-body">
                                <div class="text-success">
                                    <% for (int i = 0; i < errorList.size(); i++) {
                                            out.println(errorList.get(i));
                                        }%></div>
                            </div>
                        </section>
                    </div>
                </div>
                <% }
                %>

                <!--End of error/success display-->

                <div class="row">
                    <div class="col-lg-12">
                        <%
                            ArrayList<Defect> dList = DefectDAO.retrieveAllocatedDev(dev.getUsername());
                        %>
                        <%for (Project p : pList) {
                                if (DefectDAO.retrieveAllByProject(p.getName()).size() != 0) {
                        %>
                        <div class="row">
                            <div class="col-sm-12">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <%=p.getName()%> 
                                        <span class="tools pull-right">
                                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                                        </span>
                                    </header>
                                    <div class="panel-body">
                                        <%
                                            int count = 0;
                                            for (Defect d : dList) {
                                                int sev = d.getSeverity();
                                                String severity = "";
                                                if (sev == 1) {
                                                    severity = "Low";
                                                } else if (sev == 2) {
                                                    severity = "Medium";
                                                } else if (sev == 3) {
                                                    severity = "High";
                                                }
                                                if (p.getName().equalsIgnoreCase(d.getProjectName())) {

                                                    out.println("<a href='viewDefectInfo.jsp?defectId=" + d.getId() + "'>");
                                                    if (d.getIsComplete() == 2) { %>
                                        <div class='col-lg-4 col-sm-4'> 
                                            <div class="alert alert-success fade in"> 
                                                <% } else if (d.getIsComplete() == 1) {
                                                %> 
                                                <div class='col-lg-4 col-sm-4'> 
                                                    <div class="alert alert-warning fade in"> 
                                                        <% } else if (d.getIsComplete() == 0) { %>
                                                        <div class='col-lg-4 col-sm-4'> 
                                                            <div class="alert alert-danger fade in"> 
                                                                <% }
                                                                %>
                                                                <%
                                                                    String dName;
                                                                    if (d.getDefectName().length() > 20) {
                                                                        dName = d.getDefectName().substring(0, 20) + "...";
                                                                    } else {
                                                                        dName = d.getDefectName();
                                                                    }
                                                                    out.println("<table border='0' width='100%'><tr><td><b>Defect Name: </b></td><td> " + dName + "</td></tr>");
                                                                    out.println("<tr><td><b>Severity: </b></td><td> " + severity + "</td></tr>");
                                                                    out.println("<tr><td><b>Date: </b></td><td> " + d.getUpdateTime().subSequence(0, 16) + "</td></tr>");
                                                                    out.println("</table>");

                                                                %> 
                                                            </div>
                                                        </div>
                                                        </a>
                                                        <%                                                                count++;
                                                                }
                                                            }
                                                            if (count == 0) {
                                                                out.println("<a href='addDefect.jsp'>No defects found <i>yet</i>. <br/>Add one?</a>");
                                                            }

                                                            count = 0;

                                                        %>
                                                    </div>
                                                    </section>
                                                </div>
                                            </div>
                                            <% }
                                                }
                                            %>

                                            <!--end of kw codes-->





                                            <%
                                                for (Defect d : dList) {
                                                    int sev = d.getSeverity();
                                                    String severity = "";
                                                    if (sev == 1) {
                                                        severity = "Low";
                                                    } else if (sev == 2) {
                                                        severity = "Medium";
                                                    } else if (sev == 3) {
                                                        severity = "High";
                                                    }
                                            %>
                                            <!--                        <section class="panel">
                                                                        <div class="panel-body">
                                                                            <table class="table  table-hover general-table">
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th colspan="2">Project <%=d.getProjectName()%></th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tr>
                                                                                    <td>Defect name: </td>
                                                                                    <td><%=d.getDefectName()%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>Severity: </td>
                                                                                    <td><%=severity%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>Description: </td>
                                                                                    <td><%=d.getDesc()%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>Screenshots uploaded: </td>
                                            <% int size = DefectScreenshotDAO.getScreenshotTimestamp("" + d.getId()).size(); %>
                                            <td><%if (size == 0) {%>NIL
                                            <%} else {%>
                                        <a href="viewScreenshot.jsp?id=<%=d.getId()%>&updatetime=<%=d.getUpdateTime()%>"><%=DefectScreenshotDAO.getScreenshotTimestamp("" + d.getId()).size()%><%}%></a></td>
                                    
                                    </tr>
                                    <tr>
                                        <td>Reported by: </td>
                                        <td><%=d.getReportedBy()%></td>
                                    </tr>
                                    <tr>
                                        <td>Last updated time: </td>
                                        <td><% out.println(d.getUpdateTime().subSequence(0, 16)); %></td>
                                    </tr>
                                            <%

                                                if (dev != null && d.getIsComplete() == 0) {
                                            %>
                                            <tr>
                                                <td>Defect status:</td>
                                                <td><a href='defectComplete?id=<%=d.getId()%>&case=2'><span class="label label-success label-mini">Defect completed, click to mark complete</span></a></td>
                                               
                                            </tr>
                                            <%
                                                }
                                            %>
        
                                        </table>
                                    </div>
                                </section>-->
                                            <%
                                                }
                                            %>
                                            </section>
                                        </div>
                                    </div>
                                </section>
                                </section>
                                </table>
                                </body>
                                </html>