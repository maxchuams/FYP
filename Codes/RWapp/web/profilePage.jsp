<%-- 
    Document   : profilePage
    Created on : Oct 31, 2015, 3:28:18 PM
    Author     : calvin
--%>

<%@page import="src.model.PersonDAO"%>
<%@page import="src.model.DeveloperDAO"%>
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
                                                                           if (p.getType().equals("s")) {
                                       out.println("SuperAdmin");%></spa                                        n><%
                                                                               }
                                                                               if (p.getType().equals("p")) {
                                           out.println("Project Manager");%></spa                                        n><%
                                                                               }
                                                                               if (p.getType().equals("c")) {
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
                                        <a data-toggle="tab" href="#contacts" class="contact-map">
                                            Country
                                        </a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#job-history">
                                            Job History
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
                                                    <%
                                                            String d = DeveloperDAO.retrieveDevCountry(p.getUsername());
                                                        %>
                                                    <h2> <span><i class="fa fa-map-marker"></i></span> Current Country : <%=d%></h2>
                                                    <div class="location-info">
                                                        
                                                        <form action='modifyCountry' class="form-horizontal">
                                                            <label class="col-lg-3 control-label">Change Country</label>
                                                            <div class="col-lg-9">
                                                                <select name="country" class="form-control m-bot15">
                                                                    <option value="">Country...</option>
                                                                    <option value="Singapore">Singapore</option>
                                                                    <option value="Afganistan">Afghanistan</option>
                                                                    <option value="Albania">Albania</option>
                                                                    <option value="Algeria">Algeria</option>
                                                                    <option value="American Samoa">American Samoa</option>
                                                                    <option value="Andorra">Andorra</option>
                                                                    <option value="Angola">Angola</option>
                                                                    <option value="Anguilla">Anguilla</option>
                                                                    <option value="Antigua &amp; Barbuda">Antigua &amp; Barbuda</option>
                                                                    <option value="Argentina">Argentina</option>
                                                                    <option value="Armenia">Armenia</option>
                                                                    <option value="Aruba">Aruba</option>
                                                                    <option value="Australia">Australia</option>
                                                                    <option value="Austria">Austria</option>
                                                                    <option value="Azerbaijan">Azerbaijan</option>
                                                                    <option value="Bahamas">Bahamas</option>
                                                                    <option value="Bahrain">Bahrain</option>
                                                                    <option value="Bangladesh">Bangladesh</option>
                                                                    <option value="Barbados">Barbados</option>
                                                                    <option value="Belarus">Belarus</option>
                                                                    <option value="Belgium">Belgium</option>
                                                                    <option value="Belize">Belize</option>
                                                                    <option value="Benin">Benin</option>
                                                                    <option value="Bermuda">Bermuda</option>
                                                                    <option value="Bhutan">Bhutan</option>
                                                                    <option value="Bolivia">Bolivia</option>
                                                                    <option value="Bonaire">Bonaire</option>
                                                                    <option value="Bosnia &amp; Herzegovina">Bosnia &amp; Herzegovina</option>
                                                                    <option value="Botswana">Botswana</option>
                                                                    <option value="Brazil">Brazil</option>
                                                                    <option value="British Indian Ocean Ter">British Indian Ocean Ter</option>
                                                                    <option value="Brunei">Brunei</option>
                                                                    <option value="Bulgaria">Bulgaria</option>
                                                                    <option value="Burkina Faso">Burkina Faso</option>
                                                                    <option value="Burundi">Burundi</option>
                                                                    <option value="Cambodia">Cambodia</option>
                                                                    <option value="Cameroon">Cameroon</option>
                                                                    <option value="Canada">Canada</option>
                                                                    <option value="Canary Islands">Canary Islands</option>
                                                                    <option value="Cape Verde">Cape Verde</option>
                                                                    <option value="Cayman Islands">Cayman Islands</option>
                                                                    <option value="Central African Republic">Central African Republic</option>
                                                                    <option value="Chad">Chad</option>
                                                                    <option value="Channel Islands">Channel Islands</option>
                                                                    <option value="Chile">Chile</option>
                                                                    <option value="China">China</option>
                                                                    <option value="Christmas Island">Christmas Island</option>
                                                                    <option value="Cocos Island">Cocos Island</option>
                                                                    <option value="Colombia">Colombia</option>
                                                                    <option value="Comoros">Comoros</option>
                                                                    <option value="Congo">Congo</option>
                                                                    <option value="Cook Islands">Cook Islands</option>
                                                                    <option value="Costa Rica">Costa Rica</option>
                                                                    <option value="Cote DIvoire">Cote D'Ivoire</option>
                                                                    <option value="Croatia">Croatia</option>
                                                                    <option value="Cuba">Cuba</option>
                                                                    <option value="Curaco">Curacao</option>
                                                                    <option value="Cyprus">Cyprus</option>
                                                                    <option value="Czech Republic">Czech Republic</option>
                                                                    <option value="Denmark">Denmark</option>
                                                                    <option value="Djibouti">Djibouti</option>
                                                                    <option value="Dominica">Dominica</option>
                                                                    <option value="Dominican Republic">Dominican Republic</option>
                                                                    <option value="East Timor">East Timor</option>
                                                                    <option value="Ecuador">Ecuador</option>
                                                                    <option value="Egypt">Egypt</option>
                                                                    <option value="El Salvador">El Salvador</option>
                                                                    <option value="Equatorial Guinea">Equatorial Guinea</option>
                                                                    <option value="Eritrea">Eritrea</option>
                                                                    <option value="Estonia">Estonia</option>
                                                                    <option value="Ethiopia">Ethiopia</option>
                                                                    <option value="Falkland Islands">Falkland Islands</option>
                                                                    <option value="Faroe Islands">Faroe Islands</option>
                                                                    <option value="Fiji">Fiji</option>
                                                                    <option value="Finland">Finland</option>
                                                                    <option value="France">France</option>
                                                                    <option value="French Guiana">French Guiana</option>
                                                                    <option value="French Polynesia">French Polynesia</option>
                                                                    <option value="French Southern Ter">French Southern Ter</option>
                                                                    <option value="Gabon">Gabon</option>
                                                                    <option value="Gambia">Gambia</option>
                                                                    <option value="Georgia">Georgia</option>
                                                                    <option value="Germany">Germany</option>
                                                                    <option value="Ghana">Ghana</option>
                                                                    <option value="Gibraltar">Gibraltar</option>
                                                                    <option value="Great Britain">Great Britain</option>
                                                                    <option value="Greece">Greece</option>
                                                                    <option value="Greenland">Greenland</option>
                                                                    <option value="Grenada">Grenada</option>
                                                                    <option value="Guadeloupe">Guadeloupe</option>
                                                                    <option value="Guam">Guam</option>
                                                                    <option value="Guatemala">Guatemala</option>
                                                                    <option value="Guinea">Guinea</option>
                                                                    <option value="Guyana">Guyana</option>
                                                                    <option value="Haiti">Haiti</option>
                                                                    <option value="Hawaii">Hawaii</option>
                                                                    <option value="Honduras">Honduras</option>
                                                                    <option value="Hong Kong">Hong Kong</option>
                                                                    <option value="Hungary">Hungary</option>
                                                                    <option value="Iceland">Iceland</option>
                                                                    <option value="India">India</option>
                                                                    <option value="Indonesia">Indonesia</option>
                                                                    <option value="Iran">Iran</option>
                                                                    <option value="Iraq">Iraq</option>
                                                                    <option value="Ireland">Ireland</option>
                                                                    <option value="Isle of Man">Isle of Man</option>
                                                                    <option value="Israel">Israel</option>
                                                                    <option value="Italy">Italy</option>
                                                                    <option value="Jamaica">Jamaica</option>
                                                                    <option value="Japan">Japan</option>
                                                                    <option value="Jordan">Jordan</option>
                                                                    <option value="Kazakhstan">Kazakhstan</option>
                                                                    <option value="Kenya">Kenya</option>
                                                                    <option value="Kiribati">Kiribati</option>
                                                                    <option value="Korea North">Korea North</option>
                                                                    <option value="Korea Sout">Korea South</option>
                                                                    <option value="Kuwait">Kuwait</option>
                                                                    <option value="Kyrgyzstan">Kyrgyzstan</option>
                                                                    <option value="Laos">Laos</option>
                                                                    <option value="Latvia">Latvia</option>
                                                                    <option value="Lebanon">Lebanon</option>
                                                                    <option value="Lesotho">Lesotho</option>
                                                                    <option value="Liberia">Liberia</option>
                                                                    <option value="Libya">Libya</option>
                                                                    <option value="Liechtenstein">Liechtenstein</option>
                                                                    <option value="Lithuania">Lithuania</option>
                                                                    <option value="Luxembourg">Luxembourg</option>
                                                                    <option value="Macau">Macau</option>
                                                                    <option value="Macedonia">Macedonia</option>
                                                                    <option value="Madagascar">Madagascar</option>
                                                                    <option value="Malaysia">Malaysia</option>
                                                                    <option value="Malawi">Malawi</option>
                                                                    <option value="Maldives">Maldives</option>
                                                                    <option value="Mali">Mali</option>
                                                                    <option value="Malta">Malta</option>
                                                                    <option value="Marshall Islands">Marshall Islands</option>
                                                                    <option value="Martinique">Martinique</option>
                                                                    <option value="Mauritania">Mauritania</option>
                                                                    <option value="Mauritius">Mauritius</option>
                                                                    <option value="Mayotte">Mayotte</option>
                                                                    <option value="Mexico">Mexico</option>
                                                                    <option value="Midway Islands">Midway Islands</option>
                                                                    <option value="Moldova">Moldova</option>
                                                                    <option value="Monaco">Monaco</option>
                                                                    <option value="Mongolia">Mongolia</option>
                                                                    <option value="Montserrat">Montserrat</option>
                                                                    <option value="Morocco">Morocco</option>
                                                                    <option value="Mozambique">Mozambique</option>
                                                                    <option value="Myanmar">Myanmar</option>
                                                                    <option value="Nambia">Nambia</option>
                                                                    <option value="Nauru">Nauru</option>
                                                                    <option value="Nepal">Nepal</option>
                                                                    <option value="Netherland Antilles">Netherland Antilles</option>
                                                                    <option value="Netherlands">Netherlands (Holland, Europe)</option>
                                                                    <option value="Nevis">Nevis</option>
                                                                    <option value="New Caledonia">New Caledonia</option>
                                                                    <option value="New Zealand">New Zealand</option>
                                                                    <option value="Nicaragua">Nicaragua</option>
                                                                    <option value="Niger">Niger</option>
                                                                    <option value="Nigeria">Nigeria</option>
                                                                    <option value="Niue">Niue</option>
                                                                    <option value="Norfolk Island">Norfolk Island</option>
                                                                    <option value="Norway">Norway</option>
                                                                    <option value="Oman">Oman</option>
                                                                    <option value="Pakistan">Pakistan</option>
                                                                    <option value="Palau Island">Palau Island</option>
                                                                    <option value="Palestine">Palestine</option>
                                                                    <option value="Panama">Panama</option>
                                                                    <option value="Papua New Guinea">Papua New Guinea</option>
                                                                    <option value="Paraguay">Paraguay</option>
                                                                    <option value="Peru">Peru</option>
                                                                    <option value="Phillipines">Philippines</option>
                                                                    <option value="Pitcairn Island">Pitcairn Island</option>
                                                                    <option value="Poland">Poland</option>
                                                                    <option value="Portugal">Portugal</option>
                                                                    <option value="Puerto Rico">Puerto Rico</option>
                                                                    <option value="Qatar">Qatar</option>
                                                                    <option value="Republic of Montenegro">Republic of Montenegro</option>
                                                                    <option value="Republic of Serbia">Republic of Serbia</option>
                                                                    <option value="Reunion">Reunion</option>
                                                                    <option value="Romania">Romania</option>
                                                                    <option value="Russia">Russia</option>
                                                                    <option value="Rwanda">Rwanda</option>
                                                                    <option value="St Barthelemy">St Barthelemy</option>
                                                                    <option value="St Eustatius">St Eustatius</option>
                                                                    <option value="St Helena">St Helena</option>
                                                                    <option value="St Kitts-Nevis">St Kitts-Nevis</option>
                                                                    <option value="St Lucia">St Lucia</option>
                                                                    <option value="St Maarten">St Maarten</option>
                                                                    <option value="St Pierre &amp; Miquelon">St Pierre &amp; Miquelon</option>
                                                                    <option value="St Vincent &amp; Grenadines">St Vincent &amp; Grenadines</option>
                                                                    <option value="Saipan">Saipan</option>
                                                                    <option value="Samoa">Samoa</option>
                                                                    <option value="Samoa American">Samoa American</option>
                                                                    <option value="San Marino">San Marino</option>
                                                                    <option value="Sao Tome &amp; Principe">Sao Tome &amp; Principe</option>
                                                                    <option value="Saudi Arabia">Saudi Arabia</option>
                                                                    <option value="Senegal">Senegal</option>
                                                                    <option value="Serbia">Serbia</option>
                                                                    <option value="Seychelles">Seychelles</option>
                                                                    <option value="Sierra Leone">Sierra Leone</option>
                                                                    <option value="Singapore">Singapore</option>
                                                                    <option value="Slovakia">Slovakia</option>
                                                                    <option value="Slovenia">Slovenia</option>
                                                                    <option value="Solomon Islands">Solomon Islands</option>
                                                                    <option value="Somalia">Somalia</option>
                                                                    <option value="South Africa">South Africa</option>
                                                                    <option value="Spain">Spain</option>
                                                                    <option value="Sri Lanka">Sri Lanka</option>
                                                                    <option value="Sudan">Sudan</option>
                                                                    <option value="Suriname">Suriname</option>
                                                                    <option value="Swaziland">Swaziland</option>
                                                                    <option value="Sweden">Sweden</option>
                                                                    <option value="Switzerland">Switzerland</option>
                                                                    <option value="Syria">Syria</option>
                                                                    <option value="Tahiti">Tahiti</option>
                                                                    <option value="Taiwan">Taiwan</option>
                                                                    <option value="Tajikistan">Tajikistan</option>
                                                                    <option value="Tanzania">Tanzania</option>
                                                                    <option value="Thailand">Thailand</option>
                                                                    <option value="Togo">Togo</option>
                                                                    <option value="Tokelau">Tokelau</option>
                                                                    <option value="Tonga">Tonga</option>
                                                                    <option value="Trinidad &amp; Tobago">Trinidad &amp; Tobago</option>
                                                                    <option value="Tunisia">Tunisia</option>
                                                                    <option value="Turkey">Turkey</option>
                                                                    <option value="Turkmenistan">Turkmenistan</option>
                                                                    <option value="Turks &amp; Caicos Is">Turks &amp; Caicos Is</option>
                                                                    <option value="Tuvalu">Tuvalu</option>
                                                                    <option value="Uganda">Uganda</option>
                                                                    <option value="Ukraine">Ukraine</option>
                                                                    <option value="United Arab Erimates">United Arab Emirates</option>
                                                                    <option value="United Kingdom">United Kingdom</option>
                                                                    <option value="United States of America">United States of America</option>
                                                                    <option value="Uraguay">Uruguay</option>
                                                                    <option value="Uzbekistan">Uzbekistan</option>
                                                                    <option value="Vanuatu">Vanuatu</option>
                                                                    <option value="Vatican City State">Vatican City State</option>
                                                                    <option value="Venezuela">Venezuela</option>
                                                                    <option value="Vietnam">Vietnam</option>
                                                                    <option value="Virgin Islands (Brit)">Virgin Islands (Brit)</option>
                                                                    <option value="Virgin Islands (USA)">Virgin Islands (USA)</option>
                                                                    <option value="Wake Island">Wake Island</option>
                                                                    <option value="Wallis &amp; Futana Is">Wallis &amp; Futana Is</option>
                                                                    <option value="Yemen">Yemen</option>
                                                                    <option value="Zaire">Zaire</option>
                                                                    <option value="Zambia">Zambia</option>
                                                                    <option value="Zimbabwe">Zimbabwe</option>
                                                                </select>
                                                            </div>
                                                            <input type="hidden" name="user" value="<%=dev.getUsername()%>"/>
                                                            <div class="col-lg-offset-3 col-lg-9">
                                                            <button class="btn btn-danger" type="submit">Submit</button>
                                                            </div>
                                                        </form>
                                                    </div>

                                                </div>
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
