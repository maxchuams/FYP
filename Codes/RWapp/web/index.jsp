<%-- 
    Document   : index
    Created on : Sep 7, 2015, 1:30:53 PM
    Author     : admin
--%>
<%@include file="protect.jsp" %>
<%String thisPage = "index"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="src.model.Person"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recco</title>
    </head>
    <body onload="startTime()">
        <section id="main-content">
            <section class="wrapper">
                <div class="row">
        <div class="col-md-12">
                <div class="profile-nav alt">
                    <section class="panel">
                            <div id="time" class="user-heading alt clock-row terques-bg"></div>
                    </section>
                </div>

            </div>
                </div>
            </section>
        </section>
                    <script>
        function startTime()
        {
            var today=new Date();
            var h=today.getHours();
            var m=today.getMinutes();
            var s=today.getSeconds();
            // add a zero in front of numbers<10
            m=checkTime(m);
            s=checkTime(s);
            document.getElementById('time').innerHTML=h+":"+m+":"+s;
            t=setTimeout(function(){startTime()},500);
        }

        function checkTime(i)
        {
            if (i<10)
            {
                i="0" + i;
            }
            return i;
        }
    </script>
    </body>
</html>
