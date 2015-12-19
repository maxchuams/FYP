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
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="panel-body">
                                <%
                                    ArrayList<Recommendation> rlist = (ArrayList<Recommendation>) request.getAttribute("rList");
                                    TrelloCard toAssign = (TrelloCard) request.getAttribute("project");
                                %>
                                <% String name = request.getParameter("name");%>
                                Please choose Developer for <%=toAssign.getType()%> Project <%=name%>, due <%=toAssign.getDue()%> with priority <%=toAssign.getPriority()%><br/>
                                <br/><br/>
                                <!--                                <form action="ManageProfile" method="POST">
                                                                    Password: <input type="password" name="password1" /> </br>
                                                                    Confirm password again: <input type="password" name="password2" /> </br>
                                
                                                                    <button type="submit">submit!</button>
                                                                </form>-->

                                <form action="processRecommendation" method="GET" class="form-horizontal" role="form">

                                    <%
                                        //System.out.println(rlist.size());
                                        int count = 1;
                                        for (Recommendation r : rlist) {


                                    %>
                                    <input type="checkbox" name="dev" value='<%=r.getUsername()%>'/> 
                                    <%=count%>. <%=r.getUsername()%>, 
                                    nationality: <%=r.getNationality()%>,
                                    No of current project: <%=r.getCurrentprojectcount()%>,
                                    Next project earliest start date: <%=r.getEarlieststart()%>,
                                    Estimated working days to complete project: <%=r.getEstimateworkingday() %>,
                                    Estimated days(incl weekends) to complete project: <%=r.getEstimateday()%>,
                                    Schedule performance: <%=r.getScheduleperformance()%>,
                                    Estimated completion date : <%=r.getEstimatecompletion() %>,
                                    Ideal completion date: <%=r.getIdealcompletion()%>,
                                    Defectless Score: <%=r.getDefectlessfactor()%>,
                                    Schedule score: <%=r.getSchedulefactor()%>,
                                    Average defects per project: <%=r.getAvgdefectperproject()%>,
                                    Experience Score: <%=r.getExperiencefactor()%>,
                                    Number of similar project completed: <%=r.getProjectexperiencecount()%>,
                                    Zainess Score: <%=r.getZainessscore()%>,
                                    Sorting Order: <%=r.getSorting()%>

                                    </br>

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

                                    <!--<div class="form-group">
                                        <div class="col-lg-offset-0 col-lg-12"><p></p>
                                                                                <button type="submit" class="btn btn-danger">Submit</button>
                                                                            </div>
                                                                        </div>-->
                                </form>



                                <input type="hidden" name="card" value=''/>

                                </form>

                            </div>
                        </section>
                    </div> 
                </div>


                <!--kw code-->

            </section>
        </section>
    </body>
</html>
