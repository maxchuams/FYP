<%-- 
    Document   : login
    Created on : Oct 30, 2015, 1:56:50 AM
    Author     : calvin
--%>

<%@page import="src.model.Person"%>
<html lang="en">
<head>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="images/favicon.png">

    <title>Login</title>

    <!--Core CSS -->
    <link href="bootstrap/html/bs3/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/html/css/bootstrap-reset.css" rel="stylesheet">
    <link href="bootstrap/html/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="bootstrap/html/css/style.css" rel="stylesheet">
    <link href="bootstrap/html/css/style-responsive.css" rel="stylesheet" />

</head>
<%
    
    
// check if user is authenticated

    Person dev = (Person) session.getAttribute("loggedInDev");
    Person desg = (Person) session.getAttribute("loggedInDesg");
    Person pm = (Person) session.getAttribute("loggedInPm");
    Person sudo = (Person) session.getAttribute("loggedInSudo");
    Person tester = (Person) session.getAttribute("loggedInTester");

    
    if (pm != null || dev != null || desg != null) {
        response.sendRedirect("index.jsp");
        return;
    }else if(sudo !=null){
        response.sendRedirect("sudo.jsp");
        return;
    }

    String errorMsg = (String) request.getAttribute("errorMsg");
    if (errorMsg == null) {
        errorMsg = "";
    }

  
%>
  <body class="login-body">

    <div class="container">

      <form class="form-signin" action="ValidateUser" method="POST">
          <h2 class="form-signin-heading"><font face="Brush Script MT" size="8">R</font><span style="text-transform:lowercase"><font face="Brush Script MT" size="8">ecco</font></span></h2>
        <div class="login-wrap">
            <div class="user-login-info">
                <input type="text" name="username" class="form-control" placeholder="User ID" autofocus required>
                <input type="password" name="password" class="form-control" placeholder="Password" required>
                <div class="text-danger"><%=errorMsg%></div>
            </div>
            <button class="btn btn-lg btn-login btn-block" type="submit">Sign in</button>
        </div>
      </form>
    </div>



    <!-- Placed js at the end of the document so the pages load faster -->

    <!--Core js-->
    <script src="bootstrap/html/js/jquery.js"></script>
    <script src="bootstrap/html/bs3/js/bootstrap.min.js"></script>

  </body>
</html>