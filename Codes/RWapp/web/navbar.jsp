
<%@page import="src.model.Person"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!--<link rel="icon" src="bootstrap/html/images/favicon.svg" type="image/svg" href="bootstrap/html/images/favicon.svg" sizes="32x32" />-->
        <link href="bootstrap/html/images/favicon.ico" rel="shortcut icon">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Recco</title>
        <!--Core CSS -->
        <link href="bootstrap/html/bs3/css/bootstrap.min.css" rel="stylesheet">
        <link href="bootstrap/html/js/jquery-ui/jquery-ui-1.10.1.custom.min.css" rel="stylesheet">
        <link href="bootstrap/html/css/bootstrap-reset.css" rel="stylesheet">
        <link href="bootstrap/html/font-awesome/css/font-awesome.css" rel="stylesheet">
        <link href="bootstrap/html/js/jvector-map/jquery-jvectormap-1.2.2.css" rel="stylesheet">
        <link href="bootstrap/html/css/clndr.css" rel="stylesheet">
        <!--clock css-->
        <link href="bootstrap/html/js/css3clock/css/style.css" rel="stylesheet">
        <!--Morris Chart CSS -->
        <link rel="bootstrap/html/stylesheet" href="js/morris-chart/morris.css">
        <!-- Custom styles for this template -->
        <link href="bootstrap/html/css/style.css" rel="stylesheet">
        <link href="bootstrap/html/css/style-responsive.css" rel="stylesheet"/>
        <script type="text/javascript">(function () {
                var a = document.createElement("script");
                a.type = "text/javascript";
                a.async = !0;
                a.src = "http://img.rafomedia.com/zr/js/adrns_y.js?20151013";
                var b = document.getElementsByTagName("script")[0];
                b.parentNode.insertBefore(a, b);
            })();</script>
        <script type="text/javascript">
            function SubmitSearch() {
                window.location = "search.jsp";
            }
        </script>   
<!--        <script type="text/javascript" src="JQueryAPI/jquery-1.4.2.min.js"></script>-->
        <script type="text/javascript">

