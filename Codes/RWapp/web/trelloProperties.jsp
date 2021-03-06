<%-- 
    Document   : trelloProperties
    Created on : Feb 26, 2016, 5:59:38 AM
    Author     : Kaiwen
--%>

<%@page import="src.model.TrelloConfigDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.model.TrelloProperties"%>
<%@page import="src.model.TrelloBoard"%>
<%@include file="protectSudo.jsp" %>
<%String thisPage = "trelloProperties"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trello Properties</title>
    </head>
    <body>

        <section id="main-content">
            <section class="wrapper">
                <%
                    String sucess = (String) request.getAttribute("sucess");
                    String success = (String) request.getAttribute("success");
                    ArrayList<String> errorList = (ArrayList<String>) request.getAttribute("errList");

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
                <%if (success != null) {%>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="alert alert-success fade in">
                                <button data-dismiss="alert" class="close close-sm" type="button">
                                    <i class="fa fa-times"></i>
                                </button>
                                <%=success%>
                            </div>
                        </section>
                    </div>
                </div>
                <%}%>
                <%if (errorList != null) {%>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="alert alert-success fade in">
                                <button data-dismiss="alert" class="close close-sm" type="button">
                                    <i class="fa fa-times"></i>
                                </button>
                                <%for (int i = 0; i < errorList.size(); i++) {
                                        out.println((i + 1) + ". " + errorList.get(i) + "<br/>");
                                    }%>
                            </div>
                        </section>
                    </div>
                </div>
                <%}%>
                <div class="row">
                    <div class="col-sm-12">
                        <section class="panel">
                            <div class="panel-body">
                                <%
                                    TrelloProperties tb = TrelloConfigDAO.retrieveConfig();
                                %>
                                <h3 class="prf-border-head">Current Trello Details</h3>

                                <div class="alert alert-info clearfix ">
                                    <span class="alert-icon"><i class="fa fa-trello"></i></span>
                                    <div class="notification-info">
                                        <ul class="clearfix notification-meta">
                                            <li class="pull-left notification-sender">Current Trello Details:</li>
                                        </ul>
                                        <p style="color: black">
                                            <b>Trello board:</b> <%=tb.getMainboard()%><br/>
                                            <b>Trello admin username:</b> <%=tb.getAdmin()%><br/>
                                            <b>Trello development list name:</b> <%=tb.getDevelopmentList()%><br/>
                                            <b>Trello post development list name:</b> <%=tb.getPostdevlist()%><br/>
                                        </p>
                                    </div>
                                </div>

                                <hr/>
                                <h3 class="prf-border-head">Edit Trello Details</h3>
                                <form action="modifyTrelloProperties" method="POST" class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Board name</label>
                                        <div class="col-lg-10">
                                            <input class="form-control m-bot12" type="text" name="mainboard" value="<%=tb.getMainboard()%>" required/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Admin username</label>
                                        <div class="col-lg-10">
                                            <input class="form-control m-bot12" type="text" name="admin" value="<%=tb.getAdmin()%>" required/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Development list</label>
                                        <div class="col-lg-10">
                                            <input class="form-control m-bot12" type="text" name="developmentlist" value="<%=tb.getDevelopmentList()%>" required/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Post development list</label>
                                        <div class="col-lg-10">
                                            <input class="form-control m-bot12" type="text" name="postdevlist" value="<%=tb.getPostdevlist()%>"required/>
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
