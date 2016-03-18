<%-- 
    Document   : viewUnassignedCards
    Created on : Oct 5, 2015, 2:15:52 AM
    Author     : Kaiwen
--%>

<%@page import="src.model.DeveloperDAO"%>
<%@page import="src.model.Developer"%>
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
            String devCountStr = request.getParameter("devCount");
            String kStr = request.getParameter("k");
            String factor = request.getParameter("factor");
            //String experienceFactorStr = request.getParameter("experienceFactor");
            //String defectFactorStr = request.getParameter("defectFactor");
            //String scheduleFactorStr = request.getParameter("scheduleFactor");
            String otherType = request.getParameter("otherType");

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


                <!--End of error/success display--> 

                <!--kw code-->
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="panel-body">
                                Assign Developer to Project <%=name%><br/><br/>

                                <form action="assignRecommendation" method="GET" class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">Start Date</label>
                                        <div class="col-lg-10">
                                            <%if (sDate != null) {%>
                                            <input type="date" class="form-control m-bot12" name="sDate"  min="2000-01-01" max="2100-12-31" value="<%=sDate%>" required/>
                                            <%} else {%>
                                            <input type="date" class="form-control m-bot12" name="sDate"  min="2000-01-01" max="2100-12-31" required/>
                                            <%}%>
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Project days</label>
                                        <div class="col-lg-10">
                                            <%if (daysstr != null) {%>
                                            <input class="form-control m-bot12" type="number" name="days" min=1 value='<%=daysstr%>' required/>
                                            <%} else {%>
                                            <input class="form-control m-bot12" type="number" name="days" min=1 required/>
                                            <%}%>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Priority</label>
                                        <div class="col-lg-10">

                                            <select name='priority' class="form-control m-bot12">



                                                <option <%
                                                    if (intensity == null || "0".equals(intensity)) {
                                                        out.println("selected='selected'");
                                                    } %> value='0'>Standard Project</option>

                                                <option  <% if (intensity != null && "1".equals(intensity)) {
                                                        out.println("selected='selected'");
                                                    } %> value='1'>High Priority Project</option>

                                            </select>

                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Developer Count</label>
                                        <div class="col-lg-10">
                                            <select name='devCount' class="form-control m-bot12">

                                                <%
                                                    int totalDevSize = DeveloperDAO.retrieveDevelopers().size();
                                                    for (int i = 1; i <= totalDevSize; i++) {%>




                                                <option <%
                                                    if (devCountStr != null && (i + "").equals(devCountStr)) {
                                                        out.println("selected='selected'");
                                                    }
                                                    %> value='<%=i%>'><%=i%></option>
                                                <% } %>
                                            </select>

                                        </div>
                                    </div>


                                    <%
                                        ArrayList<String> pTypeList = ProjectDAO.retrieveAllSkillTypes();
                                    %>
                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Project Type</label>
                                        <div class="col-lg-10">
                                            <select name='type' class="form-control m-bot15" id="role">
                                                <%
                                                    for (String s : pTypeList) {
                                                        if (!"to be updated".equals(s)) {
                                                %>
                                                <option <%
                                                    if (type != null && s.equals(type)) {
                                                        out.println("selected='selected'");
                                                    }
                                                    %> value='<%=s%>'><%=s%></option>
                                                <%
                                                        }
                                                    }
                                                %>

                                                <option value="Others">Others</option>
                                            </select>
                                        </div>
                                        <p></p><p></p>
                                        <div id='devOnly'>
                                            <label for="inputType" class="col-lg-2 control-label">Add New Project Type </label>
                                            <div class="col-lg-10">
                                                <input type='text' name='otherType' class="form-control"/><p></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label"> Method </label>
                                        <div class="col-lg-10">
                                            <div class="btn-group" data-toggle="buttons">
                                                <label  class="btn btn-primary <%if (factor == null || factor.equals("bal")) {
                                                                   out.println("active");}
                                                           %>" >
                                                    <input type="radio" name="factor" value="bal" 
                                                           > Balanced</label>
                                                <label class="btn btn-primary <%if (factor != null && factor.equals("exp")) {
                                                                   out.println("active");}
                                                           %>">
                                                    <input type="radio" name="factor" value="exp" 
                                                           > Most Experienced</label>
                                                
                                                <label class="btn btn-primary <%if (factor != null && factor.equals("def")) {
                                                                   out.println("active");}
                                                           %>">
                                                    <input type="radio" name="factor" value="def"
                                                           
                                                           > Least Defects</label>
                                                
                                                <label class="btn btn-primary <%if (factor != null && factor.equals("sch")) {
                                                                   out.println("active");}
                                                           %>">
                                                    <input type="radio" name="factor" value="sch" 
                                                           
                                                           > Punctuality</label>
                                            </div>
                                        </div>
                                    </div>

                                    <input type="hidden" name="name" value='<%=name%>'/>
                                    <input type="hidden" name="card" value='<%=id%>'/>
                                    <!--
                                    <input type="hidden" name="experienceFactor" value='0.33'/>
                                    <input type="hidden" name="defectFactor" value='0.33'/>
                                    <input type="hidden" name="scheduleFactor" value='0.33'/>
                                    -->
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
