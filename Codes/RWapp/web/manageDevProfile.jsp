<%-- 
    Document   : manageDevProfile
    Created on : Sep 14, 2015, 12:29:13 PM
    Author     : admin
--%>
<%@page import="src.model.Skill"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="src.model.SkillDAO"%>
<%@include file="protectDev.jsp" %>
<%String thisPage = "manageDevProfile"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Profile</title>
    </head>
    <body>
        <section id="main-content">
        <section class="wrapper">
        <!--Error/success display-->
                <%  String errorMsg = (String) request.getAttribute("err");
                    String sucess = (String) request.getAttribute("sucess");

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

                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="panel-body">
                                Change Developer Password:<br/><br/>
                                <!--                                <form action="ManageProfile" method="POST">
                                                                    Password: <input type="password" name="password1" /> </br>
                                                                    Confirm password again: <input type="password" name="password2" /> </br>
                                
                                                                    <button type="submit">submit!</button>
                                                                </form>-->

                                <form action="ManageProfile" method="POST" class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">Password</label>
                                        <div class="col-lg-10">
                                            <input type="password" name="password1" class="form-control" id="inputEmail1" placeholder="Password">
                                            <p></p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Confirm Password</label>
                                        <div class="col-lg-10">
                                            <input type="password" name="password2" class="form-control" id="inputPassword1" placeholder="Confirm Password">
                                        </div>
                                    </div>
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
