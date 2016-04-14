<%-- 
    Document   : error505
    Created on : Apr 14, 2016, 10:31:20 AM
    Author     : maxchua
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
 
<% response.setStatus(500); %>
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
    </head>
    <body class="body-500">

    <div class="error-head"> </div>

    <div class="container ">

      <section class="error-wrapper text-center">
          <h1><img src="bootstrap/html/images/500.png" alt=""></h1>
          <div class="error-desk">
              <h2>OOOPS!!!</h2>
              <p class="nrml-txt-alt">Something went wrong.</p>
              <p>Why not try refreshing you page? Or please wait a moment.</p>
              <p>A possible issue could be that Trello's services are not available right now.</p>
          </div>
          <a href="index.jsp" class="back-btn"><i class="fa fa-home"></i> Back To Home</a>
      </section>

    </div>


  </body>
</html>
