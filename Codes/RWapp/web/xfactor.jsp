<%-- 
    Document   : index
    Created on : Sep 7, 2015, 1:30:53 PM
    Author     : admin
--%>
<%@page import="src.model.RecommedationDAO"%>
<%@page import="java.util.Date"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonObject"%>

<%@page import="java.util.ArrayList"%>
<%@include file="protect.jsp" %>
<%String thisPage = "index"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recco</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="res/chart/Chart.js"></script>
        <script src="res/chart/legend.js"></script>

        <link rel=stylesheet href="./bootstrap/platform.css" type="text/css">
        <link rel=stylesheet href="./bootstrap/libs/dateField/jquery.dateField.css" type="text/css">
        <link rel="stylesheet" href="./bootstrap/circle.css">


        <script src="./bootstrap/libs/jquery.livequery.min.js"></script>
        <script src="./bootstrap/libs/jquery.timers.js"></script>
        <script src="./bootstrap/libs/platform.js"></script>
        <script src="./bootstrap/libs/date.js"></script>
        <script src="./bootstrap/libs/i18nJs.js"></script>
        <script src="./bootstrap/libs/dateField/jquery.dateField.js"></script>
        <script src="./bootstrap/libs/JST/jquery.JST.js"></script>

        <link rel="stylesheet" type="text/css" href="./bootstrap/libs/jquery.svg.css">
        <script type="text/javascript" src="./bootstrap/libs/jquery.svg.min.js"></script>

        <!--In case of jquery 1.7-->
        <!--<script type="text/javascript" src="libs/jquery.svgdom.pack.js"></script>-->

        <!--In case of jquery 1.8-->
        <script type="text/javascript" src="./bootstrap/libs/jquery.svgdom.1.8.js"></script>





    </head>
    <body>
        <%
            int[] arr = RecommedationDAO.retrievexfs();
            int xf1 = arr[0];
            int xf2 = arr[1];
            int xf3 = arr[2];
            int xf4 = arr[3];
            int xf5 = arr[4];
        %>
        <section id="main-content">
            <section class="wrapper">
                <div class="row">
                    <div class="col-md-3">
                        <div class="mini-stat clearfix">
                            <span class="mini-stat-icon orange"><i class="fa fa-gavel"></i></span>
                            <div class="mini-stat-info">
                                <span>51</span>
                                Days Deployed
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="mini-stat clearfix">
                            <span class="mini-stat-icon tar"><i class="fa fa-tag"></i></span>
                            <div class="mini-stat-info">
                                <span><%=xf1%></span>
                                Real Users
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="mini-stat clearfix">
                            <span class="mini-stat-icon pink"><i class="fa fa-money"></i></span>
                            <div class="mini-stat-info">
                                <span><%=xf2%></span>
                                On-going Projects
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="mini-stat clearfix">
                            <span class="mini-stat-icon green"><i class="fa fa-eye"></i></span>
                            <div class="mini-stat-info">
                                <span><%=xf3%></span>
                                Recommendations
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                  <!--  <div class="col-sm-6">
                        <section class="panel">
                            <header class="panel-heading">
                                Total Recommendation vs First Choice 
                                <span class="tools pull-right">
                                    <a href="javascript:;" class="fa fa-chevron-down"></a>
                                    <a href="javascript:;" class="fa fa-cog"></a>
                                    <a href="javascript:;" class="fa fa-times"></a>
                                </span>
                            </header>
                            <div class="panel-body">


                                <div class="chartJS" style="height: 262px;">
                                    


                                    <canvas id="firstChoice" height =262px" width="400"></canvas>

                                </div>

                            </div>
                        </section>
                    </div> -->

                    <div class="col-sm-6">

                        <section class="panel">
                            <header class="panel-heading">
                                Total % Recommendation as First Choice (Total: <%=xf4%> as first Choice)
                                <span class="tools pull-right">
                                    <a href="javascript:;" class="fa fa-chevron-down"></a>
                                    <a href="javascript:;" class="fa fa-cog"></a>
                                    <a href="javascript:;" class="fa fa-times"></a>
                                </span>
                            </header>
                            <div class="panel-body">
                                <div class="c100 p25 red big" style="align:center;">

                                    <span><%=xf5%>%</span>

                                    <div class="slice">

                                        <div class="bar"></div>

                                        <div class="fill"></div>

                                    </div>

                                </div>

                            </div>



                    </div>
            </section>
        </div>
    </div>
</section>
</section>



<script>
    // bar chart data
    var barData = {
        labels: ["December 15", "January 16", "February 16"],
        datasets: [
            {
                fillColor: "#48A497",
                strokeColor: "#48A4D1",
                data: [10, 20, 30],
                label: 'Total'

            },
            {
                fillColor: "rgba(73,188,170,0.4)",
                strokeColor: "rgba(72,174,209,0.4)",
                data: [5, 13, 26],
                label: 'Frist Choice'
            }
        ]
    }
    // get bar chart canvas
    var income = document.getElementById("firstChoice").getContext("2d");
    // draw bar chart
    var incomeChart = new Chart(income).Bar(barData)
    legend(document.getElementById("firstChoiceLegend"), barData, incomeChart);
</script>


</body>
</html>
