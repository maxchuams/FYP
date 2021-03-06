<%-- 
    Document   : sortedDefects
    Created on : Dec 14, 2015, 3:05:42 PM
    Author     : maxchua
--%>
<%@page import="src.model.Project"%>
<%@page import="src.model.ProjectDAO"%>
<%@page import="src.model.DefectScreenshotDAO"%>
<%@page import="src.model.Defect"%>
<%@page import="src.model.DefectDAO"%>
<%@page import="java.util.ArrayList"%>
<%@include file="protectDev.jsp" %>
<%String thisPage = "viewSortedDefects"; //This is to change the highlight in Navigation Bar%>
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
                    if($('#role').val() == 'iscomplete') { //if this value is NOT selected
                        $('#pname').hide();
                        $('#completed').show();
                        $('#severity').hide();//this field is hidden
                    }
                });
            });
        </script>
    </head>
    <body>
        <%String sortby = request.getParameter("sortby");%>
        <%String filterby = request.getParameter("filterby");%>
        <%String filterText = request.getParameter("filterText");%>
        <% 
        if(sortby==null && filterby==null){
            response.sendRedirect("manageDefects.jsp");
        }
        %>
         <%  String errorMsg = (String) request.getAttribute("err");
             ArrayList<Defect> sucess = (ArrayList<Defect>) request.getAttribute("sucess");
        %>
        
        <section id="main-content">
            <section class="wrapper">
                <%if (errorMsg!=null){ %>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="panel-body">
                                <div class="text-danger"><%=errorMsg%></div>
                            </div>
                        </section>
                    </div>
                </div>
                            <%}%>
                <div class="row">
                    <div class="col-lg-12">
                        <!--tab nav start-->
                        <section class="panel">
                            <header class="panel-heading tab-bg-dark-navy-blue ">
                                <ul class="nav nav-tabs">
                                    <%if (sortby!= null && sortby.length()!=0) {%>
                                    <li class="active">
                                        <a data-toggle="tab" href="#home">Sort defects</a>
                                    </li>
                                    <li class="">
                                        <a data-toggle="tab" href="#about">Filter Defects</a>
                                    </li>
                                    <%}%>
                                    <%if (filterby != null && filterby.length()!=0) {%>
                                    <li class="">
                                        <a data-toggle="tab" href="#home">Sort defects</a>
                                    </li>
                                    <li class="active">
                                        <a data-toggle="tab" href="#about">Filter Defects</a>
                                    </li>
                                    <%}%>

                                </ul>
                            </header>
                            <div class="panel-body">
                                <div class="tab-content">
                                    
                                    <%if (sortby != null && sortby.length()!=0) {%>  
                                    <div id="home" class="tab-pane active">
                                        <%} else {%>
                                        <div id="home" class="tab-pane">
                                            <%}%>
                                            
                                        <form action="sortData" class="form-group">
                                            <label class="control-label col-lg-2" for="inputSuccess">Sort by:</label>
                                            <div class="col-lg-3">
                                                <select name="sortby" class="form-control m-bot15">
                                                    <%
                                                            if ("projectname".equals(sortby)) {
                                                                out.println("<option value='projectname' selected>Project Name</option>");
                                                                out.println("<option value='defectname'>Defect Name</option>");
                                                                out.println("<option value='updatetime'>Update Time</option>");
                                                            } else if ("defectname".equals(sortby)) {
                                                                out.println("<option value='projectname'>Project Name</option>");
                                                                out.println("<option value='defectname' selected>Defect Name</option>");
                                                                out.println("<option value='updatetime'>Update Time</option>");
                                                            } else if ("updatetime".equals(sortby)) {
                                                                out.println("<option value='projectname'>Project Name</option>");
                                                                out.println("<option value='defectname'>Defect Name</option>");
                                                                out.println("<option value='updatetime' selected>Update Time</option>");
                                                            } else {
                                                                out.println("<option value=''>Please select one...</option>");
                                                                out.println("<option value='projectname'>Project Name</option>");
                                                                out.println("<option value='defectname'>Defect Name</option>");
                                                                out.println("<option value='updatetime'>Update Time</option>");
                                                            }
                                                        %>
                                                    <!--<option value='iscomplete'>Defect Status</option>-->
                                                </select>
                                                <input type="hidden"  name='username' value='<%=dev.getUsername()%>'/>
                                                <input type='hidden' value='' name='inputText'/>
                                                <input type='hidden' value='' name='filter'/>
                                                <input type='hidden' value='dev' name='case'/>
                                            </div>
                                            <div class="col-lg-3">
                                                <button type="submit" class="btn btn-primary">Sort</button>
                                            </div>
                                        </form>
                                    </div>
                                                <%if (filterby != null && filterby.length()!=0) {%>
                                        <div id="about" class="tab-pane active" class="form-control m-bot15">
                                            <% } else { %>
                                            <div id="about" class="tab-pane" class="form-control m-bot15">
                                                <% } %>
                                    <!--<div id="about" class="tab-pane" class="form-control m-bot15">-->
                                        <form action="sortData" class="form-group">
                                            <label class="control-label col-lg-2" for="inputSuccess">Filter by:</label>
                                            <div class="col-lg-3">
                                                <select name="filter" id="role" class="form-control m-bot15">
                                                    <option>Select one..</option>
                                                    <option value="projectname">Project Name</option>
                                                    <!--<option value="defectname">Defect Name</option>-->
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
                                            <input type="hidden" name='username' value='<%=dev.getUsername()%>'/>
                                            <input type='hidden' name='sortby' value=''/>
                                            <input type='hidden' value='dev' name='case'/>

                                            <div class="col-lg-1">
                                                <button type="submit" class="btn btn-primary">Filter</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                            <%if ("projectname".equals(filterby)) {%>
                                        <div class="col-md-12">
                                        <div class="well">
                                            Filtering by: Project Name, <%=filterText%>
                                        </div>
                                        </div>
                                    <%}%>
                                    <%if ("severity".equals(filterby)) {%>
                                    <div class="col-md-12">
                                        <div class="well">
                                            Filtering by:
                                            <%if (filterText.equals("1")){%>Severity, Low<%}%>
                                            <%if (filterText.equals("2")){%>Severity, Medium<%}%>
                                            <%if (filterText.equals("3")){%>Severity, High<%}%>
                                            
                                        </div>
                                    </div>
                                    <%}%>
                                    <%if ("iscomplete".equals(filterby)) {%>
                                    <div class="col-md-12">
                                        <div class="well">
                                            Filtering by: 
                                            <%if (filterText.equals("0")){%>Completion Status, Developer has not yet complete<%}%>
                                            <%if (filterText.equals("1")){%>Completion Status, Developer has marked as completed<%}%>
                                            <%if (filterText.equals("2")){%>Completion Status, Defect has been resolved<%}%>
                                            
                                        </div>
                                            <div class="col-md-12">
                                    <%}%>
                                    
                            </div>
                        </section>
        
        
        
            <%
            if(sucess!=null){
               %>
            <%
                for(Defect d: sucess){
                    int sev = d.getSeverity();
                    String severity = "";
                    if(sev ==1){
                        severity = "Low";
                    } else if (sev == 2){
                        severity = "Medium";
                    } else if(sev == 3){
                        severity = "High";
                    }
                    %>
                    <section class="panel">
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
                                        <% int size = DefectScreenshotDAO.getScreenshotTimestamp("" +d.getId()).size(); %>
                                        <td><%if (size==0){%>NIL
                                            <%}else{%>
                                        <a href="viewScreenshot.jsp?id=<%=d.getId()%>&updatetime=<%=d.getUpdateTime()%>"><%=DefectScreenshotDAO.getScreenshotTimestamp("" + d.getId()).size()%><%}%></a></td>
                                    </tr>
                    <tr>
                        <td>Reported by: </td>
                        <td><%=d.getReportedBy()%></td>
                    </tr>
                     <tr>
                        <td>Last updated time: </td>
                        <td><% out.println(d.getUpdateTime().subSequence(0,16)); %></td>
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
                        </section>                    
                    <%
                }
            
            %>
        
               
               <%
            }
            %>
                    </div>
                </div>
            </section>
        </section>
    </body>
</html>
