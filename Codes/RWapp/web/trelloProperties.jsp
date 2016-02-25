<%-- 
    Document   : trelloProperties
    Created on : Feb 26, 2016, 5:59:38 AM
    Author     : Kaiwen
--%>

<%@page import="src.model.TrelloProperties"%>
<%@page import="src.model.TrelloPropertiesDAO"%>
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
                <div class="row">
                    <div class="col-sm-12">
                        <section class="panel">
                            <div class="panel-body">
                                <%
                                TrelloProperties tb = TrelloPropertiesDAO.retrieveProperty();
                                %>
                                <h3 class="prf-border-head">Current Trello Details</h3>
                                Trello board: <%=tb.getMainboard()%><br/>
                                Trello admin username: <%=tb.getAdmin()%><br/>
                                Trello development list name: <%=tb.getDevelopmentList()%><br/>
                                Trello post development list name: <%=tb.getPostdevlist()%><br/>
                                <p></p>
                                <hr/>
                                <h3 class="prf-border-head">Edit Trello Details</h3>
                                <form action="modifyTrelloProperties" method="POST" class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Board name</label>
                                    <div class="col-lg-10">
                                        <input class="form-control m-bot12" type="text" name="mainboard" required/>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Admin username</label>
                                    <div class="col-lg-10">
                                        <input class="form-control m-bot12" type="text" name="admin" required/>
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Development list</label>
                                    <div class="col-lg-10">
                                        <input class="form-control m-bot12" type="text" name="developmentlist" required/>
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Post development list</label>
                                    <div class="col-lg-10">
                                        <input class="form-control m-bot12" type="text" name="postdevlist" required/>
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
