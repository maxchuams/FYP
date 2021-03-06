<%-- 
    Document   : cronSettings
    Created on : Mar 1, 2016, 10:39:48 PM
    Author     : maxchua
--%>

<%@page import="src.model.TrelloConfigDAO"%>
<%@page import="java.util.ArrayList"%>
<%@include file="protectSudo.jsp" %>
<%String thisPage = "cronSettings"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cron settings</title>
        <link href="js/skins/minimal/green.css" rel="stylesheet">
        <link href="js/skins/square/green.css" rel="stylesheet">
        <link href="js/skins/flat/green.css" rel="stylesheet">
        <script src="js/icheck.js"></script>
<!--        <script>
            $(document).ready(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_flat',
                    radioClass: 'iradio_flat'
                });
            });
        </script>-->
        <!--<script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>-->

        <script type='text/javascript' src="http://www.bootstrap-switch.org/dist/js/bootstrap-switch.js"></script>
        <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.0/css/bootstrap-toggle.min.css" rel="stylesheet">
        <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.0/js/bootstrap-toggle.min.js"></script>
        <script type='text/javascript'>
            $(window).load(function () {
                $("input.switch").bootstrapSwitch();
            });
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('#mins').hide();
                $('#hourly').hide();
                $('#daily').hide();
                $('#weekly').hide();

                $('#updateby').change(function () {

                    var $index = $('#updateby').index(this);
                    if ($('#updateby').val() == 'mins') { //if this value is NOT selected
                        $('#mins').show();
                        $('#hourly').hide();
                        $('#daily').hide();
                        $('#weekly').hide();
                    } else if ($('#updateby').val() == 'hourly') {
                        $('#mins').hide();
                        $('#hourly').show();
                        $('#daily').hide();
                        $('#weekly').hide();
                    } else if ($('#updateby').val() == 'daily') {
                        $('#mins').hide();
                        $('#hourly').hide();
                        $('#daily').show();
                        $('#weekly').hide();
                    } else if ($('#updateby').val() == 'weekly') {
                        $('#mins').hide();
                        $('#hourly').hide();
                        $('#daily').hide();
                        $('#weekly').show();
                    } else if ($('#updateby').val() == '') {
                        $('#mins').hide();
                        $('#hourly').hide();
                        $('#daily').hide();
                        $('#weekly').hide();
                    }

                });
            });
        </script>
    </head>
    <body>
        <section id="main-content">
            <section class="wrapper">
                <%
                    String passSwitch2 = (String) request.getAttribute("passSwitch2");
                    String errorMsg = (String) request.getAttribute("err");
                    String success = (String) request.getAttribute("success");
                    ArrayList<String> errorArr = (ArrayList<String>) request.getAttribute("errList");
                    if (success != null) {%>
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
                <%}
                    if (errorArr != null) {%>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="alert alert-block alert-danger fade in">
                                <button data-dismiss="alert" class="close close-sm" type="button">
                                    <i class="fa fa-times"></i>
                                </button>
                                <%for (int i = 0; i < errorArr.size(); i++) {
                                        out.println((i + 1) + ". " + errorArr.get(i) + "<br/>");
                                    }%>
                            </div>
                        </section>
                    </div>
                </div>
                <% }
                    if (errorMsg != null) {%>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="lert alert-block alert-danger fade in">
                                <button data-dismiss="alert" class="close close-sm" type="button">
                                    <i class="fa fa-times"></i>
                                </button>
                                <%=errorMsg%>
                            </div>
                        </section>
                    </div>
                </div>
                <%}
                    String crondetails = TrelloConfigDAO.retrieveCronDetails();
                    int pause = TrelloConfigDAO.retrieveCronPause();
                %>

                <div class="row">
                    <div class="col-sm-12">
                        <section class="panel">
                            <div class="panel-body">
                                <h3 class="prf-border-head">Current Cron Settings</h3>
                                <div class="alert alert-info clearfix ">
                                    <span class="alert-icon"><i class="fa fa-refresh"></i></span>
                                    <div class="notification-info">
                                        <ul class="clearfix notification-meta">
                                            <li class="pull-left notification-sender" style='color:black'> <%if (pause == 0) {
                                                    out.println("<b>Status: Active</b>");
                                                } else {
                                                    out.println("<b>Status: Inactive</b>");
                                                }%><br/>
                                                <%=crondetails%>
                                            </li>
                                            <li class='pull-right notification-time'>
                                                <form action='updateCronActivity' class="form-horizontal form-inline" id='submitForm'>
                                                    <%if (pause==0) {%>
                                                    <input id="toggle-event" name="switch2" type="checkbox" data-toggle="toggle" checked>
                                                    <%} else {%>
                                                    <input id="toggle-event" name="switch2" type="checkbox" data-toggle="toggle"/>
                                                    <%}%>
                                                    <div id="console-event"></div>
                                                    <script>
                                                        $(function () {
                                                            $('#toggle-event').change(function () {
                                                                setTimeout(function () {
                                                                    $('#submitForm').submit();
                                                                }, 500);
                                                            });
                                                        });
                                                        document.getElementById("#toggle-event").value = $(this).prop('checked');
                                                    </script>
                                                </form>
                                            </li>
                                        </ul>
                                        <p style="color: black">
                                            <b></b>
                                        </p>
                                    </div>
                                </div>
                                <hr/>


                                <h3 class="prf-border-head">Update Cron Settings</h3>

                                <form action='modifyCronSettings' class="form-horizontal">
                                    <label for="inputEmail1" class="col-sm-1 control-label">Schedule:</label>
                                    <div class="col-sm-11">
                                        <select name="updateby" id='updateby' class="devSelect2 form-control m-bot15">
                                            <option value=''>Please select an option</option>
                                            <option value='mins'>Minutes</option>
                                            <option value='hourly'>Hourly</option>
                                            <option value='daily'>Daily</option>
                                            <option value='weekly'>Weekly</option>
                                        </select>

                                        <div id='mins' class="form-group col-sm-10 form-inline">
                                            <label>Every</label> <input type='number' class="form-control" name='minutes' min='1' max='59'><label>&nbsp; minute(s)</label>
                                            <br/><br/><p></p>
                                            <div class="form-group">
                                                <div class="col-lg-offset-0 col-lg-11">
                                                    <p></p>
                                                    <button type="submit" value='submit' class="btn btn-primary">Submit</button>
                                                </div>
                                            </div>
                                        </div>

                                        <div id='hourly' class="form-group col-sm-10 form-inline">
                                            <label>Every</label> <input type='number' name='hour' min='1' max='23' class="form-control"/> <label> hour(s)</label>
                                            <br/><br/><p></p>
                                            <div class="form-group">
                                                <div class="col-lg-offset-0 col-lg-11">
                                                    <p></p>
                                                    <button type="submit" value='submit' class="btn btn-primary">Submit</button>
                                                </div>
                                            </div>
                                        </div>

                                        <div id='daily' class="form-group col-sm-10 form-inline">
                                            <input type='radio' name='day' value='0'> <label>Every</label> <input type='number' class="form-control" name='daynum' min='1' max='30'/> <label>&nbsp;day(s), or</label> </br>
                                            <input type='radio' name='day' value='1'> <label>Every Week day </label><br/><br/>
                                            <label>At</label>
                                            <input type='number' class="form-control" name='hourvalue' value='12' min='0' max='23'><label>&nbsp;Hr </label>
                                            <input type='number' class="form-control" name='minvalue' value='30'  min='0' max='59'><label>&nbsp;Min </label><br/>
                                            <div class="form-group">
                                                <div class="col-lg-offset-0 col-lg-11">
                                                    <p></p>
                                                    <button type="submit" value='submit' class="btn btn-primary">Submit</button>
                                                </div>
                                            </div>
                                        </div>

                                        <div id='weekly' class="form-horizontal">
                                            <input type='checkbox' name='weeks' value='Mon'>&nbsp;Monday</br>
                                            <input type='checkbox' name='weeks' value='Tue'>&nbsp;Tuesday</br>
                                            <input type='checkbox' name='weeks' value='Wed'>&nbsp;Wednesday</br>
                                            <input type='checkbox' name='weeks' value='Thu'>&nbsp;Thursday</br>
                                            <input type='checkbox' name='weeks' value='Fri'>&nbsp;Friday</br>
                                            <input type='checkbox' name='weeks' value='Sat'>&nbsp;Saturday</br>
                                            <input type='checkbox' name='weeks' value='Sun'>&nbsp;Sunday</br>
                                            <br/>
                                            <div id='daily' class="form-group col-sm-10 form-inline">
                                                <label>At</label> <input type='number' name='hourvaluew' min='0' max='23' value='12' class="form-control"><label>&nbsp;Hr </label>
                                                <input type='number' name='minvaluew' min='0' max='59' value='30' class="form-control"><label>&nbsp;Min</label><br/><br/>
                                                <div class="form-group">
                                                    <div class="col-lg-offset-0 col-lg-11">
                                                        <p></p>
                                                        <button type="submit" value='submit' class="btn btn-primary">Submit</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                </form>
                                </br>
                            </div>
                        </section>
                    </div>
                </div>
            </section>
        </section>
        <script src="js/bootstrap-switch.js"></script>
        <script>
            $(document).ready(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_flat-green',
                    radioClass: 'iradio_flat-green'
                });
            });
        </script>
    </body>
</html>
