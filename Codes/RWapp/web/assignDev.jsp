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
<%String thisPage = "assignDev"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recco</title>
    </head>
    <body>
        <section id="main-content">
            <section class="wrapper">


                <!--kw code-->
<!--                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="panel-body">-->
                                <%
                                    ArrayList<ArrayList<Recommendation>> rlist = (ArrayList<ArrayList<Recommendation>>) request.getAttribute("rList");
                                    session.setAttribute("rList",rlist);
                                    
                                    TrelloCard toAssign = (TrelloCard) request.getAttribute("project");
                                    Integer days = (Integer) request.getAttribute("days");
                                %>
                                <% String name = request.getParameter("name");%>
                                Please choose Developer for <%=toAssign.getType()%> Project <%=name%>, due <%=toAssign.getDue()%> with priority <%=toAssign.getPriority()%><br/>
                                <br/><br/>
                                <!--                                <form action="ManageProfile" method="POST">
                                                                    Password: <input type="password" name="password1" /> </br>
                                                                    Confirm password again: <input type="password" name="password2" /> </br>
                                
                                                                    <button type="submit">submit!</button>
                                                                </form>-->
                                
                                <form id="myform" action="processRecommendation" method="GET" class="form-horizontal" role="form">

                                    <%
                                        //System.out.println(rlist.size());
                                        int count = 1;

                                        for (ArrayList<Recommendation> recommendations : rlist) {
                                            String devDetails = "";
                                            for (int i=0;i<recommendations.size();i++) {
                                                Recommendation rConcat = recommendations.get(i);
                                                if(i>0) devDetails += ","; 
                                                devDetails += rConcat.getUsername()+","+rConcat.getEarlieststart()+","+rConcat.getEstimatecompletion();
                                            }
                                           


                                    %>
                                    <div class="row">
                            <div class="col-sm-12">
                                    <section class="panel">
                                        <div class="panel-body" id="<%=count%>">
                                    <input id="ddl" type="radio" name="dev" value='<%=count%>,<%=devDetails%>'/> 
                                   <b> Choice Ranking: <%=count%>.</b>
                                   <br><br>
                                    <% for (Recommendation r : recommendations) { %>
                                    
                                    

                                        
                                        <b> <%=r.getUsername()%></b></br>
                                        <img style="height:75px;width:75px" src="ImageServlet?imageid=<%=r.getUsername()%>" alt="No Image" align="center"/>
                                        </br>
                                        <!--nationality: 
                                        <%--<%=r.getNationality()%>--%>
                                        ,-->

                                        No of current project: <%=r.getCurrentprojectcount()%></br>
                                        Next project earliest start date: <%=r.getEarlieststart()%></br>
                                        Estimated working days to complete project: <%=r.getEstimateworkingday()%></br>
                                        <!--Estimated days(incl weekends) to complete project:--> 
                                        <%--<%= //r.getEstimateday()%>--%>
                                        <!--,-->
                                        <!--                                    Schedule performance: 
                                        <%--<%=r.getScheduleperformance()%>--%>
                                        ,-->
                                        Estimated completion date : <%=r.getEstimatecompletion()%> </br>
                                        <!--Ideal completion date:--> 
                                        <%--<%= //r.getIdealcompletion()%>--%>
                                        <!--,-->
                                        <!--                                    Defectless Score: 
                                        <%--<%=r.getDefectlessfactor()%>--%>
                                        ,
                                        Schedule score: 
                                        <%--<%=r.getSchedulefactor()%>--%>
                                        ,-->
                                        Average defects per project: <%=r.getAvgdefectperproject()%> </br>
                                        <!--Experience Score: 
                                        <%--<%=r.getExperiencefactor()%>--%>
                                        ,-->
                                        Number of similar project completed: <%=r.getProjectexperiencecount()%> </br>
                                        Overall Score: <%=r.getZainessscore()%> </br>
                                        <!--Sorting Order:--> 
                                        <%--<%=r.getSorting()%>--%>
                                        
                                           
                                        
                                    
                                    </div>
                            </section>
                            </div>
                                    </div>
                                    <%
                                                
                                            }
                                            count++;
                                        }

                                    %>

                                    <!--<div class="form-group">
                                        <div class="col-lg-offset-0 col-lg-12"><p></p>
                                                                                <button type="submit" class="btn btn-danger">Submit</button>
                                                                            </div>
                                                                        </div>-->


                                    <input type='hidden' name='projName' value='<%=toAssign.getName()%>'/>

                                    <input type='hidden' name='type' value='<%=toAssign.getType()%>'/>
                                    <input type='hidden' name='priority' value='<%=toAssign.getPriority()%>'/>
                                    <input type='hidden' name='due' value='<%=toAssign.getDue()%>'/>
                                    <input type='hidden' name='desc' value='<%=toAssign.getDesc()%>'/>
                                    <input type='hidden' name='id' value='<%=toAssign.getId()%>'/>
                                    <input type="hidden" name="pmname" value='<%=pm.getUsername()%>'/>
                                    <input type="hidden" name="psize" value='<%=days%>'/>
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </form>

                            </div>
                        </section>
                    </div> 
                </div>

                <script>
                    var fchar = "";
                    $( "#myform" ).change(function() {
			alert($('input[name="dev"]:checked', '#myform').val());
                        var first = $('input[name="dev"]:checked', '#myform').val();
                        fchar = first.charAt(0);
                        alert(fchar);
			
                    $("#"+fchar).addClass('active');
                    });
                </script>
                <style>
                    
                    .active{border:1px solid red;}
                    
                </style>
                <!--kw code-->

            </section>
        </section>
    </body>
</html>
