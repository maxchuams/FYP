<%-- 
    Document   : assignDevCustom
    Created on : Mar 19, 2016, 11:16:53 PM
    Author     : maxchua
--%>

<%@page import="java.util.Date"%>
<%@page import="src.model.Recommendation"%>
<%@page import="src.model.RecommedationDAO"%>
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
        <script src="res/select2/js/select2.js"></script>
        <link rel="stylesheet" type="text/css" href="res/select2/css/select2.css">
        <script>
            moment().format();
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#e1").select2();
            });
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



                                <form action ="processRecommendation" method="GET" class="form-horizontal">

                                    <%
                                        // ArrayList<String> devForProj = ProjectAllocationDAO.retrieveDev(projName);
                                        //ArrayList<Person> devList = PersonDAO.retrievAllDev();
                                        ArrayList<Recommendation> recommendations = RecommedationDAO.getEstimateCompleteRecommendation(type, Integer.parseInt(psize));
                                    %>

                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Select Developer(s)</label>

                                        <div class="col-lg-10">
                                            <select multiple="multiple" name="devM" id="e1" style="width:300px" class="populate select2-offscreen" tabindex="-1">
                                                <optgroup label="Developer Name, Earliest Completion"> 
                                                <%
                                                    for (Recommendation r : recommendations) {
                                                        String rName = r.getUsername();
                                                        Date rStart = r.getEarlieststart();
                                                        Date rCompletion = r.getEstimatecompletion();
                                                %>
                                                <option value="<%=rName%>,<%=rStart%>,<%=rCompletion%>"><%=r.getUsername()%> , <% if(rCompletion!=null){out.println(rCompletion);}else{out.println("Not Skilled");}; %></option>
                                                <%
                                                    }
                                                %>
                                                </optgroup>
                                            </select>
                                        </div>
                                    </div>


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