<%-- 
    Document   : viewUnassignedCards
    Created on : Oct 5, 2015, 2:15:52 AM
    Author     : Kaiwen
--%>

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
    </head>
    <body>
        <%
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
                                        <div class="col-lg-10">
                                            <input type="date" name="sDate" required/>
                                        </div>
                                        
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">End Date</label>
                                        <div class="col-lg-10">
                                            <input type="date" name="eDate" required/><p></p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Priority</label>
                                        <div class="col-lg-10">
                                            <select name='priority' class="form-control m-bot15">
                        <option value='1'>1 - Low</option>
                        <option value='2'>2 - Medium</option>
                        <option value='3'>3 - High</option>
                    </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Project Type</label>
                                        <div class="col-lg-10">
                                            <select name='type' class="form-control m-bot15">
                        <option value='Wordpress'>Wordpress</option>
                        <option value='eCommerce'>eCommerce</option>
                        <option value='Custom'>Custom</option>
                    </select>
                                        </div>
                                    </div>
                                    <input type="hidden" name="card" value='<%=id%>'/>
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