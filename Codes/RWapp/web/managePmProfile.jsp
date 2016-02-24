<%-- 
    Document   : managePmProfile
    Created on : Sep 14, 2015, 12:28:56 PM
    Author     : admin
--%>
<%@include file="protectPM.jsp" %>
<%String thisPage = "managePmProfile"; //This is to change the highlight in Navigation Bar%>
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
                <!--End of error/success display--> 

                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="panel-body">
                                Change <%=pm.getUsername()%>'s password:<br/><br/>

                                <form action="ManageProfile" method="POST" class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">Password</label>
                                        <div class="input-group col-lg-8">
                                            <span class="input-group-addon btn-white"><i class="fa fa-key"></i></span>
                                            <input type="password" name="password1" class="form-control" id="inputEmail1" placeholder="Password">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Confirm Password</label>
                                        <div class=" input-group col-lg-8">
                                            <span class="input-group-addon btn-white"><i class="fa fa-key"></i></span>
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
