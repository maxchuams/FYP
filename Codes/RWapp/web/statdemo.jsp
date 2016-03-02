<%@page import="java.util.ArrayList"%>
<%@page import="src.model.PersonDAO"%>
<%@page import="src.model.DeveloperDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="protect.jsp"%>
<%String thisPage = "profilePage"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <title>View Developer Statistic Page</title>

        <meta charset="utf-8" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery.print/1.4.0/jQuery.print.min.js"></script>
        <script src="res/chart/Chart.js"></script>
        <script src="res/chart/legend.js"></script>

        <!--Core css that is also in navbar.jsp. to be removed-->
        <link href="bootstrap/html/images/favicon.ico" rel="shortcut icon">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <!--to be removed-->



        <!-- This css is for the legend-->
        <style type="text/css">
            body {
                font-family: Sans-Serif;
            }

            #fork {
                position: absolute;
                top: 0;
                right: 0;
                border: 0;
            }

            .legend {
                width: 10em;
                border: 1px solid black;
            }

            .legend .title {
                display: block;
                margin-bottom: 0.5em;
                line-height: 1.2em;
                padding: 0 0.3em;
            }

            .legend .color-sample {
                display: block;
                float: left;
                width: 1em;
                height: 1em;
                border: 2px solid; /* Comment out if you don't want to show the fillColor */
                border-radius: 0.5em; /* Comment out if you prefer squarish samples */
                margin-right: 0.5em;
            }
        </style>
    </head>
    <body>
        <%  String err = (String) request.getAttribute("err");
            String sucess = (String) request.getAttribute("sucess");
            String devusername = request.getParameter("devusername");
            ArrayList<String> errorList = (ArrayList<String>) request.getAttribute("errList");
        %>
        <!--main content start-->
        <section id="main-content">
            <section class="wrapper">
                <%if (err != null) {%>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="alert alert-block alert-danger fade in">
                                <button data-dismiss="alert" class="close close-sm" type="button">
                                    <i class="fa fa-times"></i>
                                </button>
                                <%=err%>
                            </div>
                        </section>
                    </div>
                </div>
                <%}%>
                <%if (sucess != null) {%>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="alert alert-success fade in">
                                <button data-dismiss="alert" class="close close-sm" type="button">
                                    <i class="fa fa-times"></i>
                                </button>
                                <%=sucess%>
                            </div>
                        </section>
                    </div>
                </div>
                <%}%>
                <!-- page start-->

                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="panel-body profile-information">


                                <div class="col-md-3">
                                    <div class="profile-pic">
                                        <img src="ImageServlet?imageid=<%=devusername%>" alt="" align="center"/>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <h1 ><b>Developer Statistic Page</b></h1>
                                    <h3>Username: <font color='Green'><%=devusername%></font></h3>
                                    <h3>Role: <font color='Green'>Developer</font></h3>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <section class="panel">
                                <header class="panel-heading">
                                    Developer Statistic
                                    <span class="tools pull-right">
                                        <a href="javascript:;" class="fa fa-chevron-down"></a>
                                        <a href="javascript:;" class="fa fa-cog"></a>
                                        <a href="javascript:;" class="fa fa-times"></a>
                                    </span>
                                </header>
                                <div class="panel-body">


                                    <div class="chartJS" style="height:420;">

                                        <canvas id="radarChart" width="400" height="430"></canvas>

                                    </div>
                                    <div id="radarLegend"></div>
                                </div>
                            </section>
                        </div>
                        <div class="col-md-6">
                            <section class="panel">
                                <header class="panel-heading">
                                    Experience by Project Type
                                    <span class="tools pull-right">
                                        <a href="javascript:;" class="fa fa-chevron-down"></a>
                                        <a href="javascript:;" class="fa fa-cog"></a>
                                        <a href="javascript:;" class="fa fa-times"></a>
                                    </span>
                                </header>
                                <div class="panel-body">


                                    <div class="chartJS" style="height: 410;">


                                        <canvas id="exppie" width="400" height="400"></canvas>

                                    </div>
                                    <div id="exppieLegend"></div>

                                </div>
                            </section>
                        </div>
                    </div>


                </div>


                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <header class="panel-heading">
                                Developer's Timeliness for Past 6 Months
                                <span class="tools pull-right">
                                    <a href="javascript:;" class="fa fa-chevron-down"></a>
                                    <a href="javascript:;" class="fa fa-cog"></a>
                                    <a href="javascript:;" class="fa fa-times"></a>
                                </span>
                            </header>
                            <div class="panel-body">


                                <div class="chartJS" style="height: 310;">

                                    <canvas id="buyers" height="300" width="920"></canvas>


                                </div>

                            </div>
                        </section>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <header class="panel-heading">
                                Load Factor Comparison
                                <span class="tools pull-right">
                                    <a href="javascript:;" class="fa fa-chevron-down"></a>
                                    <a href="javascript:;" class="fa fa-cog"></a>
                                    <a href="javascript:;" class="fa fa-times"></a>
                                </span>
                            </header>
                            <div class="panel-body">


                                <div class="chartJS" style="height: 210;">

                                    <canvas id="income" width="920" height="200"></canvas>


                                </div>
                                <div id="incomeLegend"></div>

                            </div>
                        </section>
                    </div>

                </div>

                <!-- page end-->
            </section>
        </section>
        <!--main content end-->


        <script>
            // line chart data
            var buyerData = {
                labels: ["January", "February", "March", "April", "May", "June"],
                datasets: [
                    {
                        fillColor: "rgba(172,194,132,0.4)",
                        strokeColor: "#ACC26D",
                        pointColor: "#fff",
                        pointStrokeColor: "#9DB86D",
                        data: [203, 156, 99, 251, 305, 247]
                    }
                ]
            }
            // get line chart canvas
            var buyers = document.getElementById('buyers').getContext('2d');
            // draw line chart
            new Chart(buyers).Line(buyerData);

        </script>



        <!-- start of pie chart data script -->
        <script type="text/javascript">


            $.ajax({
                type: "GET",
                url: "ChartJSON",
                cache: false,
                data: {
                    devusername: "<%=devusername%>",
                    chart: "exppie"
                },
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    alert(JSON.stringify(response));
                    var responsePIE = jQuery.parseJSON(JSON.stringify(response));
                    var pieOptions = {
                        segmentShowStroke: false,
                        animateScale: true
                    }

                    var exppie = document.getElementById("exppie").getContext("2d")
                    var pieChart = new Chart(exppie).Pie(responsePIE, pieOptions);
                    legend(document.getElementById("exppieLegend"), responsePIE, pieChart);
                    
                    
                },
                error: function (response) {
                    alert('Error while request..');

                }

            });



        </script>


        <script>

            /*
             // pie chart data
             var pieData = [
             {
             value: 0,
             color: "#878BB6",
             label: 'Wordpress'
             },
             {
             value: 0,
             color: "#4ACAB4",
             label: 'E-commerce'
             },
             {
             value: 0,
             color: "#FF8153",
             label: 'Customized'
             },
             {
             value: 0,
             color: "#FFEA88",
             label: 'Android Development'
             }
             ];
             // pie chart options
             var pieOptions = {
             segmentShowStroke: false,
             animateScale: true
             }
             // get pie chart canvas
             var exptype = document.getElementById("exptype").getContext("2d");
             // draw pie chart
             var pieChart = new Chart(exptype).Pie(pieData, pieOptions);
             legend(document.getElementById("exptypeLegend"), pieData, pieChart);
             */

        </script>

        <script>


            // bar chart data
            var barData = {
                labels: ["January", "February", "March", "April", "May", "June"],
                datasets: [
                    {
                        fillColor: "#48A497",
                        strokeColor: "#48A4D1",
                        data: [456, 479, 324, 569, 702, 600],
                        label: 'Tan Kai Wen'

                    },
                    {
                        fillColor: "rgba(73,188,170,0.4)",
                        strokeColor: "rgba(72,174,209,0.4)",
                        data: [364, 504, 605, 400, 345, 320],
                        label: 'Ripplwerkz Standard'
                    }
                ]
            }
            // get bar chart canvas
            var income = document.getElementById("income").getContext("2d");
            // draw bar chart
            var incomeChart = new Chart(income).Bar(barData)
            legend(document.getElementById("incomeLegend"), barData, incomeChart);

        </script>


        <script>

            var radarChartData = {
                labels: ["Team Work", "Defects Factor", "Timeliness Factor", "Quality Factor", "Project Manamgement", "Load Factor"],
                datasets: [
                    {
                        label: "Developer Tan Kai Wen",
                        fillColor: "rgba(220,220,220,0.2)",
                        strokeColor: "rgba(220,220,220,1)",
                        pointColor: "rgba(220,220,220,1)",
                        pointStrokeColor: "#fff",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(220,220,220,1)",
                        data: [65, 59, 90, 81, 56, 55]
                    },
                    {
                        label: "Developer Kian Lam",
                        fillColor: "rgba(151,187,205,0.2)",
                        strokeColor: "rgba(151,187,205,1)",
                        pointColor: "rgba(151,187,205,1)",
                        pointStrokeColor: "#fff",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(151,187,205,1)",
                        data: [28, 48, 40, 19, 96, 27]
                    }
                ]
            }

            var zainess = document.getElementById("radarChart").getContext("2d")
            var zaiChart = new Chart(zainess).Radar(radarChartData, {
                responsive: false
            })
            legend(document.getElementById("radarLegend"), radarChartData, zaiChart);


        </script>



    </body>
</html>
