<%-- 
    Document   : viewDefects
    Created on : Dec 11, 2015, 6:27:02 PM
    Author     : maxchua
--%>

<%@page import="src.model.Defect"%>
<%@page import="src.model.DefectDAO"%>
<%@page import="java.util.ArrayList"%>
<%@include file="protectTester.jsp" %>
<%@include file="protectPM.jsp" %>
<%String thisPage = "manageDefects"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Defects</title>
    </head>
    <body>
        <section id="main-content">
            <section class="wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <section class="panel">
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
                                                    <option value="projectname">Project Name</option>
                                                    <option value="defectname">Defect Name</option>
                                                    <option value="updatetime">Latest Update Time</option>
                                                    <option value='iscomplete'>Defect Status</option>
                                                </select>
                                                <input type="hidden"  name='username' value='<%=pm.getUsername()%>'/>
                                                <input type='hidden' value='' name='inputText'/>
                                                <input type='hidden' value='' name='filter'/>
                                                <input type='hidden' value='pm' name='case'/>
                                            </div>
                                            <div class="col-lg-3">
                                                <button type="submit" class="btn btn-danger">Sort</button>
                                            </div>
                                        </form>
                                    </div>
                                    <div id="about" class="tab-pane" class="form-control m-bot15">
                                        <form action="sortData" class="form-group">
                                            <label class="control-label col-lg-2" for="inputSuccess">Filter by:</label>
                                            <div class="col-lg-3">
                                                <select name="filter" class="form-control m-bot15">
                                                    <option value="projectname">Project Name</option>
                                                    <option value="defectname">Defect Name</option>
                                                    <option value="severity">Severity</option>
                                                </select>
                                            </div>
                                            <label class="control-label col-lg-2" for="inputSuccess">Search for:</label>
                                            <div class="col-lg-3">
                                                <input type="text" name="inputText" class="form-control"/> </br>
                                                <input type="hidden" name='username' value='<%=pm.getUsername()%>'/>
                                                <input type='hidden' name='sortby' value=''/>
                                                <input type='hidden' value='pm' name='case'/>
                                            </div>
                                            <div class="col-lg-1">
                                                <button type="submit" class="btn btn-danger">Filter</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </section>

<!--                            <h2>Sort results</h2>
                            <form action="sortData">
                                <select name="sortby">
                                    <option value="projectname">Project Name</option>
                                    <option value="defectname">Defect Name</option>
                                    <option value="updatetime">Latest Update Time</option>
                                    <option value='iscomplete'>Defect Status</option>
                                </select>
                                <input type="hidden"  name='username' value='<%=pm.getUsername()%>'/>
                                <input type='hidden' value='' name='inputText'/>
                                <input type='hidden' value='' name='filter'/>
                                <input type='hidden' value='pm' name='case'/>
                                <input type="submit" value="Sort!"/>
                            </form>
                            <h2>Filter results</h2>
                            <form action="sortData">
                                <select name="filter">
                                    <option value="projectname">Project Name</option>
                                    <option value="defectname">Defect Name</option>
                                    <option value="severity">Severity</option>
                                </select>
                                Search for: <input type="text" name="inputText"/> </br>
                                <input type="hidden" name='username' value='<%=pm.getUsername()%>'/>
                                <input type='hidden' name='sortby' value=''/>
                                <input type='hidden' value='pm' name='case'/>
                                <input type="submit" value="Filter!"/>

                            </form>-->

                            <%
                                ArrayList<Defect> dList = DefectDAO.retrievePm(pm.getUsername());
                            %>
                            
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
                                <section class="panel">
                            <div class="panel-body">
                                <table class="table table-bordered">
                                    <th><b>Project <%=d.getProjectName()%></b></th>
                                    <td><div align="right"><a href="editDefect.jsp" class="fa fa-picture-o">Add Screenshot </a> | <a href="editDefect.jsp" class="fa fa-pencil-square-o">Edit </a> | <a href="editDefect.jsp" class="fa fa-minus-circle">Delete </a></div></td>
                                <tr>
                                    <td>Name of Defect: </td>
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
                                    <td>Reported by: </td>
                                    <td><%=d.getReportedBy()%></td>
                                </tr>
                                <tr>
                                    <td>Last updated time: </td>
                                    <td><%=d.getUpdateTime()%></td>
                                </tr>
                                <%
                                    if (pm != null) {
                                        if (d.getIsComplete() == 1) {
                                %>

                                <tr>
                                    <td><div class="text-success">Developer has completed, mark Complete?</div></td>
                                    <td><a href='defectComplete?id=<%=d.getId()%>&case=1'>Yes</a></td>
                                </tr>
                                <%
                                } else if (d.getIsComplete() == 0) {
                                %>
                                <tr>
                                    <td colspan="2"><div class="text-danger">Developer has not yet completed the defect</div></td>
                                </tr>

                                <%
                                    }
                                %> 
                                <tr>
                                    <td>Add Screenshot: </td>
                                    <td><a href='defectscreenshot.jsp?id=<%=d.getId()%>'>Yes</a></td>
                                </tr>
                                <tr>
                                    <td>Edit : </td>
                                    <td><a href='editDefect.jsp?id=<%=d.getId()%>'>Yes</a></td>
                                </tr>
                                <tr>
                                    <td>Delete :</td>
                                    <td><a href='defectComplete?id=<%=d.getId()%>&case=0'>Yes</a></td>
                                </tr>
                                <%
                                    }


                                %>

                                </table>
                            </div>
                                </section>
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
