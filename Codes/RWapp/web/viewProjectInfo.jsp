<%-- 
    Document   : viewProjectInfo
    Created on : Jan 21, 2016, 4:29:41 PM
    Author     : Kaiwen
--%>
<%@page import="src.model.DefectDAO"%>
<%@page import="src.model.Defect"%>
<%@page import="src.model.ProjectAllocation"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="src.model.ProjectAllocationDAO"%>
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
            ArrayList<String> arr = ProjectDAO.retrievePlanActualEnd("recco");
            ArrayList<Defect> dList = null;
            if (pm!=null){
                dList = DefectDAO.retrievePm(pm.getUsername());
            }else if(dev!=null){
                dList = DefectDAO.retrieveDev(dev.getUsername());
            }
            ArrayList<Project> pList = ProjectDAO.retrieveAll();
        %>
        <section id="main-content">
            <section class="wrapper">
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <header class="panel-heading">
                                Viewing: Project <%=p.getName()%>
                                <span class="tools pull-right">
                                    <a href="editProject.jsp?pname=<%=p.getName()%>">
                                        <i class="fa fa-pencil-square-o"></i>
                                        <span>Edit</span>
                                    </a>
                                </span>
                            </header>
                            <div class="panel-body">
                                <table class="table  table-hover general-table">
                                    
                                    <thead><tr>
                                        <th>
                                            Start and end date
                                        </th>
                                        <th>
                                            SD: <%=arr.get(0)%><br/>
                                            ED: <%=arr.get(1)%>
                                        </th>
                                        </tr></thead>
                                    <% if (pm!=null){ %>
                                    <tr>
                                            <td>
                                                Due date
                                            </td>
                                            <td>
                                                <%=p.getDuedate()%>
                                            </td>
                                    </tr>
                                    <% } %>
                                    <tr>
                                        <td>
                                            Project manager
                                        </td>
                                        <td>
                                            <%=p.getAssignedBy()%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Developer
                                        </td>
                                        <td>
                                            <% 
                                            ArrayList<String> getDev = ProjectAllocationDAO.retrieveDev(p.getName());
                                            for (String developer : getDev){
                                                out.println(developer+"<br/>");
                                            }
                                            %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Project type
                                        </td>
                                        <td>
                                            <%=p.getType()%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Project size
                                        </td>
                                        <td>
                                            <%=p.getPsize()%>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </section>
                    </div>
                </div>
                <!--show project's defect-->
                        <div class="row">
                            <div class="col-sm-12">
                                <section class="panel">
                                    <header class="panel-heading">
                                        Defects under Project <%=p.getName()%>
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
                                                                <%
                                                                        out.println("<table border='0' width='100%'><tr><td><b>Defect Name: </b></td><td> " + d.getDefectName() + "</td></tr>");
                                                                        out.println("<tr><td><b>Severity: </b></td><td> " + severity + "</td></tr>");
                                                                        out.println("<tr><td><b>Date: </b></td><td> " + d.getUpdateTime().subSequence(0, 16) + "</td></tr>");
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
                                                                out.println("<a href='addDefect.jsp?name=" + p.getName() + "'>No defects found <i>yet</i>. <br/>Add one?</a>");
                                                            }

                                                            count = 0;

                                                        %>
                                                    </div>
                                                    </section>
                                                </div>
                                            </div>
                <!--end of proj's defect-->
            </section>
        </section>
    </body>
</html>
