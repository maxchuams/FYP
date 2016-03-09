<%-- 
    Document   : notifications
    Created on : Mar 6, 2016, 11:16:45 PM
    Author     : Kesmeen Tan
--%>

<%@page import="src.model.Notification"%>
<%@page import="src.model.NotificationDAO"%>
<%@page import="src.model.ConnectionManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="protect.jsp" %>
<div id ="part1">
    <head>
    <script src="js/moment.js"></script>
    <script>
        moment().format();
    </script>
    </head>
    <%    ArrayList<Notification> notifs = new ArrayList<Notification>();
        String username = "";

        try {
            if (dev != null) {
                username = dev.getUsername();
            } else if (pm != null) {
                username = pm.getUsername();
            } else if (tester != null) {
                username = tester.getUsername();
            } else if (sudo != null) {
                username = sudo.getUsername();
            } else {
                username = desg.getUsername();
            }

            NotificationDAO notifDAO = new NotificationDAO();
            notifs = notifDAO.retrieveAllFromUser(username);

        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
        }

        String notif1 = "";
        String notif2 = "";
        String notif3 = "";
        String link1 = "";
        String link2 = "";
        String link3 = "";

        int fcounter = 0;
        for (int i = 0; i < notifs.size(); i++) {
            if (notifs.get(i).getStatus().equals("F")) {
                fcounter++;
            }
            if (i == 0) {
                notif1 = notifs.get(i).toString();
                link1 = notifs.get(i).toLink();
            } else if (i == 1) {
                notif2 = notifs.get(i).toString();
                link2 = notifs.get(i).toLink();
            } else if (i == 2) {
                notif3 = notifs.get(i).toString();
                link3 = notifs.get(i).toLink();
            }
        }
        if (fcounter != 0) {
        	out.println("<span class=\"badge bg-warning\">");
            out.println(fcounter);
			out.println("</span>");
        }
    %>

</div>

<%
    out.println("<div id =\"part2\">");

    for (int i = 0; i < notifs.size(); i++) {
        Notification notification = notifs.get(i);
        String status = notification.getStatus();
        String dateTime = notification.getDatetime();
        if (i < 5) {
            out.println("<li>");
            out.println("<a style='color:#000000' href='" + notification.toLink() + "'>");
            if (status.equals("F")) {
                out.println("<div class=\"alert alert-danger clearfix\" style = \"width:280px ; background:#1fb5ad ; color: #fcfcfc ; height:100px\">");
                out.println("<div class=\"noti-info\" style='color:#fcfcfc'>");
                out.println(notification.toString());
                out.println("</div");
            } else {
                out.println("<div class=\"alert alert-success clearfix\" style = \"width:280px ; color:black ; height:100px\">");
                out.println("<div class=\"noti-info\">");
                out.println(notification.toString());
                out.println("</div");
            }
            out.println("</div>");
            out.println("</a>");
            out.println("</li>");
        }
    }
    out.println("</div>");
%>

</html>

