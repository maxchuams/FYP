<%-- 
    Document   : viewDefectInfo
    Created on : Jan 15, 2016, 1:12:03 PM
    Author     : Kaiwen
--%>
<%@page import="src.model.DefectCommitBy"%>
<%@page import="src.model.DefectCommitByDAO"%>
<%@page import="src.model.ProjectAllocationDAO"%>
<%@page import="src.model.ProjectAllocation"%>
<%@page import="src.model.Project"%>
<%@page import="src.model.ProjectDAO"%>
<%@page import="src.model.DefectScreenshotDAO"%>
<%@page import="src.model.Defect"%>
<%@page import="src.model.DefectDAO"%>
<%@page import="java.util.ArrayList"%>
<%@include file="protectPMandDev.jsp" %>
<% String thisPage = "";
    if (pm != null) {
        thisPage = "manageDefects";
    } else {%>
<%thisPage = "viewDefects";
    } //This is to change the highlight in Navigation Bar %>
<%String selected = null;%>
<%@include file="navbar.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- gx i removed this line below to make the nav bar work properly, please check if its messing up anything-->
        <!--    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>-->
        <link href="./css/lightbox.css" rel="stylesheet"></link>

        <title>View Defect Info</title>
    </head>
    <body>


        <%
            String defectId = request.getParameter("defectId");
            Defect d = DefectDAO.retrieveDefect(Integer.parseInt(defectId));
        %>
        <section id="main-content">
            <section class="wrapper">
                <!--Error/success display-->
                <%  String errorMsg = (String) request.getAttribute("err");
                    String sucess = (String) request.getAttribute("sucess");
                    String success = (String) request.getAttribute("success");
                    ArrayList<String> errorList = (ArrayList<String>) request.getAttribute("errList");

                %>
                <%if (errorMsg != null) {%>
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
                <%}%>
                <%if (success != null) {%>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="alert alert-success fade in">
                                <button data-dismiss="alert" class="close close-sm" type="button">
                                    <i class="fa fa-times"></i>
                                </button>
                                <%=success%>
                            </div>
                        </section>
                    </div>
                </div>
                <%}%>
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
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <header class="panel-heading">
                                Viewing Defect: <%=d.getDefectName()%> 
                                <span class="tools pull-right">
                                    <% if (pm != null) {%>
                                    <a href="defectscreenshot.jsp?id=<%=d.getId()%>">
                                        <i class="fa fa-picture-o"></i>
                                        <span>Add Screenshot</span>
                                    </a>
                                    <a href="editDefect.jsp?id=<%=d.getId()%>">
                                        <i class="fa fa-pencil-square-o"></i>
                                        <span>Edit</span>
                                    </a>


                                    <a href="removeDefect?id=<%=d.getId()%>" onclick="return confirm('Confirm delete?')"><i class="fa fa-minus-circle"></i><span> Delete</span></a>
                                            <% } %>

                                    <a href="javascript:;" class="fa fa-chevron-down"></a>
                                </span>
                            </header>
                            <div class="panel-body">
                                <table class="table  table-hover general-table">
                                    <thead><tr><td>Defect status</td><td>
                                                <%if (d.getIsComplete() == 0) { //defect not completed
                                                        if (pm == null) {%>
                                                <a href='defectComplete?id=<%=d.getId()%>&case=2'>
                                                    <%out.println("<span class='label label-danger label-mini' title='Defect has been fixed&#13;Mark defect as complete'>MARK AS FIXED</span></a>");
                                                        } else {
                                                            out.println("<span class='label label-danger label-mini' title='Defect not yet fixed&#13;Awaiting updates from Developer'>DEFECT IN PROGRESS</span></a>");
                                                        }
                                                    } else if (d.getIsComplete() == 1 && pm != null) { //defect marked as complete by dev
%><a href='defectComplete?id=<%=d.getId()%>&case=1'>
                                                        <%out.println("<span class='label label-warning label-mini' title='Defect fixed by developer&#13;Please check and mark complete'>MARK AS FIXED</span></a>");
                                                            } else if (d.getIsComplete() == 1 && dev != null) {
                                                                out.println("<span class='label label-warning label-mini' title='Defect fixed&#13;Awaiting checks from PM'>CHECKING IN PROGRESS</span>");
                                                            } else if (d.getIsComplete() == 2) { //defect marked complete by both PM and dev
                                                                out.println("<span class='label label-success label-mini' title='Defect fixed by Dev&#13; and checked by PM'>DEFECT FIXED</span>");
                                                            } %></td></tr>
                                                        <tr><td>Defect severity</td><td>
                                                                <% int sevInt = d.getSeverity();
                                                                    if (sevInt == 1) {
                                                                        out.println("Low");
                                                                    } else if (sevInt == 2) {
                                                                        out.println("Medium");
                                                                    } else if (sevInt == 3) {
                                                                        out.println("High");
                                                                    }%></td></tr><thead>
                                                            <tr><td>Defect description</td><td><%
                                                                if (d.getDesc().length() == 0) {
                                                                    out.println("No description");
                                                                } else {
                                                                    out.println(d.getDesc());
                                                                }%>
                                                                </td></tr>
                                                            <tr>
                                                                <td>Reported by</td>
                                                                <td><%=d.getReportedBy()%></td>
                                                            </tr>
                                                            <% if (pm != null) { %>
                                                            <tr>
                                                                <td>Caused by</td>
                                                                <td>
                                                                    <%
                                                                        ArrayList<DefectCommitBy> defCList = DefectCommitByDAO.retrieveBlameForDefect(d.getId());
                                                                        for (DefectCommitBy dcb : defCList) {
                                                                    %>
                                                                    <%=dcb.getUsername()%> 
                                                                    <%
                                                                        }
                                                                    %>
                                                                </td>
                                                            </tr>
                                                            <% } %>
                                                            <tr>
                                                                <td>Project done by</td>
                                                                <td><%
                                                                    ArrayList<String> pa = ProjectAllocationDAO.retrieveDev(d.getProjectName());
                                                                    for (String getDev : pa) {
                                                                        out.println(getDev + "<br/>");
                                                                    }
                                                                    %></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Defect assigned to</td>
                                                                <td><%=d.getAssignto()%></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Due Date</td>
                                                                <td><% out.println(d.getDuedate()); %></td>
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
                                                                    <div class="fbphotobox">
                                                                        <%  ArrayList<String> screenshotTime = DefectScreenshotDAO.getScreenshotTimestamp("" + d.getId());
                                                                            for (String time : screenshotTime) {
                                                                        %>

                                                                        <a class="example-image-link" href="DefectScreenshotServlet?defectid=<%=d.getId()%>&updatetime=<%=time%>" data-lightbox="example-set" data-title="Click anywhere outside the image or the X to the right to close."><img style="height:75px;width:75px" class="example-image" src="DefectScreenshotServlet?defectid=<%=d.getId()%>&updatetime=<%=time%>" alt="" /></a>
                                                                            <%
                                                                                }
                                                                            %>
                                                                        <script src="./js/lightbox.js"></script>
                                                                    <%}%></td>
                                                            </tr>
                                                            </table>
                                                            </div>
                                                            </section>
                                                            </div>
                                                            </div>

                                                            <% if (pm != null) {
                                                                String projName = d.getProjectName();
                                                                ArrayList<Defect> dList = DefectDAO.retrievePm(pm.getUsername());
                                                            %>
                                                            <!--show project's defect-->
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <section class="panel">
                                                                    <header class="panel-heading">
                                                                        Defects under Project <%=projName%>
                                                                        <span class="tools pull-right">
                                                                            <a href="addDefect.jsp?name=<%=projName%>" class="fa fa-plus-circle"></a>
                                                                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                                                                        </span>
                                                                    </header>
                                                                    <div class="panel-body">
                                                                        <%
                                                                            int count = 0;
                                                                            for (Defect def : dList) {
                                                                                int sev = def.getSeverity();
                                                                                String severity = "";
                                                                                if (sev == 1) {
                                                                                    severity = "Low";
                                                                                } else if (sev == 2) {
                                                                                    severity = "Medium";
                                                                                } else if (sev == 3) {
                                                                                    severity = "High";
                                                                                }
                                                                                if (projName.equalsIgnoreCase(def.getProjectName())) {
                                                                                    if (pm != null) {
                                                                                        out.println("<a href='viewDefectInfo.jsp?defectId=" + def.getId() + "'>");
                                                                                        if (def.getIsComplete() == 2) { %>
                                                                        <div class='col-lg-4 col-sm-4'> 
                                                                            <div class="alert alert-success fade in"> 
                                                                                <% } else if (def.getIsComplete() == 1) {
                                                                                %> 
                                                                                <div class='col-lg-4 col-sm-4'> 
                                                                                    <div class="alert alert-warning fade in"> 
                                                                                        <% } else if (def.getIsComplete() == 0) { %>
                                                                                        <div class='col-lg-4 col-sm-4'> 
                                                                                            <div class="alert alert-danger fade in"> 
                                                                                                <% }
                                                                                                %>
                                                                                                <%
                                                                                                        String dName;
                                                                                                        if (def.getDefectName().length() > 20) {
                                                                                                            dName = def.getDefectName().substring(0, 20) + "...";
                                                                                                        } else {
                                                                                                            dName = def.getDefectName();
                                                                                                        }
                                                                                                        out.println("<table border='0' width='100%'><tr><td style='text-align:left'><b>Defect Name: </b></td><td style='text-align:left'> " + dName + "</td></tr>");
                                                                                                        out.println("<tr><td style='text-align:left'><b>Severity: </b></td><td style='text-align:left'> " + severity + "</td></tr>");
                                                                                                        out.println("<tr><td style='text-align:left'><b>Date: </b></td><td style='text-align:left'> " + def.getUpdateTime().subSequence(0, 16) + "</td></tr>");
                                                                                                        out.println("</table>");
                                                                                                    }
                                                                                                %> 
                                                                                            </div>
                                                                                        </div>
                                                                                        </a>
                                                                                        <%
                                                                                                    count++;
                                                                                                }
                                                                                            }
                                                                                            if (count == 0) {
                                                                                                out.println("<a href='addDefect.jsp?name=" + projName + "'>No defects found <i>yet</i>. <br/><br/><button type='button' class='btn btn-round btn-primary'>Add a defect</button></a>");
                                                                                            }

                                                                                            count = 0;

                                                                                        %>
                                                                                    </div>
                                                                                    </section>
                                                                                </div>
                                                                            </div>
                                                                            <% }%>
                                                                            <!--end of proj's defect-->

                                                                            </section>
                                                                            </section>
                                                                            </body>
                                                                            </html>
