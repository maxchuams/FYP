<%-- 
    Document   : cronSettings
    Created on : Mar 1, 2016, 10:39:48 PM
    Author     : maxchua
--%>

<%@page import="src.model.TrelloConfigDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cron settings</title>
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
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
        <%

            String errorMsg = (String) request.getAttribute("err");
            String sucess = (String) request.getAttribute("sucess");
            ArrayList<String> errorArr = (ArrayList<String>) request.getAttribute("errList");
            if (sucess != null) {
                out.println(sucess);
            }
            if (errorArr != null) {
                out.println(errorArr);
            }
            
            String crondetails = TrelloConfigDAO.retrieveCronDetails();
        %>


        <%=crondetails%>
        <form action='modifyCronSettings'>
            Update by:
            <select name='updateby' id='updateby'>
                <option value=''>Please select an option</option>
                <option value='mins'>Minutes</option>
                <option value='hourly'>Hourly</option>
                <option value='daily'>Daily</option>
                <option value='weekly'>Weekly</option>
                <!--                <option value='monthly'>Monthly</option>
                                <option value='yearly'>Yearly</option>-->
            </select>
            <div id='mins'>
                Every <input type='number' name='minutes' min='1' max='59'/> minute(s)
                </br><input type='submit' value='submit'/>
            </div>
            <div id='hourly'>
                Every <input type='number' name='hour' min='1' max='23'/> hour(s)
                </br><input type='submit' value='submit'/>
            </div>
            <div id='daily'>
                <input type='radio' name='day' value='0'> Every <input type='number' name='daynum' min='1' max='30'/> day(s), or </br>
                <input type='radio' name='day' value='1'> Every Week day
                </br> at: 
                <input type='number' name='hourvalue' min='0' max='23'>Hr 
                <input type='number' name='minvalue' min='0' max='59'>Min
                </br><input type='submit' value='submit'/>
            </div>
            <div id='weekly'>
                <input type='checkbox' name='weeks' value='Mon'>Monday</br>
                <input type='checkbox' name='weeks' value='Tue'>Tuesday</br>
                <input type='checkbox' name='weeks' value='Wed'>Wednesday</br>
                <input type='checkbox' name='weeks' value='Thu'>Thursday</br>
                <input type='checkbox' name='weeks' value='Fri'>Friday</br>
                <input type='checkbox' name='weeks' value='Sat'>Saturday</br>
                <input type='checkbox' name='weeks' value='Sun'>Sunday</br>

                Start time: 
                <input type='number' name='hourvaluew' min='0' max='23'>Hr 
                <input type='number' name='minvaluew' min='0' max='59'>Min
                </br><input type='submit' value='submit'/>
            </div>

        </form>
        </br>
        <form action='updateCronActivity'>
            Set active:
            <input type='radio' name='active' value='0' checked/> Yes
            <input type='radio' name='active' value='1'/> No
            <input type='submit' value='submit'/>
        </form>
    </body>
</html>
