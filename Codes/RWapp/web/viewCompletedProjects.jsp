<%-- 
    Document   : viewTrelloCards
    Created on : Oct 5, 2015, 2:15:52 AM
    Author     : admin
--%>

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
<%String thisPage = "viewCompletedProjects"; //This is to change the highlight in Navigation Bar%>
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
                <%if (errorList!=null && errorList.size()!=0) {%>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="alert alert-block alert-danger fade in">
                                <button data-dismiss="alert" class="close close-sm" type="button">
                                    <i class="fa fa-times"></i>
                                </button>
                                <%for(String e : errorList){
                                    out.println(e);
                                }%>
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
                
                <!-- if no projects!-->
                <% int count = 0;
                    for (Project t : tList) {
                   if(t.getIsComplete() == 1){ 
                       count++;
                   }}
                    if(count==0){
   %> 
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="alert alert-block alert-danger fade in">
                                <button data-dismiss="alert" class="close close-sm" type="button">
                                    <i class="fa fa-times"></i>
                                </button>
                                There are no completed projects
                            </div>
                        </section>
                    </div>
                </div>
                <% } %>      
                <!-- if no projects end !-->
                
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="panel-body">
                                <label class='pull-left top-menu'>Viewing all my projects</label>
                                <form action="updateProjectFromTrello">
                                    <input type="hidden" name="page" value="viewCompletedProjects"/>
                                    <button type="submit" class="btn btn-primary pull-right top-menu" onClick="updateProjectFromTrello">
                                        Sync Projects
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
                                        if(t.getIsComplete() == 1){%>
                                            <!-- BEGIN Portlet PORTLET-->
                                <% out.println("<a href='viewProjectInfo.jsp?projectName=" + t.getName() + "'>");%>
                                <div class="col-md-4">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <%=t.getName()%>
                                            <span class="tools pull-right">
                                            </span>
                                        </div>
                                        <div class="panel-body">
                                            <ul class="nav nav-pills nav-stacked">
                                                <div class="col-md-2 col-xs-2">
                                                    <div class="tm-avatar">
                                                        <img src="<%=ProjectDAO.retrieveTrelloPhoto(t.getName())%>" alt=""/>
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
                                            if(getDev.size()==1){
                                                for (String developer : getDev){
                                                    out.println(developer+"<br/>");
                                                }
                                            }else{
                                                out.println("2 Developers");
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
                                    <%    }
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