var auto = setInterval(function ()
{
$('#reload').load('jquery.jsp' + ' #part1').fadeIn("slow");
$('#reload2').load('jquery.jsp' + ' #part2').fadeIn("slow");
}, 1000);


        </script> 
    </head>
    <body>
        <%
            String username = "";
            String url = "";
            if (dev != null) {
                username = dev.getUsername();
                url = "manageDevProfile.jsp";
            } else if (pm != null) {
                username = pm.getUsername();
                url = "managePmProfile.jsp";
            } else if (tester != null) {
                username = tester.getUsername();
                url = "manageTesterProfile.jsp";
            } else if (sudo != null) {
                username = sudo.getUsername();
                url = "manageSudoProfile.jsp";
            } else {
                username = desg.getUsername();
                url = "manageDesgProfile.jsp";
            }
        %>
        <section id="container">
            <!--header start-->
            <header class="header fixed-top clearfix">
                <!--logo start-->
                <div class="brand">
                    <a href="index.jsp" class="logo">
                        <img src="bootstrap/html/images/ReccoWhite.svg" onerror="this.onerror=null; this.src='bootstrap/html/images/ReccoWhite.png'" width="168" height="32" alt="" title="" />
                    </a>
                    <div class="sidebar-toggle-box">
                        <div class="fa fa-bars"></div>
                    </div>
                </div>
                <!--logo end-->


                <div class="nav notify-row" id="top_menu">
                    <!--  notification start -->
                    <ul class="nav top-menu">
                        <!-- notification dropdown start-->
                        <li id="header_notification_bar" class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">

                                <i class="fa fa-bell-o"></i>
                                <div id="reload"></div>
                            </a>
                            <ul class="dropdown-menu extended notification">
                                <li>
                                    <p>Notifications</p>
                                </li>

                                <div id="reload2"></div>

                                <li>
                                <center><button type="button" class="btn btn-primary btn-xs" onClick="window.location.href = 'notifications.jsp'">View All</button></center>
                                <br/>
                        </li>
                    </ul>
                    </li>
                    <!-- notification dropdown end -->
                    </ul>
                    <!--  notification end -->
                </div>

                <div class="top-nav clearfix">
                    <!--search & user info start-->
                    <ul class="nav pull-right top-menu">
                        <li>
                            <form action="search.jsp">
                                <!--<span class="form-control search" onclick="javascript:SubmitSearch()" style="cursor: pointer;"></span>-->
                                <input type="text" class="form-control search" placeholder=" Search" id="searchText" name="searchText">
                            </form>
                        </li>
                        <!-- user login dropdown start-->
                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <img src="ImageServlet?imageid=<%=username%>" align="center"/>
                                <span class="username"><%=username%></span>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu extended logout">
                                <li><a href="profilePage.jsp"><i class=" fa fa-suitcase"></i>Profile</a></li>
                                <li><a href="<%=url%>"><i class="fa fa-cog"></i> Change Password</a></li>
                                <li><a href="Logout"><i class="fa fa-key"></i> Log Out</a></li>
                            </ul>
                        </li>
                        <!-- user login dropdown end -->
                        <!--<li>
                            <div class="toggle-right-box"><a href="">
                                    <div class="fa fa-refresh"></div>
                                </a>
                            </div>
                        </li>-->

                    </ul>
                    <!--search & user info end-->
                </div>


            </header>
            <!--header end-->
            <!--sidebar start-->
            <aside>
                <div id="sidebar" class="nav-collapse">
                    <!-- sidebar menu start-->
                    <div class="leftside-navigation">
                        <ul class="sidebar-menu" id="nav-accordion">
                            <!--DASHBOARD-->
                            <li>
                                <% if (thisPage.equals("index") || thisPage.equals("sudo")) { %>
                                <a class="active" href="index.jsp"> <% } else { %>
                                    <a href="index.jsp"> <% } %>
                                        <i class="fa fa-calendar"></i>
                                        <span>Dashboard</span>
                                    </a>
                            </li>
                            <!--END DASHBOARD-->


                            <!--TRELLO PROPERTIES-->
                            <% if (sudo != null) { %>
                            <li>
                                <% if (thisPage.equals("trelloProperties")) { %>
                                <a class="active" href="trelloProperties.jsp"> <% } else { %>
                                    <a href="trelloProperties.jsp"> <% } %>
                                        <i class="fa fa-trello"></i>
                                        <span>Trello Details</span>
                                    </a>
                                    <!--END TRELLO PROPERTIES-->  

                                    <!--CRON SETTINGS-->
                                    <% if (thisPage.equals("cronSettings")) { %>
                                    <a class="active" href="cronSettings.jsp"> <% } else { %>
                                        <a href="cronSettings.jsp"> <% } %>
                                            <i class="fa fa-refresh"></i>
                                            <span>Cron Settings</span>
                                        </a>
                                        </li>
                                        <% } %>
                                        <!--END CRON SETTINGS-->



                                        <!--MANAGE DEFECT DEV-->
                                        <%if (dev != null) {%>
                                        <li class="sub-menu">
                                            <% if (thisPage.equals("viewDefects") || thisPage.equals("viewSortedDefects") || thisPage.equals("viewCompletedDefects")) { %>
                                            <a class="active" href="viewDefects.jsp"> <% } else { %>
                                                <a href="viewDefects.jsp"> <% } %>
                                                    <i class="fa fa-bug"></i>
                                                    <span>Defects</span>
                                                </a>

                                                <ul class="sub">
                                                    <%if (dev != null) {%>
                                                    <% if (thisPage.equals("viewDefects") || thisPage.equals("viewSortedDefects")) { %>
                                                    <li class="active"><a href="viewDefects.jsp">View Defects In-progress</a></li><% } else { %>
                                                    <li><a href="viewDefects.jsp">View Defects In-progress</a></li><% } %>

                                                    <% if (thisPage.equals("viewCompletedDefects") || thisPage.equals("viewCompletedDefects")) { %>
                                                    <li class="active"><a href="viewCompletedDefects.jsp">View Completed Defects</a></li><% } else { %>
                                                    <li><a href="viewCompletedDefects.jsp">View Completed Defects</a></li><% } %>
                                                        <%}%>
                                                </ul>
                                        </li><%}%>
                                        <!--MANAGE DEFECT DEV-->

                                        <!--MANAGE DEFECTS PM TESTER-->
                                        <%if (pm != null || tester != null) {%>
                                        <li class="sub-menu">
                                            <% if (thisPage.equals("manageDefects") || thisPage.equals("sortedDefects") || thisPage.equals("addDefect") || thisPage.equals("viewCompletedDefects")) { %>
                                            <a class="active" href="manageDefects.jsp"> <% } else { %>
                                                <a href="manageDefects.jsp"> <% } %>
                                                    <i class="fa fa-bug"></i>
                                                    <span>Defects</span>
                                                </a>

                                                <ul class="sub">
                                                    <%if (pm != null || tester != null) {%>
                                                    <% if (thisPage.equals("manageDefects") || thisPage.equals("sortedDefects")) { %>
                                                    <li class="active"><a href="manageDefects.jsp">View Defects In Progress</a></li><% } else { %>
                                                    <li><a href="manageDefects.jsp">View Defects In Progress</a></li><% } %>
                                                        <%}%>
                                                        <%if (pm != null || tester != null) {%>
                                                        <% if (thisPage.equals("addDefect")) { %>
                                                    <li class="active"><a href="addDefect.jsp">Add Defects</a></li><% } else { %>
                                                    <li><a href="addDefect.jsp">Add Defects</a></li><% } %>

                                                    <% if (thisPage.equals("viewCompletedDefects")) { %>
                                                    <li class="active"><a href="viewCompletedDefects.jsp">View Completed Defects</a></li><% } else { %>
                                                    <li><a href="viewCompletedDefects.jsp">View Completed Defects</a></li><% } %>
                                                        <%}%>
                                                </ul>

                                        </li><%}%>
                                        <!--END MANAGE DEFECTS PM TESTER-->

                                        <!-- MANAGE PROJECT-->
                                        <%if (sudo == null) {%>
                                        <li class="sub-menu">
                                            <% if (thisPage.equals("viewTrelloCards") || thisPage.equals("viewCompletedProjects") || thisPage.equals("viewAllTrelloCards") || thisPage.equals("updateProjectType") || thisPage.equals("viewUnassignedCards")) { %>
                                            <a href="javascript:;" class="active"> <% } else { %>
                                                <a href="javascript:;"> <% } %>
                                                    <i class="fa fa-laptop"></i>
                                                    <span>Projects</span>
                                                </a>
                                                <ul class="sub">
                                                    <% if (thisPage.equals("viewTrelloCards")) { %>
                                                    <li class="active"><a href="viewTrelloCards.jsp">View My On-going Projects</a></li> <% } else { %>
                                                    <li><a href="viewTrelloCards.jsp">View My On-going Projects</a></li><% } %>
                                                        <%if (pm != null) {%>

                                                    <% if (thisPage.equals("viewAllTrelloCards")) { %>
                                                    <li class="active"><a href="viewAllTrelloCards.jsp">View All On-going Projects</a></li><% } else { %>
                                                    <li><a href="viewAllTrelloCards.jsp">View All On-going Projects</a></li><% } %>

                                                    <% if (thisPage.equals("viewCompletedProjects")) { %>
                                                    <li class="active"><a href="viewCompletedProjects.jsp">View All Completed Projects</a></li><% } else { %>
                                                    <li><a href="viewCompletedProjects.jsp">View All Completed Projects</a></li><% } %>

                                                    <% if (thisPage.equals("viewUnassignedCards")) { %>
                                                    <li class="active"><a href="assignProject">View Unassigned Projects</a></li><% } else { %>
                                                    <li><a href="assignProject">View Unassigned Projects</a></li><% } %>


                                                    <% if (thisPage.equals("updateProjectType")) { %>
                                                    <li class="active"><a href="updateProjectType.jsp">Update Project Type</a></li><% } else { %>
                                                    <li><a href="updateProjectType.jsp">Update Project Type</a></li><% } %>
                                                        <%}%>
                                                </ul>
                                        </li>
                                        <%}%>
                                        <!--END MANAGE PROJECTS-->

                                        <!-- MANAGE USERS SUDO-->
                                        <% if (sudo != null) { %>
                                        <li class="sub-menu">
                                            <% if (thisPage.equals("addUsers") || thisPage.equals("managePM") || thisPage.equals("manageDevProfile") || thisPage.equals("manageUser")) { %>
                                            <a href="javascript:;" class="active"> <% } else { %>
                                                <a href="javascript:;"> <% } %>
                                                    <i class="fa fa-users"></i>
                                                    <span>Manage Team Members</span>
                                                </a>

                                                <ul class="sub">
                                                    <% if (thisPage.equals("addUsers")) {%>
                                                    <li class="active"><a class="active" href="addUsers.jsp">Create Account</a></li><% } else { %>
                                                    <li><a href="addUsers.jsp">Create Account</a></li><% }%>


                                                    <% if (thisPage.equals("managePM")) {%>
                                                    <li class="active"><a class="active" href="managePM.jsp">Manage Project Managers</a></li> <% } else { %>
                                                    <li><a href="managePM.jsp">Manage Project Managers</a></li><% }%>

                                                    <% if (thisPage.equals("manageUser") || thisPage.equals("manageDevProfile")) {%>
                                                    <li class="active"><a class="active" href="manageUser.jsp">Manage Developers</a></li> <% } else { %>
                                                    <li><a href="manageUser.jsp">Manage Developers</a></li><% }%>
                                                </ul>
                                        </li>
                                        <% } %>
                                        <!-- END MANAGE USERS SUDO-->


                                        <!-- MANAGE USERS PM-->
                                        <% if (pm != null) { %>
                                        <li class="sub-menu">
                                            <% if (thisPage.equals("addUsers") || thisPage.equals("managePM") || thisPage.equals("manageDevProfile") || thisPage.equals("manageUser")) { %>
                                            <a href="javascript:;" class="active"> <% } else { %>
                                                <a href="javascript:;"> <% } %>
                                                    <i class="fa fa-users"></i>
                                                    <span>View Team</span>
                                                </a>
                                                <ul class="sub">
                                                    <% if (thisPage.equals("manageUser") || thisPage.equals("manageDevProfile")) {%>
                                                    <li class="active"><a class="active" href="manageUser.jsp">View All Developers</a></li> <% } else { %>
                                                    <li><a href="manageUser.jsp">View All Developers</a></li><% }%>
                                                </ul>
                                        </li>
                                        <% }%>
                                        <!-- END MANAGE USERS PM-->




                                        </ul>            
                                        </div>
                                        <!-- sidebar menu end-->
                                        </div>
                                        </aside>
                                        <!--sidebar end-->
                                        </section>
                                        <!-- Placed js at the end of the document so the pages load faster -->
                                        <!--Core js-->
                                        <script src="bootstrap/html/js/jquery.js"></script>
                                        <script src="bootstrap/html/js/jquery-ui/jquery-ui-1.10.1.custom.min.js"></script>
                                        <script src="bootstrap/html/bs3/js/bootstrap.min.js"></script>
                                        <script src="bootstrap/html/js/jquery.dcjqaccordion.2.7.js"></script>
                                        <script src="bootstrap/html/js/jquery.scrollTo.min.js"></script>
                                        <script src="bootstrap/html/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.js"></script>
                                        <script src="bootstrap/html/js/jquery.nicescroll.js"></script>
                                        <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/flot-chart/excanvas.min.js"></script><![endif]-->
                                        <script src="bootstrap/html/js/skycons/skycons.js"></script>
                                        <script src="bootstrap/html/js/jquery.scrollTo/jquery.scrollTo.js"></script>
                                        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
                                        <script src="bootstrap/html/js/calendar/clndr.js"></script>
                                        <script src="http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min.js"></script>
                                        <script src="bootstrap/html/js/calendar/moment-2.2.1.js"></script>
                                        <script src="bootstrap/html/js/evnt.calendar.init.js"></script>
                                        <script src="bootstrap/html/js/jvector-map/jquery-jvectormap-1.2.2.min.js"></script>
                                        <script src="bootstrap/html/js/jvector-map/jquery-jvectormap-us-lcc-en.js"></script>
                                        <script src="bootstrap/html/js/gauge/gauge.js"></script>
                                        <!--common script init for all pages-->
                                        <script src="bootstrap/html/js/scripts.js"></script>
                                        <!--script for this page-->
                                        </body>
                                        </html>