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
    <body>
        <section id="main-content">
            <section class="wrapper">
                <div class="row">
        <div class="col-md-12">
                

                <div class="profile-nav alt">
                    <section class="panel">
                        <div class="user-heading alt clock-row terques-bg">
                            <h1>Nov 6</h1>
                            <p class="text-left">2015, Friday</p>
                            <p class="text-left">10:00 am</p>
                        </div>
                        <ul id="clock">
                            <li id="sec"></li>
                            <li id="hour"></li>
                            <li id="min"></li>
                        </ul>
<br/>
                    </section>
                </div>

            </div>
                </div>
            </section>
        </section>
                    
    </body>
</html>
