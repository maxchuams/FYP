<%-- 
    Document   : viewTrelloCards
    Created on : Oct 5, 2015, 2:15:52 AM
    Author     : admin
--%>

<%@page import="src.model.CronDAO"%>
<%@page import="src.model.ProjectAllocationDAO"%>
<%@page import="src.model.ProjectDAO"%>
<%@page import="src.model.Project"%>
<%@page import="src.model.TrelloCardDAO"%>
<%@page import="src.model.TrelloCard"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.model.TrelloBoard"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="protect.jsp"%>
<%String thisPage = "viewTrelloCards"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trello</title>
    </head>
    <body>
        <%
            String userid = "";
            String role = "";
            if (dev != null) {
                userid = dev.getUsername();
                role = "dev";
            }
            if (pm != null) {
                userid = pm.getUsername();
                role = "pm";
            }
            ArrayList<Project> tList = ProjectDAO.retrieveByUser(role, userid);

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
                            <div class="panel-body">
                                <label class='pull-left top-menu'>Viewing my projects
                                    </br>Last update time: <%=CronDAO.retrieveTime()%></label>
                                <form action="updateProjectFromTrello">
                                    <input type="hidden" name="page" value="viewTrelloCards"/>
                                    <button type="submit" class="btn btn-info pull-right top-menu" onClick="updateProjectFromTrello">
                                        Pull Assigned Projects From Trello
                                    </button>
                                </form>
                            </div>
                        </section>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">

                        <div class="row-fluid" id="draggable_portlets">
                            <div class="row">

                                <%
                                    for (Project t : tList) {
                                        if (t.getIsComplete() == 0) {
                                %> 
                                <!-- BEGIN Portlet PORTLET-->
                                <% out.println("<a href='viewProjectInfo.jsp?projectName=" + t.getName() + "'>");
                                String pName;
                                    if(t.getName().length()>30){
                                        pName=t.getName().substring(0,30)+"...";
                                    }else{
                                        pName = t.getName();
                                    }
                                %>
                                <div class="col-md-4">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            <%=pName%>
                                            <span class="tools pull-right">
                                            </span>
                                        </div>
                                        <div class="panel-body">
                                            <ul class="nav nav-pills nav-stacked">
                                                <div class="col-md-2 col-xs-2">
                                                    <div class="tm-avatar">
                                                        <% if(ProjectDAO.retrieveTrelloPhoto(t.getName())==null){
                                                            %><img src="bootstrap/html/images/tempProj.png" alt=""/>
                                                        <%
                                                        }else{
                                                            String photo = ProjectDAO.retrieveTrelloPhoto(t.getName());
                                                            String photoExt = "";
                                                            if(photo.length()>=3){
                                                                photoExt = photo.substring(photo.length() - 3);
                                                            }
                                                            if(photoExt.equals("jpg") || photoExt.equals("png")){%>
                                                                <img src="<%=ProjectDAO.retrieveTrelloPhoto(t.getName())%>" alt=""/>
                                                            <%} else{  %>
                                                            <img src="bootstrap/html/images/tempProj.png" alt=""/>
                                                        <%}}%>
                                                    </div>
                                                </div>

                                                <span class="pull-right">
                                                    <li><span class="badge label-danger pull-left r-activity"><i class="fa fa-bell-o"></i>  <%=t.getDuedate()%></span></li><br/><br/>
                                                    <li> <b>Type:</b> <%=t.getType()%> </li>
                                                        <% if (dev != null && pm == null) {%>
                                                    <li> <b>Assigned by:</b> <%=t.getAssignedBy()%> <%}%></li>
                                                    <li> <b>Developer:</b>
                                                        <%
                                                            ArrayList<String> getDev = ProjectAllocationDAO.retrieveDev(t.getName());
                                                            if (getDev.size() == 1) {
                                                                for (String developer : getDev) {
                                                                    out.println(developer);
                                                                }
                                                            } else if (getDev.size() > 0) {
                                                                out.println(getDev.size() + " Developers");
                                                            } else {
                                                                out.println("No Developer");
                                                            }

                                                        %>
                                                    </li>
                                                </span>

                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                </a>
                                <!-- END Portlet PORTLET-->
                                <% }
                                    }%>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </section>
        </section>
    </body>
</html>
