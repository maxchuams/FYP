<%-- 
    Document   : assignDevCustom
    Created on : Mar 19, 2016, 11:16:53 PM
    Author     : maxchua
--%>

<%@page import="src.model.Person"%>
<%@page import="src.model.PersonDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.model.ProjectAllocationDAO"%>
<%@page import="src.model.Project"%>
<%@page import="src.model.ProjectDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="protect.jsp" %>
<%String thisPage = "viewUnassignedCards"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign Developer Manually</title>
        <script src="js/moment.js"></script>
        <script>
            moment().format();
        </script>
    </head>
    <body>
        <section id="main-content">
            <section class="wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <section class="panel">
                            <header class="panel-heading">
                                Current project details
                            </header>
                            <div class="panel-body">
                                <%
                                    String type = request.getParameter("type");
                                    String priority = request.getParameter("priority");
                                    String due = request.getParameter("due");
                                    String desc = request.getParameter("desc");
                                    String id = request.getParameter("id");
                                    String pmname = request.getParameter("pmname");
                                    String psize = request.getParameter("psize");
                                    String projName = request.getParameter("projName");
                                    Project p = ProjectDAO.retrieveProjectByProjectName(projName);
                                    if (p != null) {
                                        type = p.getType();
                                        priority = "" + p.getPriortiy();
                                        due = p.getDuedate();
                                        desc = p.getDesc();
                                        id = p.getTrelloKey();
                                        pmname = p.getAssignedBy();
                                        psize = "" + p.getPsize();

                                    }

                                %>
                                <h3 class="prf-border-head"><%=projName%></h3>

                                <div class="alert alert-info clearfix ">
                                    <span class="alert-icon"><i class="fa fa-trello"></i></span>
                                    <div class="notification-info">
                                        <p style="color: black">
                                            <b>Project Type:</b> <%=type%><br/>
                                            <b>Due Date:</b> <span class="time" data-datetime="<%=due%>" data-format="Do MMM YYYY"></span><br/>
                                            <b>Project Size:</b> <%=psize%><br/>
                                        </p>
                                    </div>
                                </div>



                                <form action ="processRecommendation" class="form-horizontal">

                                    <%
                                        ArrayList<String> devForProj = ProjectAllocationDAO.retrieveDev(projName);
                                        ArrayList<Person> devList = PersonDAO.retrievAllDev();
                                    %>
                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Select developer</label>
                                        <div class="col-lg-10">
                                            <select name="devM" class="form-control m-bot12">
                                                <%                    for (Person deve : devList) {
                                                        if (devForProj == null || devForProj.size() == 0) {
                                                %>
                                                <option value="<%=deve.getUsername()%>"/><%=deve.getUsername()%>
                                                <%

                                                } else {
                                                    if (!devForProj.contains(deve.getUsername())) {
                                                %>

                                                <option value="<%=deve.getUsername()%>"/><%=deve.getUsername()%>
                                                <%
                                                            }
                                                        }
                                                    }

                                                %>
                                            </select>
                                        </div>
                                    </div>
                                     
                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Start date</label>
                                        <div class="col-lg-10">
                                            <input class="form-control m-bot12" type="date" name="earliestStart" required/>
                                        </div>
                                    </div>
                                            
                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">End date</label>
                                        <div class="col-lg-10">
                                            <input class="form-control m-bot12" type="date" name="completion" required/>
                                        </div>
                                    </div>

                                    <%
                                    %>

                                    <input type='hidden' name='projName' value='<%=projName%>'/>
                                    <input type='hidden' name='type' value='<%=type%>'/>
                                    <input type='hidden' name='priority' value='<%=priority%>'/>
                                    <input type='hidden' name='due' value='<%=due%>'/>
                                    <input type='hidden' name='desc' value='<%=desc%>'/>
                                    <input type='hidden' name='id' value='<%=id%>'/>
                                    <input type="hidden" name="pmname" value='<%=pmname%>'/>
                                    <input type="hidden" name="psize" value='<%=psize%>'/>

                                    <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-10">
                                            <button type="submit" class="btn btn-danger">Submit</button>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </section>
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