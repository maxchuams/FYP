<%-- 
    Document   : viewUnassignedCards
    Created on : Oct 5, 2015, 2:15:52 AM
    Author     : admin
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
        <% ArrayList<TrelloCard> tb = (ArrayList<TrelloCard>) session.getAttribute("tc");


        %>
        <section id="main-content">
            <section class="wrapper">

                <!--Error/success display-->
                <%  String errorMsg = (String) request.getAttribute("err");
                    String sucess = (String) request.getAttribute("sucess");
                    ArrayList<String> errList = (ArrayList<String>) request.getAttribute("errList");
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
                    if (errList != null) {
                %>
              
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="panel-body">
                                <div class="text-success"><%=errList%></div>
                            </div>
                        </section>
                    </div>
                </div>
                <%
                    }
                %>
                <!--End of error/success display--> 

                <div class="row">
                    <div class="col-sm-12">
                        <div class="row-fluid" id="draggable_portlets">
                            <div class="row">
                                <%
                                    if (tb != null) {
                                        for (TrelloCard t : tb) {%>
                                <!-- BEGIN Portlet PORTLET-->
                                <%
                                            String pName;
                                            if (t.getName().length() > 27) {
                                        pName = t.getName().substring(0, 27) + "...";
                                    } else {
                                        pName = t.getName();
                                    }
                                            
                                %>
                                <div class="col-md-4">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            <%=pName%>
                                            <span class="tools pull-right">
                                            </span>
                                        </div>
                                        <div class="panel-body">
                                            <ul class="nav nav-pills nav-stacked">
                                                <li> <span class="badge label-danger pull-left r-activity"><i class="fa fa-bell-o"></i>  <%=t.getDue()%></span></li>
                                                <span class="pull-right">
                                                    <li> <a href="editTrelloCard.jsp?name=<%=t.getName()%>&id=<%=t.getId()%>"><button type="button" class="btn btn-primary btn-xs">Assign Developer</button></a>
                                                    </li><br/>
                                                </span>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- END Portlet PORTLET-->
                                <% }
                                    }%>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </section>
    </body>
</html>
