    <%@page import="java.net.URLEncoder"%>
<%-- 
    Document   : viewProjectInfo
    Created on : Jan 21, 2016, 4:29:41 PM
    Author     : Kaiwen
--%>
<%@page import="java.util.Date"%>
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
        <title>Project Information</title>
    </head>
    <body>
        <%
            String projectName = request.getParameter("projectName");
            
            Project p = ProjectDAO.retrieveProjectByProjectName(projectName);
           
            ArrayList<String> arr = ProjectDAO.retrievePlanActualEnd(projectName);
           
            ArrayList<Defect> dList = null;
            if (pm != null) {
                dList = DefectDAO.retrievePm(pm.getUsername());
            } else if (dev != null) {
                dList = DefectDAO.retrieveDev(dev.getUsername());
            }
            ArrayList<Project> pList = ProjectDAO.retrieveAll();
        %>
        <section id="main-content">
            <section class="wrapper">
                <!--Error/success display-->
                <%  
                    String sucess = (String) request.getAttribute("sucess");
                    ArrayList<String> errorList = (ArrayList<String>) request.getAttribute("errList");

                %>
                
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
                                Viewing: Project <%=p.getName()%>
                                <% if(pm!=null){ %>
                                <span class="tools pull-right">
                                    <a href="editProject.jsp?pname=<%=p.getName()%>">
                                        <i class="fa fa-pencil-square-o"></i>
                                        <span>Edit</span>
                                    </a>
                                </span>
                                        <% } %>
                            </header>
                            <div class="panel-body">
                                <div class="panel-body profile-information">
                                    <div class="col-md-3">
                                        <center>
                                        <h3 class="prf-border-head"><%=p.getName()%></h3>
                                        <div class="profile-pic">
                                            <% if(ProjectDAO.retrieveTrelloPhoto(p.getName())==null){
                                                            %><img src="bootstrap/html/images/tempProj.png" alt=""/>
                                                        <%
                                                        }else{
                                                            String photo = ProjectDAO.retrieveTrelloPhoto(p.getName());
                                                            String photoExt = "";
                                                            if(photo.length()>=3){
                                                                photoExt = photo.substring(photo.length() - 3);
                                                            }
                                                            if(photoExt.equals("jpg") || photoExt.equals("png")){%>
                                                                <img src="<%=ProjectDAO.retrieveTrelloPhoto(p.getName())%>" alt=""/>
                                                            <%} else{  %>
                                                            <img src="bootstrap/html/images/tempProj.png" alt=""/>
                                                        <%}}%>

                                        </div>
                                        </center>
                                    </div>
                                <div class="col-md-9">
                                <table class="table table-hover general-table">
                                    <thead><tr>
                                            <th>

                                            </th>
                                            <th>
                                            </th>
                                            <th></th>
                                        </tr>
                                        <tr>
                                            <td>
                                                Start and end date
                                            </td>
                                            <td>
                                                
                                                SD: <% if(arr!= null && !("null").equals(arr.get(0))){%>

                                                      <%=arr.get(0)%>
                                                    <%} else { 
                                                        out.println("No dates given");
                                                }%>
                                                    
        <br/>
                                            </td>
                                            <td>
                                                ED:  <% if(arr!= null && !("null").equals(arr.get(1))){%>

                                                      <%=arr.get(1)%>
                                                    <%} else { 
                                                        out.println("No dates given");
                                                }%></td>
                                        </tr>
                                        <% if (pm != null) {%>
                                        <tr>
                                            <td>
                                                Due date
                                            </td>
                                            <td>
                                                <%=p.getDuedate()%>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <% }%>
                                        <tr>
                                            <td>
                                                Project manager
                                            </td>
                                            <td>
                                                <%=p.getAssignedBy()%>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Developer
                                            </td>
                                            <td>
                                                <%
                                                    ArrayList<String> getDev = ProjectAllocationDAO.retrieveDev(p.getName());
                                                    for (String developer : getDev) {
                                                        out.println(developer + " ");
                                                    }
                                                %>
                                            </td>
                                            <td>
                                                <% if (pm!=null){ %>
                                                <a href="removeDeveloperFromProject.jsp?id=<%=p.getTrelloKey()%>"><span class='label label-danger label-mini'>Edit developer</span></a>
                                                <% } %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Project type
                                            </td>
                                            <td>
                                                <%=p.getType()%>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Project priority
                                            </td>
                                            <td>
                                                <%
                                                int pInt = p.getPriortiy();
                                                if(pInt==1){
                                                    out.println("High Priority");
                                                }else{
                                                    out.println("Standard Priority");
                                                }
                                                %>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Project size
                                            </td>
                                            <td>
                                                <%=p.getPsize()%>
                                            </td>
                                            <td></td>
                                        </tr>
                                </table>
                                </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
                                            <% if(pm!=null){ %>
                <!--show project's defect-->
                <div class="row">
                    <div class="col-sm-12">
                        <section class="panel">
                            <header class="panel-heading">
                                Defects under Project <%=p.getName()%>
                                <span class="tools pull-right">
                                    <% String encoded =  URLEncoder.encode(p.getName());%>
                                    <a href="addDefect.jsp?name=<%=encoded%>" title='Add new Defect' class="fa fa-plus-circle"></a>
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
                                                String dName;
                                    if (d.getDefectName().length() > 20) {
                                        dName = d.getDefectName().substring(0, 20) + "...";
                                    } else {
                                        dName = d.getDefectName();
                                    }
                                                                out.println("<table border='0' width='100%'><tr><td style='text-align:left'><b>Defect Name: </b></td><td style='text-align:left'> " + dName + "</td></tr>");
                                                                out.println("<tr><td style='text-align:left'><b>Severity: </b></td><td style='text-align:left'> " + severity + "</td></tr>");
                                                                out.println("<tr><td style='text-align:left'><b>Date: </b></td><td style='text-align:left'> " + d.getUpdateTime().subSequence(0, 16) + "</td></tr>");
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
                                                        String encoded1 =  URLEncoder.encode(p.getName());
                                                        out.println("<a href='addDefect.jsp?name=" + encoded1 + "'>No defects found <i>yet</i>. <br/><br/><button type='button' class='btn btn-round btn-primary'>Add a defect</button></a>");
                                                    }

                                                    count = 0;

                                                %>
                                            </div>
                                            </section>
                                        </div>
                                    </div>
                                            <% } %>
                                    <!--end of proj's defect-->
                                    </section>
                                    </section>
                                    </body>
                                    </html>
