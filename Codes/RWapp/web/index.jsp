<%-- 
    Document   : index
    Created on : Sep 7, 2015, 1:30:53 PM
    Author     : admin
--%>
<%@include file="protect.jsp" %>
<%@include file="navbar.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<!--        <h1>Hello World!</h1>
        
        <h2>LOG IN SUCCESS YAY!</h2>
        <a href="Logout">Log Out</a>
        
        <ul>
            <li><a href="manageProfile.jsp">Manage your Profile</a></li>
            <li><a href="viewTrelloCards.jsp">View Trello Cards</a></li>
            <li><a href="addNewProject.jsp">Add New Project</a></li>
            
            if (pm!= null){
                
            <li><a href="assignProject">View Unassigned Cards</a></li>
            
            }
            
            
        </ul>-->
<section id="main-content">
        <section class="wrapper">
        <!-- page start-->
            <section class="panel">
                    <header class="panel-heading">
                        Calendar 
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                            <a href="javascript:;" class="fa fa-cog"></a>
                            <a href="javascript:;" class="fa fa-times"></a>
                         </span>
                    </header>
                    <div class="panel-body">
                        <!-- page start-->
                        <div class="row">
                            <aside class="col-lg-9">
                                  <div id="calendar" class="has-toolbar"></div>
                            </aside>
                            <aside class="col-lg-3">
                                <h4 class="drg-event-title">Projects</h4>
                                <div id='external-events'>
                                    <form>
                                        <input class="input form-control" id="event_title" placeholder="Event Title..." type="text" value="">
                                        <select class="select2able chosen_select" data-placeholder="Select Label..." id="event_priority">
                                            <option value="default">Default</option>
                                            <option value="success">Success</option>
                                            <option value="info">Info</option>
                                            <option value="warning">Warning</option>
                                            <option value="important">Important</option>
                                        </select>
                                        <div class="space12"></div>
                                        <a class="btn btn-default" href="javascript:;" id="event_add">Add event</a>
                                    </form>
                                    <div class='external-event label label-primary'>My Project 1</div>
                                    <div class='external-event label label-success'>My Project 2</div>
                                    <div class='external-event label label-info'>My Project 3</div>
                                    <div class='external-event label label-inverse'>My Project 4</div>
                                    <div class='external-event label label-warning'>My Project 5</div>
                                    <div class='external-event label label-danger'>My Project 6</div>
                                    <div class='external-event label label-default'>My Project 7</div>
                                    <div class='external-event label label-primary'>My Project 8</div>
                                    <div class='external-event label label-info'>My Project 9</div>
                                    <div class='external-event label label-success'>My Project 10</div>
                                    <p class="border-top drp-rmv">
                                        <input type='checkbox' id='drop-remove' />
                                        remove after drop
                                    </p>
                                </div>
                            </aside>
                        </div>
                        <!-- page end-->
                    </div>
                </section>
        <!-- page end-->
        </section>
    </section>
    <!--main content end-->
        
    <script src="bootstrap/html/js/fullcalendar/fullcalendar.min.js"></script>
    <script src="bootstrap/html/js/external-dragging-calendar.js"></script>
           
        
        
        
        
    </body>
</html>
