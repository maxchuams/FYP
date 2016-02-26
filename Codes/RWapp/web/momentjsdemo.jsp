<%-- 
    Document   : momentjsdemo
    Created on : Feb 26, 2016, 4:43:33 AM
    Author     : KIANLAM
--%>

<%@page import="src.model.CronDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Humanize Time Demo</title>
        
        
        
        
        
        <!--Copy Paste Part 1: Inside the header-->
        <!--Moment JS Demo-->
        <script src="js/moment.js"></script>
        <script>
            moment().format();
        </script>
          <!--End of Copy Paste Part 1-->
         
          
          
    </head>
    <body>
        <h1>Cron Job Update</h1>
        

        
        
        <!--Copy Paste Part 2: Any part you want to show time. Inside <body>-->
        <script>
            var m = moment("<%=CronDAO.retrieveTime()%>");
            document.write('Last Sync: '+m.fromNow());
        </script>
        <!--End of Copy Paste Part 2-->
        

        
    </body>
</html>
