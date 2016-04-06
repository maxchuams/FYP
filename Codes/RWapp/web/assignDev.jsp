<%-- 
    Document   : assignDev
    Created on : Oct 31, 2015, 3:43:09 AM
    Author     : maxchua
--%>

<%@page import="src.model.TrelloCard"%>
<%@page import="src.model.Recommendation"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="protect.jsp" %>
<%String thisPage = "viewUnassignedCards"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recco</title>
        <!--        <script type="text/javascript">
                    jQuery(function () {
                        jQuery(".panel-body").click(function () {
                            $('input[type=radio]', this).prop("checked", true);
                            if ($('input[type=radio]', this).prop("checked") === true)) {panel-body.css({background: 'red'})}
                        });
                    });
                </script>-->
        <script type="text/javascript">
            $(document).ready(function () {
                $('.kaiwen').on('click', function () {
                    var radios = $('[type=radio]');
                    radios.prop('checked', false);
                    $(this).find('[type=radio]').prop('checked', true);
                    $.each(radios, function (index, radio) {
                        var area = $(radio).closest('.kaiwen');
                        if ($(radio).prop('checked'))
                            area.css({'border-color': $(radio).val()})
                        else
                            area.css({'border-color': 'transparent'})
                    })
                });
            })
        </script>
    </head>
    <body>
        <%
            ArrayList<ArrayList<Recommendation>> rlist = (ArrayList<ArrayList<Recommendation>>) request.getAttribute("rList");
            session.setAttribute("rList", rlist);

            TrelloCard toAssign = (TrelloCard) request.getAttribute("project");
            Integer days = (Integer) request.getAttribute("days");
            String name = request.getParameter("name");
        %>
        <section id="main-content">
            <section class="wrapper">
                <div class="col-md-12">
                    <div class="row">
                        <section class="panel">
                            <div class="panel-body">
                                <h3 class="prf-border-head">Please choose your preferred developer(s): </h3> 
                            </div>
                        </section>
                    </div>
                </div>
                <!--kw code-->

                <form id="myform" action="processRecommendation" method="GET" class="form-horizontal" role="form">

                    <%
                        int count = 1;

                        for (ArrayList<Recommendation> recommendations : rlist) {
                            String devDetails = "";
                            for (int i = 0; i < recommendations.size(); i++) {
                                Recommendation rConcat = recommendations.get(i);
                                if (i > 0) {
                                    devDetails += ",";
                                }
                                devDetails += rConcat.getUsername() + "," + rConcat.getEarlieststart() + "," + rConcat.getEstimatecompletion();
                            }
                    %>
                    <% if (recommendations.size() == 3) { %>
                    <div class="col-md-12">
                        <div class="row">
                            <% } %>
                            <% if (recommendations.size() == 2) { %>
                            <div class="col-md-12">
                                <div class="row">
                                    <% } %>
                                    <% if (recommendations.size() == 1) { %>
                                    <div class="col-md-4">
                                        <div class="row">
                                            <% }%>
                                            <section class="panel">
                                                <header class="panel-heading">
                                                    Choice <%=count%>
                                                </header>
                                                <div class="panel-body kaiwen">
                                                    <center>
                                                            <input type="radio" id="radiobutton" class="radiobutton" name="radio-color" value='#1fb5ad' style="display:none"/>
                                                            <input type="radio" name="dev" style="display:none" value='<%=count%>,<%=devDetails%>'/>
                                                        <% for (Recommendation r : recommendations) {%>

                                                        <!--kaiwen code-->
                                                        <% if (recommendations.size() == 3) { %>
                                                        <div class="col-lg-4 col-sm-4">
                                                            <% } %>
                                                            <% if (recommendations.size() == 2) { %>
                                                            <div class="col-lg-6 col-sm-6">
                                                                <% } %>
                                                                <% if (recommendations.size() == 1) { %>
                                                                <div class="col-lg-12 col-sm-12">
                                                                    <% }%>
                                                                    <div class="pricing-table most-popular">
                                                                        <div class="pricing-head">
                                                                            <h1> <%=r.getUsername()%> </h1>
                                                                        </div>
                                                                        <div class="panel-body profile-information">
                                                                            <div class="profile-pic text-center">
                                                                                <img style="" src="ImageServlet?imageid=<%=r.getUsername()%>" alt=""/>
                                                                            </div>
                                                                        </div>
                                                                        <div align="center" class="col-md-12 col-sm-12 inv-label">Dev overall score: <%=r.getZainessscore()%></div><br/>
                                                                        <ul class="list-unstyled">
                                                                            <li><i class="fa fa-briefcase"></i> <%=r.getCurrentprojectcount()%> current projects</li>
                                                                            <li><i class="fa fa-clock-o"></i> Earliest start date <%=r.getEarlieststart()%></li>
                                                                            <li><i class="fa fa-calendar"></i> <%=r.getEstimateworkingday()%> days to complete project</li>
                                                                            <li><i class="fa fa-calendar"></i> Est Completion <%= r.getEstimatecompletion()%></li>
                                                                            <li><i class="fa fa-bug"></i> Avg <%=r.getAvgdefectperproject()%> defects per project</li>
                                                                            <li><i class="fa fa-hand-o-right"></i> Completed <%=r.getProjectexperiencecount()%> similar projs</li>

                                                                        </ul>
                                                                    </div>
                                                                </div>

                                                                <!--kaiwen code end-->

                                                                <%

                                                                    }
                                                                %>
                                                            </div>
                                                            </section>
                                                        </div> 
                                                </div>
                                                <%
                                                        count++;
                                                    }

                                                %>

                                                <input type='hidden' name='projName' value='<%=toAssign.getName()%>'/>

                                                <input type='hidden' name='type' value='<%=toAssign.getType()%>'/>
                                                <input type='hidden' name='priority' value='<%=toAssign.getPriority()%>'/>
                                                <input type='hidden' name='due' value='<%=toAssign.getDue()%>'/>
                                                <input type='hidden' name='desc' value='<%=toAssign.getDesc()%>'/>
                                                <input type='hidden' name='id' value='<%=toAssign.getId()%>'/>
                                                <input type="hidden" name="pmname" value='<%=pm.getUsername()%>'/>
                                                <input type="hidden" name="psize" value='<%=days%>'/>

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <section class="panel">
                                                            <div class="panel-body">
                                                                <button type="submit" class="btn btn-info btn-block">Select developer(s) for project</button>
                                                             </form>  
                                                <center>
                                                    <br/>OR<br/><br/></center>
                                                <form action="assignDevCustom.jsp">
                                                                
                                                                <input type='hidden' name='projName' value='<%=toAssign.getName()%>'/>
                                                <input type='hidden' name='type' value='<%=toAssign.getType()%>'/>
                                                <input type='hidden' name='priority' value='<%=toAssign.getPriority()%>'/>
                                                <input type='hidden' name='due' value='<%=toAssign.getDue()%>'/>
                                                <input type='hidden' name='desc' value='<%=toAssign.getDesc()%>'/>
                                                <input type='hidden' name='id' value='<%=toAssign.getId()%>'/>
                                                <input type="hidden" name="pmname" value='<%=pm.getUsername()%>'/>
                                                <input type="hidden" name="psize" value='<%=days%>'/>
                                                <button class="btn btn-danger btn-block">Pick other developers not shown here</button>
                                                </form>
                                                            </div>
                                                        </section>
                                                    </div>
                                                </div>

                                                

<!--                                                <form action="assignDevCustom.jsp">
                                                Cant find the developer you want? Click here to key in manually!
                                                 <input type='hidden' name='projName' value='<%=toAssign.getName()%>'/>
                                                <input type='hidden' name='type' value='<%=toAssign.getType()%>'/>
                                                <input type='hidden' name='priority' value='<%=toAssign.getPriority()%>'/>
                                                <input type='hidden' name='due' value='<%=toAssign.getDue()%>'/>
                                                <input type='hidden' name='desc' value='<%=toAssign.getDesc()%>'/>
                                                <input type='hidden' name='id' value='<%=toAssign.getId()%>'/>
                                                <input type="hidden" name="pmname" value='<%=pm.getUsername()%>'/>
                                                <input type="hidden" name="psize" value='<%=days%>'/>
                                                <input type="submit" value="submit"/>
                                                    
                                                </form>-->
                                                
                                                <!--kw code-->

                                            </section>
                                            </section>
                                            <script type="text/javascript">
                                                $('.radiobutton').click(function () {
                                                    $(this).parents('.panel-body').css({background: 'red'});

                                                });
                                            </script>
                                            </body>
                                            </html>
