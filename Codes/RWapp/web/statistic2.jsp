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
            .container {
                width: 80%;
                margin: 20px auto;
            }

            .p {
                text-align: center;
                font-size: 14px;
                padding-top: 140px;
            }

        </style>








    </head>
    <body>

        <div class="container">
            <h2>Chart.js Responsive Bar Chart Demo</h2>
            <div>
                <canvas id="canvas"></canvas>
            </div>

            <script>
                var dData = function () {
                    return Math.round(Math.random() * 90) + 10
                };

                var barChartData = {
                    labels: ["dD 1", "dD 2", "dD 3", "dD 4", "dD 5", "dD 6", "dD 7", "dD 8", "dD 9", "dD 10"],
                    datasets: [{
                            fillColor: "rgba(0,60,100,1)",
                            strokeColor: "black",
                            data: [dData(), dData(), dData(), dData(), dData(), dData(), dData(), dData(), dData(), dData()]
                        }]
                }

                var index = 11;
                var ctx = document.getElementById("canvas").getContext("2d");
                var barChartDemo = new Chart(ctx).Bar(barChartData, {
                    responsive: true,
                    barValueSpacing: 2
                });
                setInterval(function () {
                    barChartDemo.removeData();
                    barChartDemo.addData([dData()], "dD " + index);
                    index++;
                }, 3000);



            </script>


        </div>








    </body>

</html>



