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
<%@include file="protectPMandTester.jsp" %>
<%String thisPage = "manageDefects"; //This is to change the highlight in Navigation Bar%>
<%String selected = null;%>
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
        <script type="text/javascript">
            function confirmDelete(x) {
                var agree = confirm("Are you sure you want to delete this defect?");
                if (agree) {
                    window.location = x;
                } else {
                    return false;
                }
            }
        </script>
    </head>
    <body>

        <%  String errorMsg = (String) request.getAttribute("err");
            String sucess = (String) request.getAttribute("sucess");
            ArrayList<String> errorMsg1 = (ArrayList<String>) request.getAttribute("err1"); %>

        <section id="main-content">
            <section class="wrapper">
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
                <%if (errorMsg1 != null) {%>
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
                <%
                    Person per = null;
                    if(session.getAttribute("loggedInPm")!=null){
                        per = (Person)session.getAttribute("loggedInPm");
                    }else{
                        per = (Person)session.getAttribute("loggedInTester");
                    }
                %>
                <div class="row">
                    <div class="col-lg-12">
                        <!--                        <section class="panel">
                                                    <header class="panel-heading tab-bg-dark-navy-blue ">
                                                        <ul class="nav nav-tabs">
                                                            <li class="active">
                                                                <a data-toggle="tab" href="#home">Sort defects</a>
                                                            </li>
                                                            <li class="">
                                                                <a data-toggle="tab" href="#about">Filter Defects</a>
                                                            </li>
                                                        </ul>
                                                    </header>
                                                    <div class="panel-body">
                                                        <div class="tab-content">
                                                            <div id="home" class="tab-pane active">
                                                                <form action="sortData" class="form-group">
                                                                    <label class="control-label col-lg-2" for="inputSuccess">Sort by:</label>
                                                                    <div class="col-lg-3">
                                                                        <select name="sortby" class="form-control m-bot15">
                                                                            <option value=''>Select one...</option>
                                                                            <option value="projectname">Project Name</option>
                                                                            <option value="defectname">Defect Name</option>
                                                                            <option value="updatetime">Update Time</option>
                                                                        </select>
                                                                        <input type="hidden"  name='username' value='<%=per.getUsername()%>'/>
                                                                        <input type='hidden' value='' name='inputText'/>
                                                                        <input type='hidden' value='' name='filter'/>
                                                                        <input type='hidden' value='pm' name='case'/>
                                                                    </div>
                                                                    <div class="col-lg-3">
                                                                        <button type="submit" class="btn btn-primary">Sort</button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                            <div id="about" class="tab-pane" class="form-control m-bot15">
                                                                <form action="sortData" class="form-group">
                                                                    <label class="control-label col-lg-2" for="inputSuccess">Filter by:</label>
                                                                    <div class="col-lg-3">
                                                                        <select name="filter" id="role" class="form-control m-bot15">
                                                                            <option>Select one..</option>
                                                                            <option value="projectname">Project Name</option>
                                                                            <option value="defectname">Defect Name</option>
                                                                            <option value="severity">Severity</option>
                                                                            <option value="iscomplete">Completion status</option>
                                                                        </select>
                                                                    </div>
                                                                    <div id="pname">
                        <%
                            ArrayList<Project> pList = ProjectDAO.retrieveAll();
                        %>
                        <div class="col-lg-3">
                            <select name="inputP" class="form-control m-bot15">
                        <%for (Project p : pList) {%>
                        <option value='<%=p.getName()%>'><%=p.getName()%></option>
                        <%}%>
                    </select>
                </div>
            </div>
            <div id="severity">
                <div class="col-lg-3">
                    <select name="inputS" class="form-control m-bot15">
                        <option value="1">Low</option>
                        <option value="2">Medium</option>
                        <option value="3">High</option>
                    </select>
                </div>
            </div>
            <div id="completed">
                <div class="col-lg-3">
                    <select name="inputC" class="form-control m-bot15">
                        <option value="0">Developer has not yet complete</option>
                        <option value="1">Developer has marked as completed</option>
                        <option value="2">Defect has been resolved</option>
                    </select>
                </div>
            </div>

            <input type="hidden" name='username' value='<%=per.getUsername()%>'/>
            <input type='hidden' name='sortby' value=''/>
            <input type='hidden' value='pm' name='case'/>

            <div class="col-lg-1">
                <button type="submit" class="btn btn-primary">Filter</button>
            </div>
        </form>
    </div>
</div>
</div>
</section>-->
                        <!--kaiwen codes-->

                        <%
                            ArrayList<Defect> dList = null;
                            if(pm!=null){
                            dList = DefectDAO.retrievePm(pm.getUsername());
                            }else{
                            dList = DefectDAO.retrieveTester();
                            }
                        %>

                        <%for (Project p : pList) {%>
                        <div class="row">
                            <div class="col-sm-12">
                                <section class="panel">
                                    <header class="panel-heading">
                                        Project <%=p.getName()%>
                                        <span class="tools pull-right">
                                            <a href="addDefect.jsp?name=<%=p.getName()%>" class="fa fa-plus-circle"></a>
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
                                                    if (pm != null) {
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
                                                                <%String dName;
                                                                    if (d.getDefectName().length() > 20) {
                                                                        dName = d.getDefectName().substring(0, 20) + "...";
                                                                    } else {
                                                                        dName = d.getDefectName();
                                                                    }
                                                                        out.println("<table border='0' width='100%'><tr><td><b>Defect Name: </b></td><td> " + dName + "</td></tr>");
                                                                        out.println("<tr><td><b>Severity: </b></td><td> " + severity + "</td></tr>");
                                                                        out.println("<tr><td><b>Creation date: </b></td><td> " + d.getUpdateTime().subSequence(0, 16) + "</td></tr>");
                                                                        out.println("<tr><td><b>Duedate: </b></td><td> " + d.getDuedate() + "</td></tr>");                                                                        
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
                                                                out.println("<a href='addDefect.jsp?name=" + p.getName() + "'>No defects found <i>yet</i>. <br/><br/><button type='button' class='btn btn-round btn-primary'>Add a defect</button></a>");
                                                            }

                                                            count = 0;

                                                        %>
                                                    </div>
                                                    </section>
                                                </div>
                                            </div>
                                            <% } %>

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
                                                                                        <th>Project <%=d.getProjectName()%></th>
                                                                                        <th><div align="right"><a href="defectscreenshot.jsp?id=<%=d.getId()%>"> <i class="fa fa-picture-o"></i> Add Screenshot </a> | 
                                                                                    <a href="editDefect.jsp?id=<%=d.getId()%>"> <i class="fa fa-pencil-square-o"></i> Edit </a> | 
                                                                                    <a href="#" onclick="confirmDelete('defectComplete?id=<%=d.getId()%>&case=0');"> <i class="fa fa-minus-circle"></i> Delete </a></div>
                                                                                </th>
                                                                                </tr>
                                                                                </thead>
                                                                                <tr>
                                                                                    <td>Defect name: </td>
                                                                                    <td><%=d.getDefectName()%> </td>
                                                                                </tr>
                                            <%
                                                if (pm != null) {
                                                    if (d.getIsComplete() == 1) {
                                            %>
        
                                            <tr>
                                                <td>Defect status:</td>
                                                <td><a href="defectComplete?id=<%=d.getId()%>&case=1"><span class="label label-success label-mini">Defect completed, click to mark complete</span></a></td>
        
                                            </tr>
                                            <%
                                            } else if (d.getIsComplete() == 0) {
                                            %>
                                            <tr>
                                                <td>Defect Status:</td>
                                                <td><span class="label label-danger label-mini">Defect not completed</span></td>
                                            </tr>
        
                                            <%
                                                }
                                            %> 
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
                                                }


                                            %>
                                        </table>
                                    </div>
                                </section>-->
                                            <%                        }

                                            %>
                                            </section>
                                        </div>
                                    </div>
                                </section>
                                </section>
                                </table>
                                </body>
                                </html>
