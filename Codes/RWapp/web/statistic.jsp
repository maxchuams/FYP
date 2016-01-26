<%-- 
    Document   : statistic.jsp
    Created on : Jan 25, 2016, 9:32:25 PM
    Author     : KIANLAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">


    <head>
        <title>View Developer Statistic Page</title>

        <meta charset="utf-8" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
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
        <h1 align="center"><b>Developer Statistic Page</b></h1>

        <div class="panel-body profile-information">

            <div class="profile-pic text-center">
                <img src="ImageServlet?imageid=kaiwen12" align="center"/>
                <h2>Name: <font color='Green'>Tan Kai Wen</font></h2>
                <h2>Role: <font color='Green'>Developer</font></h2>

            </div>
        </div >

        <div align="center">
            <h4><b>Developer Statistic</b></h4>
            <!-- Radar Chart -->
            <canvas id="radarChart" width="600" height="400"></canvas>
            <div id="radarLegend"></div>
            <br><br>
            <h4><b>Developer's Timeliness for Past 6 Months</b></h4>
            <!-- line chart canvas element -->
            <canvas id="buyers" width="600" height="400" ></canvas>
            <div id="buyerLegend"></div>
            <br><br>
            <h4><b>Developer Experience by Type</b></h4>
            <!-- pie chart canvas element -->
            <canvas id="countries" width="600" height="400"></canvas>
            <div id="countriesLegend"></div>
            <br><br>
            <h4><b>Load Factor Comparison</b></h4>
            <!-- bar chart canvas element -->
            <canvas id="income" width="600" height="400"></canvas>
            <div id="incomeLegend"></div>
            <br><br>

        </div>


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

            // pie chart data
            var pieData = [
                {
                    value: 20,
                    color: "#878BB6",
                    label: 'Wordpress'
                },
                {
                    value: 40,
                    color: "#4ACAB4",
                    label: 'E-commerce'
                },
                {
                    value: 10,
                    color: "#FF8153",
                    label: 'Customized'
                },
                {
                    value: 30,
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
            var countries = document.getElementById("countries").getContext("2d");
            // draw pie chart
            var pieChart = new Chart(countries).Pie(pieData, pieOptions);


            legend(document.getElementById("countriesLegend"), pieData, pieChart);


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


            var radarChartData = {
                labels: ["Timeliness Factor", "Defects Factor", "Timeliness Factor", "Quality Factor", "Project Manamgement", "Load Factor"],
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

<br/>

        <!-- Web2PDF Converter Button BEGIN -->
        
        <script type="text/javascript">
            var
                    pdfbuttonlabel = "Save As PDF"
        </script>
        <div id='pdfbuttonlabel' align='center'>
        <script src="http://www.web2pdfconvert.com/pdfbutton2.js" id="Web2PDF" type="text/javascript" ></script>
        <!-- Web2PDF Converter Button END -->
        
            
        </div>
    </body>

</html>



