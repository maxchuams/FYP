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

            String errorMsg = (String) request.getAttribute("err");
            String sucess = (String) request.getAttribute("sucess");
            if (errorMsg == null) {
                errorMsg = "";
            }

            if (sucess == null) {
                sucess = "";
            }


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
                <!--            <div class="row">
                            <div class="col-sm-12">
                                <section class="panel">
                                    <header class="panel-heading">
                                        View All Projects
                                        <span class="tools pull-right">
                                            <a href="assignProject" class="fa fa-refresh"></a>
                                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                                         </span>
                                    </header>
                                    <div class="panel-body">
                                        <table class="table  table-hover general-table">
                                            <thead>
                                            <tr>
                                                <th>Project Name</th>
                                                <th>Due Date</th>
                                                <th>Assign Developer</th>
                                                <th>Members</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            
                <% if (tb != null) {
                        for (TrelloCard t : tb) {
                %> 
                <tr>
                    <td><%=t.getName()%></td>
                    <td><%=t.getDue()%></td>
                    <td>
                <%//ArrayList<Person> memberList = t.getMembers(); 
                    //for(Person p : memberList){
                    //   p.getUsername();
                    //}%>
                </td>
                        <td><a href="editTrelloCard.jsp?name=<%=t.getName()%>&id=<%=t.getId()%>"><button type="button" class="btn btn-primary btn-xs">Assign</button></a></td>
                    
            </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
            
            <form action='assignProject' method='POST'id='main'>
        <div class="form-group">
            <div class="col-lg-offset-2 col-lg-10">
                <p></p>
                <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </div>
            </form>
    </div>
</section>
</div>
</div>-->
                <!--kw code-->

                <div class="row">
                    <div class="col-sm-12">
                        <div class="row-fluid" id="draggable_portlets">
                            <div class="row">
                                <%
                                    if (tb != null) {
                                        for (TrelloCard t : tb) {%>
                                <!-- BEGIN Portlet PORTLET-->
                                <div class="col-md-4">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            <%=t.getName()%>
                                            <span class="tools pull-right">
                                            </span>
                                        </div>
                                        <div class="panel-body">
                                            <ul class="nav nav-pills nav-stacked">
                                                <li> <span class="badge label-danger pull-left r-activity"><i class="fa fa-bell-o"></i>  <%=t.getDue()%></span></li>
                                                <span class="pull-right">
                                                    <li> <a href="editTrelloCard.jsp?name=<%=t.getName()%>&id=<%=t.getId()%>"><button type="button" class="btn btn-primary btn-xs">Assign Developer to Project</button></a>
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
