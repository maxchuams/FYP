<%-- 
    Document   : viewProjectInfo
    Created on : Jan 21, 2016, 4:29:41 PM
    Author     : Kaiwen
--%>
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
                                                Due date
                                            </th>
                                            <th>
                                                <%=p.getDuedate()%>
                                            </th>
                                    </tr></thead>
                                    <tr>
                                        <td>
                                            Start and end date
                                        </td>
                                        <td>
                                            To get from Lam
                                        </td>
                                    </tr>
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
            </section>
        </section>
    </body>
</html>
