<%-- 
    Document   : viewTrelloCards
    Created on : Oct 5, 2015, 2:15:52 AM
    Author     : admin
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        <title>Recco</title>
        <script src="js/moment.js"></script>
        <script> moment().format();</script>
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
                <%if (errorList != null) {%>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="alert alert-success fade in">
                                <button data-dismiss="alert" class="close close-sm" type="button">
                                    <i class="fa fa-times"></i>
                                </button>
                                <%for (int i = 0; i < errorList.size(); i++) {
                                        out.println((i + 1) + ". " + errorList.get(i) + "<br/>");
                                    }%>
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
                                <label class='pull-left top-menu' style='color: #009E94'>Viewing my <%=tList.size()%> projects</br>
                                    <script>
                                        var m = moment("<%=CronDAO.retrieveTime()%>");
                                        document.write('Last Sync ' + m.fromNow());
                                    </script></label>
                                <!--                                    Last update time: <%=CronDAO.retrieveTime()%>-->
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
                                    if (t.getName().length() > 27) {
                                        pName = t.getName().substring(0, 27) + "...";
                                    } else {
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
                                                        <% if (ProjectDAO.retrieveTrelloPhoto(t.getName()) == null) {
                                                        %><img src="bootstrap/html/images/tempProj.png" alt=""/>
                                                        <%
                                                        } else {
                                                            String photo = ProjectDAO.retrieveTrelloPhoto(t.getName());
                                                            String photoExt = "";
                                                            if (photo.length() >= 3) {
                                                                photoExt = photo.substring(photo.length() - 3);
                                                            }
                                                            if (photoExt != null || photoExt.equals("jpg") || photoExt.equals("png")) {%>
                                                        <img src="<%=ProjectDAO.retrieveTrelloPhoto(t.getName())%>" alt=""/>
                                                        <%} else {  %>
                                                        <img src="bootstrap/html/images/tempProj.png" alt=""/>
                                                        <%}
                                                            }%>
                                                    </div>
                                                </div>
                                                <%
                                                    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                                    Date todayDate = new Date();
                                                    String projDateString = t.getDuedate();
                                                    Date projDate = dateFormat.parse(projDateString);
                                                %>
                                                <span class="pull-right">
                                                    <%if (todayDate.after(projDate)) {%>
                                                    <li><span class="badge label-danger pull-left r-activity"><i class="fa fa-exclamation-circle"></i>  <span class="time" data-datetime="<%=t.getDuedate()%>" data-format="Do MMM YYYY"></span></span></li><br/><br/>
                                                            <%} else {%>
                                                    <li><span class="badge label-warning pull-left r-activity"><i class="fa fa-bell-o"></i>  <span class="time" data-datetime="<%=t.getDuedate()%>" data-format="Do MMM YYYY"></span></span></li><br/><br/>
                                                            <%}%>
                                                    <li> <b>Type:</b> <%=t.getType()%> </li>
                                                        <% if (dev != null && pm == null) {%>
                                                    <li> <b>Assignee:</b> <%=t.getAssignedBy()%> <%}%></li>
                                                    <li> <b>Dev:</b>
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
                                                    <li> <b>Priority:</b> 
                                                        <%                                                            int pInt = t.getPriortiy();
                                                            if (pInt == 1) {
                                                                out.println("High");
                                                            } else {
                                                                out.println("Standard");
                                                            }
                                                        %> </li>
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
<script>
    $(document).ready(function () {
        $('.time').each(function () {
            var $this = $(this),
                    dt = moment($this.data('datetime')),
                    format = $this.data('format'),
                    formatted = dt.format(format);

            $this.html('<span class="time">' + formatted + '</span>');
        });
    });
</script>
