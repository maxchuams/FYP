<%@page import="org.joda.time.DateTime"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="src.model.ProjectAllocationDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="src.model.ChartJSDAO"%>
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
        <script src="js/moment.js"></script>
        <script> moment().format();</script>
        <meta charset="utf-8" />
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

            #fork {
                position: absolute;
                top: 0;
                right: 0;
                border: 0;
            }

            .legend {
                width: 16em;
                
            }

            .legend .title {
                display: block;
                margin-bottom: 0.5em;
                line-height: 1.2em;
                padding: 0 1em;
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

    <%
        String err = (String) request.getAttribute("err");
        String sucess = (String) request.getAttribute("sucess");
        String devusername = request.getParameter("devusername");
        String yearstr = request.getParameter("year");
        int year = 0;

        if (yearstr != null) {
            year = Integer.parseInt(yearstr);
        } else {
            year = new DateTime().getYear();
        }

        ArrayList<String> errorList = (ArrayList<String>) request.getAttribute("errList");
        ArrayList<String> getNumberAllocated = ProjectAllocationDAO.retrieveDevInProgress(devusername);
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
                                   
                                <span class="pull-right">
                                    <div class="dropdown">
                                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Year
                                        <span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                        
                                        <% int thisyear = new DateTime().getYear(); %>
                                        
                                        <li><a href="statdemo.jsp?devusername=<%=devusername%>&year=<%=thisyear%>"><%=thisyear%></a></li>
                                        <li><a href="statdemo.jsp?devusername=<%=devusername%>&year=<%=thisyear-1%>"><%=thisyear-1%></a></li>
                                        <li><a href="statdemo.jsp?devusername=<%=devusername%>&year=<%=thisyear-2%>"><%=thisyear-2%></a></li>
                                    </ul>
                                    <button type="button" class="btn btn-info" onClick="window.print()"><i class="fa fa-print"></i> Print</button>
                                </div>
                                    
                                    
                                </span>

                                <div class="profile-desk">
                                    <h1><%=devusername%></h1>
                                    <span class="text-muted">Developer</span><br/>
                                    <p>
                                        <%
                                            DateFormat dateFormat = new SimpleDateFormat("yyyy");
                                            Date todayDate = new Date();
                                            SimpleDateFormat toPrint = new SimpleDateFormat("yyyy");

                                            ArrayList<String> devProjThisYear = ProjectAllocationDAO.retrieveByAllocattionByYear(Integer.parseInt(toPrint.format(todayDate)), devusername);%>

                                        Worked on <b><%=devProjThisYear.size()%></b> project(s) this year<br/>
                                        Currently working on <b><%=getNumberAllocated.size()%> </b>project(s)
                                    </p>
                                </div>
                                     Displaying results for year <b><%=year%></b>
                                

                            </div>
                        </div>
                    </section>
                </div>
            </div>

            <div class="row">
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

                                <canvas id="timeliness" height="300" width="920"></canvas>


                            </div>

                            <div id="timelinessLegend"></div>
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
                                <canvas id="load" width="920" height="200"></canvas>
                            </div>
                            <div id="loadLegend"></div>

                        </div>
                    </section>
                </div>

            </div>





            <!-- page end-->
        </section>
    </section>
    <!--main content end-->





    <%

        ArrayList<String> monthList = ChartJSDAO.getSixMonth();
        ArrayList<Double> devTimeList = new ArrayList<Double>();
        ArrayList<Double> rwTimeList = new ArrayList<Double>();

        HashMap<String, Double> devmap = ChartJSDAO.getTimelinessDev(devusername, year);
        HashMap<String, Double> rwmap = ChartJSDAO.getTimelinessRW(year);

        for (String i : monthList) {
            Double timelinessdev = devmap.get(i);
            Double timelinessrw = rwmap.get(i);
            if (timelinessdev == null) {
                timelinessdev = 0.0;
            }
            if (timelinessrw == null) {
                timelinessrw = 0.0;
            }
            devTimeList.add(timelinessdev);
            rwTimeList.add(timelinessrw);
        }
        //Gson gson = new GsonBuilder().setPrettyPrinting().create();
        Gson gson = new Gson();
        String months = gson.toJson(monthList);
        String timelinessDev = gson.toJson(devTimeList);
        String timelinessRW = gson.toJson(rwTimeList);


    %>
    <script>
        // line chart data


        var timeData = {
            labels: <%=months%>,
            datasets: [
                {
                    label: "RippleWerkz",
                    fillColor: "rgba(220,220,220,0.2)",
                    strokeColor: "rgba(220,220,220,1)",
                    pointColor: "rgba(220,220,220,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(220,220,220,1)",
                    data: <%=timelinessRW%>
                },
                {
                    label: "<%=devusername%>",
                    fillColor: "rgba(151,187,205,0.2)",
                    strokeColor: "rgba(151,187,205,1)",
                    pointColor: "rgba(151,187,205,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(151,187,205,1)",
                    data: <%=timelinessDev%>
                }
            ]
        }
        // get line chart canvas
        var timec = document.getElementById('timeliness').getContext('2d');
        // draw line chart
        var timechart = new Chart(timec).Line(timeData);
        legend(document.getElementById('timelinessLegend'), timeData, timechart);

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

                var responsePIE = jQuery.parseJSON(JSON.stringify(response));
                var pieOptions = {
                    segmentShowStroke: false, animateScale: true
                }
                var exppie = document.getElementById("exppie").getContext("2d")
                var pieChart = new Chart(exppie).Pie(responsePIE, pieOptions);
                legend(document.getElementById("exppieLegend"), responsePIE, pieChart);
            },
            error: function (response) {
                alert('Error while request..');
            }});
    </script>
    <!-- End of pie Chart for experience -->











    <!--
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
    -->













    <%

        ArrayList<Double> devloadList = new ArrayList<Double>();
        ArrayList<Double> rwloadList = new ArrayList<Double>();

        HashMap<String, Double> devloadmap = ChartJSDAO.getLoadDev(devusername, year);
        HashMap<String, Double> rwloadmap = ChartJSDAO.getLoadRW(year);

        for (String i : monthList) {
            Double loaddev = devloadmap.get(i);
            Double loadrw = rwloadmap.get(i);
            if (loaddev == null) {
                loaddev = 0.0;
            }
            if (loadrw == null) {
                loadrw = 0.0;
            }
            devloadList.add(loaddev);
            rwloadList.add(loadrw);
        }

        String loadDev = gson.toJson(devloadList);
        String loadRW = gson.toJson(rwloadList);


    %>


    <script>


        // bar chart data
        var loadData = {
            labels: <%=months%>,
            datasets: [
                {
                    fillColor: "#48A497",
                    strokeColor: "#48A4D1",
                    data: <%=loadDev%>,
                    label: '<%=devusername%>'

                },
                {
                    fillColor: "rgba(73,188,170,0.4)",
                    strokeColor: "rgba(72,174,209,0.4)",
                    data: <%=loadRW%>,
                    label: 'Ripplwerkz Standard'
                }
            ]
        }
        // get bar chart canvas
        var load = document.getElementById("load").getContext("2d");
        // draw bar chart
        var loadChart = new Chart(load).Bar(loadData)
        legend(document.getElementById("loadLegend"), loadData, loadChart);

    </script>















    <%

        String radarDev = gson.toJson(ChartJSDAO.getDevStats(devusername, year));
        String radarRw = gson.toJson(ChartJSDAO.getRWstats(year));


    %>
    <script>

        var radarChartData = {
            labels: ["Timeliness Factor", "Experience Factor", "Skillset", "Quality Factor"],
            datasets: [
                {
                    label: "Ripplewerkz Average",
                    fillColor: "rgba(220,220,220,0.2)",
                    strokeColor: "rgba(220,220,220,1)",
                    pointColor: "rgba(220,220,220,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(220,220,220,1,1)",
                    data: <%=radarDev%>
                },
                {
                    label: "<%=devusername%>",
                    fillColor: "rgba(151,187,205,0.2)",
                    strokeColor: "rgba(151,187,205,1)",
                    pointColor: "rgba(151,187,205,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(151,187,205,1,1)",
                    data: <%=radarRw%>
                }
            ]
        }

        var zainess = document.getElementById("radarChart").getContext("2d")
        var zaiChart = new Chart(zainess).Radar(radarChartData, {
            responsive: false
        })
        legend(document.getElementById("radarLegend"), radarChartData, zaiChart);


    </script>




</html>
