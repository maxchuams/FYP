<%-- 
    Document   : viewDefectInfo
    Created on : Jan 15, 2016, 1:12:03 PM
    Author     : Kaiwen
--%>
<%@page import="src.model.Project"%>
<%@page import="src.model.ProjectDAO"%>
<%@page import="src.model.DefectScreenshotDAO"%>
<%@page import="src.model.Defect"%>
<%@page import="src.model.DefectDAO"%>
<%@page import="java.util.ArrayList"%>
<%@include file="protectPMandDev.jsp" %>
<%String thisPage = "manageDefects"; //This is to change the highlight in Navigation Bar%>
<%String selected = null;%>
<%@include file="navbar.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/themes/smoothness/jquery-ui.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>
<link href="./bootstrap/fbphotobox.css" rel="stylesheet" type="text/css" />
<script src="./bootstrap/fbphotobox.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        
        <%--- JS ----%>
            <script>
	$(document).ready(function() {
		$(".fbphotobox img").fbPhotoBox({
			rightWidth: 360,
			leftBgColor: "black",
			rightBgColor: "white",
			footerBgColor: "black",
			overlayBgColor: "#222",
			containerClassName: 'fbphotobox',
			imageClassName: 'photo',
			onImageShow: function() {
				$(".fbphotobox img").fbPhotoBox("addTags",
						[{x:0.3,y:0.3,w:0.3,h:0.3}]
				);
				$(".fbphotobox-image-content").html('<div style="font-size:16px;">'+$(this).attr("alt")+'</div>'+$(this).attr("src"));
			}
		});
		
		$("button").click(function() {
			$( ".fbphotobox" ).append('<img class="photo" fbphotobox-src="./images/dummy-1760x990-Mosque.jpg" src="./images/dummy-1760x990-Mosque.jpg"/><img class="photo" fbphotobox-src="./images/dummy-1920x2560-Goemetry.jpg" src="./images/dummy-1920x2560-Goemetry.jpg"/>');
		});
	});
</script>
<style>
	body {
		font-family: 'lucida grande', tahoma, verdana, arial, sans-serif;
		font-size: 13px;
		position: relative;
	}
	
	.fbphotobox img {
		width:200px;
		height:200px;
		margin:10px;
		border-radius:5px;
	}
	
	.fbphotobox img:hover {
		box-sizing:border-box;
		  -moz-box-sizing:border-box;
		  -webkit-box-sizing:border-box;
		border: 5px solid #4AE;
	}
</style>
        <%--- JS ----%>
        <%
            String defectId = request.getParameter("defectId");
            Defect d = DefectDAO.retrieveDefect(Integer.parseInt(defectId));
        %>
        <section id="main-content">
            <section class="wrapper">
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <header class="panel-heading">Viewing: Defect <%=d.getDefectName()%></header>
                            <div class="panel-body">
                                <table class="table  table-hover general-table">
                                    <thead><tr><td>Defect status</td><td><%if (d.getIsComplete() == 0) {out.println("<span class='label label-danger label-mini'>Defect is incomplete</span>");
                                    }else if(d.getIsComplete()==1){out.println("<span class='label label-warning label-mini'>Defect is done, please check and then mark complete</span>");
                            }else if(d.getIsComplete()==2){out.println("<span class='label label-success label-mini'>Defect has been fixed</span>");} %></td></tr>
                                    <tr><td>Defect severity</td><td><% int sevInt = d.getSeverity(); if(sevInt==1){out.println("Low");} else if(sevInt==2){out.println("Medium");} else if(sevInt==3){out.println("High");} %></td></tr><thead>
                                    <tr><td>Defect description</td><td><%=d.getDesc()%></td></tr>
                                    <tr>
                                        <td>Reported by</td>
                                        <td><%=d.getReportedBy()%></td>
                                    </tr>
                                    <tr>
                                        <td>Last updated time</td>
                                        <td><% out.println(d.getUpdateTime().subSequence(0, 16)); %></td>
                                    </tr>
                                    <tr>
                                        <td>Screenshots uploaded</td>
                                        <% int size = DefectScreenshotDAO.getScreenshotTimestamp("" + d.getId()).size(); %>
                                        <td><%if (size == 0) {%>NIL
                                            <%} else {%>
                                            <div class="fbphotobox">
		<a><img style="height:75px;width:75px" class="photo" fbphotobox-src="DefectScreenshotServlet?defectid=2&updatetime=2016-01-05 13:37:22" src="DefectScreenshotServlet?defectid=2&updatetime=2016-01-05 13:37:22"/></a>
                <a><img style="height:75px;width:75px" class="photo" fbphotobox-src="DefectScreenshotServlet?defectid=2&updatetime=2016-01-05 13:37:22" src="DefectScreenshotServlet?defectid=2&updatetime=2016-01-05 13:37:55"/></a>
		<a><img style="height:75px;width:75px" class="photo" fbphotobox-src="DefectScreenshotServlet?defectid=2&updatetime=2016-01-05 13:37:22" src="DefectScreenshotServlet?defectid=2&updatetime=2016-01-05 13:41:51"/></a>
	</div>
                                            <%}%></a></td>
                                    </tr>
                                </table>
                            </div>
                        </section>
                    </div>
                </div>
            </section>
        </section>
    </body>
</html>
