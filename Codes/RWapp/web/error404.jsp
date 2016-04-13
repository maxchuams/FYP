<%-- 
    Document   : error404
    Created on : Apr 13, 2016, 6:31:54 PM
    Author     : Kaiwen
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
 
<% response.setStatus(404); %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
 "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Bootstrap core CSS -->
    <link href="bootstrap/html/bs3/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/html/bs3/css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="bootstrap/html/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="bootstrap/html/css/style.css" rel="stylesheet">
    <link href="bootstrap/html/css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    </head>
    <body class="body-404">

    <div class="error-head"> </div>

    <div class="container ">

      <section class="error-wrapper text-center">
          <h1><img src="bootstrap/html/images/404.png" alt=""></h1>
          <div class="error-desk">
              <h2>page not found</h2>
              <p class="nrml-txt">We Couldn’t Find This Page</p>
          </div>
          <a href="index.jsp" class="back-btn"><i class="fa fa-home"></i> Back To Home</a>
      </section>

    </div>


  </body>
</html>
