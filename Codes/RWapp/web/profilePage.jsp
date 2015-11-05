<%-- 
    Document   : profilePage
    Created on : Oct 31, 2015, 3:28:18 PM
    Author     : calvin
--%>

<%@page import="src.model.PersonDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="protect.jsp"%>
<%String thisPage = "profilePage"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recco</title>
    </head>
    <body>
         <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
        <!-- page start-->

        <div class="row">
            <div class="col-md-12">
                <section class="panel">
                    <div class="panel-body profile-information">
                       <div class="col-md-6">
                           <div class="profile-pic text-right">
                               <img src="ImageServlet?imageid=<%=username%>" alt="Display this text instead" align="center"/>
                           </div>
                       </div>
                       <div class="col-md-6">
                               <h1><%=username%></h1>
                               <span class="text-muted">User Role: <%
                               Person p = PersonDAO.retrieveUser(username);
                               if(p.getType().equals("s")){
                                   out.println("SuperAdmin");%></span><%
                               }if(p.getType().equals("p")){
                                   out.println("Project Manager");%></span><%
                               }if(p.getType().equals("c")){
                                   out.println("Developer");%></span><%
                               }
                               %>
                               
                       </div>
                       
                    </div>
                </section>
            </div>
            <div class="col-md-12">
                <section class="panel">
                    <header class="panel-heading tab-bg-dark-navy-blue">
                        <ul class="nav nav-tabs nav-justified ">
                            <li class="active">
                                <a data-toggle="tab" href="#overview">
                                    Profile Picture
                                </a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#job-history">
                                    Job History
                                </a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#contacts" class="contact-map">
                                    Contacts
                                </a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#settings">
                                    Others
                                </a>
                            </li>
                        </ul>
                    </header>
                    
                    <div class="panel-body">
                        <div class="tab-content tasi-tab">
                            <div id="overview" class="tab-pane active ">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-0"></div>
                                    <div class="prf-contacts sttng col-md-12">
                                        <h2>Edit Profile Picture</h2>
                                    </div>
                                    <form role="form" method="post" action="uploadServlet" enctype="multipart/form-data" class="form-horizontal">
                                        
                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">Select Image</label>
                                            <div class="col-lg-10">
                                                <input type="file" id="exampleInputFile" name="file_uploaded" class="file-pos">
                                                <input type="hidden" name="username" value="<%=username%>">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-lg-offset-2 col-lg-10">
                                                <button class="btn btn-primary" type="submit">Save</button>
                                            </div>
                                        </div>
                                            
                                    </form>
                                            <hr/>
                                            <form method="POST"  action="uploadServlet" enctype="multipart/form-data" class="form-horizontal">
                                                <div class="form-group">
                                                    <label class="col-lg-2 control-label">Delete Image</label>
                                                    <div class="col-lg-10"> 
                                                        <input type="hidden" name="username" value="<%=username%>">
                                                <input type="hidden" name="delete" value="delete">
                                                <button class="btn btn-danger" type="submit">Delete</button>
                                                        <!--<input type="file" id="exampleInputFile" name="file_uploaded" class="file-pos">-->
                                                <input type="hidden" name="username" value="<%=username%>"></div>
                                                </div>
                                                
                                                
                                            </form>
                                </div>
                                </div>
                            </div>
                            <div id="settings" class="tab-pane">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="recent-act">
                                            <h1>Recent Activity</h1>
                                            <div class="activity-icon terques">
                                                <i class="fa fa-check"></i>
                                            </div>
                                            <div class="activity-desk">
                                                <h2>1 Hour Ago</h2>
                                                <p>Purchased new stationary items for head office</p>
                                            </div>
                                            <div class="activity-icon red">
                                                <i class="fa fa-beer"></i>
                                            </div>
                                            <div class="activity-desk">
                                                <h2 class="red">2 Hour Ago</h2>
                                                <p>Completed Coffee meeting with <a href="#" class="terques">Stive Martin</a> regarding the Product Promotion</p>
                                            </div>
                                            <div class="activity-icon purple">
                                                <i class="fa fa-tags"></i>
                                            </div>
                                            <div class="activity-desk">
                                                <h2 class="purple">today evening</h2>
                                                <p>3 photo Uploaded on facebook product page</p>
                                                <div class="photo-gl">
                                                    <a href="#">
                                                        <img src="images/sm-img-1.jpg" alt=""/>
                                                    </a>
                                                    <a href="#">
                                                        <img src="images/sm-img-2.jpg" alt=""/>
                                                    </a>
                                                    <a href="#">
                                                        <img src="images/sm-img-3.jpg" alt=""/>
                                                    </a>
                                                </div>
                                            </div>

                                            <div class="activity-icon green">
                                                <i class="fa fa-map-marker"></i>
                                            </div>
                                            <div class="activity-desk">
                                                <h2 class="green">yesterday</h2>
                                                <p>Outdoor visit at <a href="#" class="blue">California State Route</a> 85 with <a href="#" class="terques">John Boltana</a> & <a href="#" class="terques">Harry Piterson</a> regarding to setup a new show room.</p>
                                                <div class="loc-map">
                                                    location map goes here
                                                </div>
                                            </div>

                                            <div class="activity-icon yellow">
                                                <i class="fa fa-user-md"></i>
                                            </div>
                                            <div class="activity-desk">
                                                <h2 class="yellow">12 december 2013</h2>
                                                <p>Montly Regular Medical check up at Greenland Hospital.</p>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="prf-box">
                                            <h3 class="prf-border-head">work in progress</h3>
                                            <div class=" wk-progress">
                                                <div class="col-md-5">Themeforest</div>
                                                <div class="col-md-5">
                                                    <div class="progress  ">
                                                        <div style="width: 70%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-danger">
                                                            <span class="sr-only">70% Complete (success)</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">70%</div>
                                            </div>
                                            <div class=" wk-progress">
                                                <div class="col-md-5">Graphics River</div>
                                                <div class="col-md-5">
                                                    <div class="progress ">
                                                        <div style="width: 57%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-success">
                                                            <span class="sr-only">57% Complete (success)</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">57%</div>
                                            </div>
                                            <div class=" wk-progress">
                                                <div class="col-md-5">Code Canyon</div>
                                                <div class="col-md-5">
                                                    <div class="progress ">
                                                        <div style="width: 20%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-info">
                                                            <span class="sr-only">20% Complete (success)</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">20%</div>
                                            </div>
                                            <div class=" wk-progress">
                                                <div class="col-md-5">Audio Jungle</div>
                                                <div class="col-md-5">
                                                    <div class="progress ">
                                                        <div style="width: 30%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-warning">
                                                            <span class="sr-only">30% Complete (success)</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">30%</div>
                                            </div>
                                        </div>
                                        <div class="prf-box">
                                            <h3 class="prf-border-head">performance status</h3>
                                            <div class=" wk-progress pf-status">
                                                <div class="col-md-8 col-xs-8">Total Product Sales</div>
                                                <div class="col-md-4 col-xs-4">
                                                    <strong>23545</strong>
                                                </div>
                                            </div>
                                            <div class=" wk-progress pf-status">
                                                <div class="col-md-8 col-xs-8">Total Product Refer</div>
                                                <div class="col-md-4 col-xs-4">
                                                    <strong>235</strong>
                                                </div>
                                            </div>
                                            <div class=" wk-progress pf-status">
                                                <div class="col-md-8 col-xs-8">Total Earn</div>
                                                <div class="col-md-4 col-xs-4">
                                                    <strong>235452344$</strong>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="prf-box">
                                            <h3 class="prf-border-head">team members</h3>
                                            <div class=" wk-progress tm-membr">
                                                <div class="col-md-2 col-xs-2">
                                                    <div class="tm-avatar">
                                                        <img src="images/lock_thumb.jpg" alt=""/>
                                                    </div>
                                                </div>
                                                <div class="col-md-7 col-xs-7">
                                                    <span class="tm">John Boltana</span>
                                                </div>
                                                <div class="col-md-3 col-xs-3">
                                                    <a href="#" class="btn btn-white">Assign</a>
                                                </div>
                                            </div>
                                            <div class=" wk-progress tm-membr">
                                                <div class="col-md-2 col-xs-2">
                                                    <div class="tm-avatar">
                                                        <img src="images/avatar-mini-2.jpg" alt=""/>
                                                    </div>
                                                </div>
                                                <div class="col-md-7 col-xs-7">
                                                    <span class="tm">John Boltana</span>
                                                </div>
                                                <div class="col-md-3 col-xs-3">
                                                    <a href="#" class="btn btn-white">Assign</a>
                                                </div>
                                            </div>
                                            <div class=" wk-progress tm-membr">
                                                <div class="col-md-2 col-xs-2">
                                                    <div class="tm-avatar">
                                                        <img src="images/avatar-mini-3.jpg" alt=""/>
                                                    </div>
                                                </div>
                                                <div class="col-md-7 col-xs-7">
                                                    <span class="tm">John Boltana</span>
                                                </div>
                                                <div class="col-md-3 col-xs-3">
                                                    <a href="#" class="btn btn-white">Assign</a>
                                                </div>
                                            </div>
                                            <div class=" wk-progress tm-membr">
                                                <div class="col-md-2 col-xs-2">
                                                    <div class="tm-avatar">
                                                        <img src="images/avatar-mini-4.jpg" alt=""/>
                                                    </div>
                                                </div>
                                                <div class="col-md-7 col-xs-7">
                                                    <span class="tm">John Boltana</span>
                                                </div>
                                                <div class="col-md-3 col-xs-3">
                                                    <a href="#" class="btn btn-white">Assign</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="job-history" class="tab-pane ">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="timeline-messages">
                                            <h3>Take a Tour</h3>
                                            <!-- Comment -->
                                            <div class="msg-time-chat">
                                                <div class="message-body msg-in">
                                                    <span class="arrow"></span>
                                                    <div class="text">
                                                        <div class="first">
                                                            13 January 2013
                                                        </div>
                                                        <div class="second bg-terques ">
                                                            Join as Product Asst. Manager
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /comment -->

                                            <!-- Comment -->
                                            <div class="msg-time-chat">
                                                <div class="message-body msg-in">
                                                    <span class="arrow"></span>
                                                    <div class="text">
                                                        <div class="first">
                                                            10 February 2012
                                                        </div>
                                                        <div class="second bg-red">
                                                            Completed Provition period and Appointed as a permanent Employee
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /comment -->

                                            <!-- Comment -->
                                            <div class="msg-time-chat">
                                                <div class="message-body msg-in">
                                                    <span class="arrow"></span>
                                                    <div class="text">
                                                        <div class="first">
                                                            2 January 2011
                                                        </div>
                                                        <div class="second bg-purple">
                                                            Selected Employee of the Month
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /comment -->

                                            <!-- Comment -->
                                            <div class="msg-time-chat">
                                                <div class="message-body msg-in">
                                                    <span class="arrow"></span>
                                                    <div class="text">
                                                        <div class="first">
                                                            4 March 2010
                                                        </div>
                                                        <div class="second bg-green">
                                                            Got Promotion and become area manager of California
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /comment -->
                                            <!-- Comment -->
                                            <div class="msg-time-chat">
                                                <div class="message-body msg-in">
                                                    <span class="arrow"></span>
                                                    <div class="text">
                                                        <div class="first">
                                                            3 April 2009
                                                        </div>
                                                        <div class="second bg-yellow">
                                                            Selected the Best Employee of the Year 2013 and was awarded
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /comment -->

                                            <!-- Comment -->
                                            <div class="msg-time-chat">
                                                <div class="message-body msg-in">
                                                    <span class="arrow"></span>
                                                    <div class="text">
                                                        <div class="first">
                                                            23 May 2008
                                                        </div>
                                                        <div class="second bg-terques">
                                                            Got Promotion and become Product Manager and was transper from Branch to Head Office. Lorem ipsum dolor sit amet
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /comment -->
                                            <!-- Comment -->
                                            <div class="msg-time-chat">
                                                <div class="message-body msg-in">
                                                    <span class="arrow"></span>
                                                    <div class="text">
                                                        <div class="first">
                                                            14 June 2007
                                                        </div>
                                                        <div class="second bg-blue">
                                                            Height Sales scored and break all of the previous sales record ever in the company. Awarded
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /comment -->
                                            <!-- Comment -->
                                            <div class="msg-time-chat">
                                                <div class="message-body msg-in">
                                                    <span class="arrow"></span>
                                                    <div class="text">
                                                        <div class="first">
                                                            1 January 2006
                                                        </div>
                                                        <div class="second bg-green">
                                                            Take 15 days leave for his wedding and Honeymoon & Christmas
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /comment -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="contacts" class="tab-pane ">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="prf-contacts">
                                            <h2> <span><i class="fa fa-map-marker"></i></span> location</h2>
                                            <div class="location-info">
                                                <p>Postal Address<br>
                                                    PO Box 16122 Collins Street West<br>
                                                    Victoria 8007 Australia</p>
                                                <p>Headquarters<br>
                                                    121 King Street, Melbourne<br>
                                                    Victoria 3000 Australia</p>
                                            </div>
                                            <h2> <span><i class="fa fa-phone"></i></span> contacts</h2>
                                            <div class="location-info">
                                                <p>Phone	: +61 3 8376 6284 <br>
                                                    Cell		: +61 3 8376 6284</p>
                                                <p>Email		: david@themebucket.net<br>
                                                    Skype		: david.rojormillan</p>
                                                <p>
                                                    Facebook	: https://www.facebook.com/themebuckets <br>
                                                    Twitter	: https://twitter.com/theme_bucket
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div id="map-canvas"></div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <!-- page end-->
        </section>
    </section>
    <!--main content end-->
    </body>
</html>
