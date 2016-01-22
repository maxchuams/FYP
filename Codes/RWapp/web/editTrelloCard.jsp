<%-- 
    Document   : viewUnassignedCards
    Created on : Oct 5, 2015, 2:15:52 AM
    Author     : Kaiwen
--%>

<%@page import="src.model.ProjectDAO"%>
<%@page import="src.model.TrelloCard"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.model.TrelloBoard"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="protect.jsp"%>
<%String thisPage = "viewUnassignedCards"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trello</title>
         <script type="text/javascript">
            $(document).ready(function () {
                $('#devOnly').hide(); //hide field on start

                $('#role').change(function () {

                    var $index = $('#role').index(this);
                    if ($('#role').val() != 'Others') { //if this value is NOT selected
                        $('#devOnly').hide(); //this field is hidden
                    }
                    else {
                        $('#devOnly').show();//else it is shown

                    }
                });
            });
        </script>
    </head>
    <body>
        <%
        
        
        
            //for form filling
            String projName = request.getParameter("card"); 
            String intensity = request.getParameter("priority");
            String type = request.getParameter("type");
            String sDate = request.getParameter("sDate");
            String daysstr = request.getParameter("days");
            String devCountStr= request.getParameter("devCount");
            String kStr = request.getParameter("k");
            String experienceFactorStr= request.getParameter("experienceFactor");
            String defectFactorStr= request.getParameter("defectFactor");
            String scheduleFactorStr= request.getParameter("scheduleFactor");
        

            String name = request.getParameter("name");
            String id = request.getParameter("id");
            
            ArrayList<TrelloCard> tb = (ArrayList<TrelloCard>) session.getAttribute("tc");

            String errorMsg = (String) request.getAttribute("err");
            String sucess = (String) request.getAttribute("sucess");
            if (errorMsg == null) {
                errorMsg = "";
            }

            if (sucess == null) {
                sucess = "";
            }
            if (tb != null) {


        %>
        <section id="main-content">
            <section class="wrapper">

                <!--Error/success display-->
                <%   errorMsg = (String) request.getAttribute("err");
                    sucess = (String) request.getAttribute("sucess");

                    if (errorMsg != null) {
                %>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="panel-body">
                                <div class="text-danger"><%=errorMsg%></div>
                            </div>
                        </section>
                    </div>
                </div>
                <%
                    }
                    if (sucess != null) {%>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="panel-body">
                                <div class="text-success"><%=sucess%></div>
                            </div>
                        </section>
                    </div>
                </div>
                <%
                    }
                %>


                <!--End of error/success display--> 

                <!--kw code-->
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="panel-body">
                                Assign Developer to <%=name%><br/><br/>
                                <!--                                <form action="ManageProfile" method="POST">
                                                                    Password: <input type="password" name="password1" /> </br>
                                                                    Confirm password again: <input type="password" name="password2" /> </br>
                                
                                                                    <button type="submit">submit!</button>
                                                                </form>-->

                                <form action="assignRecommendation" method="POST" class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">Start Date</label>
                                        <div class="col-lg-6">
                                            <input type="date" class="form-control m-bot15" name="sDate" required/>
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Number of Days(Project Size)</label>
                                        <div class="col-lg-6">
                                            <input class="form-control m-bot15" type="number" name="days" min=1 required/><p></p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Priority</label>
                                        <div class="col-lg-6">
                                            <select name='priority' class="form-control m-bot12">
                                                <option value='0'>Standard Project</option>
                                                <option value='1'>High Priority Project</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Developer Count</label>
                                        <div class="col-lg-6">
                                            <select name='devCount' class="form-control m-bot12">
                                                <option value='1'>1</option>
                                                <option value='2'>2</option>
                                                <option value='3'>3</option>
                                                <option value='4'>4</option>
                                                <option value='5'>5</option>
                                                <option value='6'>6</option>
                                                <option value='7'>7</option>
                                                <option value='8'>8</option>
                                                <option value='9'>9</option>
                                                <option value='10'>10</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    
                                    
                                    
                                    <%
                                    ArrayList<String> pTypeList = ProjectDAO.retrieveAllTypes();
                                    %>
                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Project Type</label>
                                        <div class="col-lg-6">
                                            <select name='type' class="form-control m-bot15" id="role">
                                                <%
                                                for (String s : pTypeList){
                                                    %>
                                                    <option value='<%=s%>'><%=s%></option>
                                                    <%
                                                }
                                                %>
                                               
                                                <option value="Others">Others</option>
                                            </select>
                                        </div>
                                        <div id='devOnly'>
                                            <label for="inputType" class="col-lg-2 control-label">Project Type </label>
                                             <div class="col-lg-9">
                                                <input type='text' name='otherType' class="form-control"/><p></p>
                                             </div>
                                        </div>
                                    </div>
                                    <input type="hidden" name="name" value='<%=name%>'/>
                                    <input type="hidden" name="card" value='<%=id%>'/>
                                    <input type="hidden" name="experienceFactor" value='0.33'/>
                                    <input type="hidden" name="defectFactor" value='0.33'/>
                                    <input type="hidden" name="scheduleFactor" value='0.33'/>
                                    <input type="hidden" name="k" value='3'/>
                                    <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-10">
                                            <button type="submit" class="btn btn-danger">Recommend</button>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </section>
                    </div> 
                </div>


                <!--kw code-->


                <%}%>
            </section>
        </section>

    </body>
</html>
