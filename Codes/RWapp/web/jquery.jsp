<%-- 
    Document   : notifications
    Created on : Mar 6, 2016, 11:16:45 PM
    Author     : Kesmeen Tan
--%>

<%@page import="src.model.Notification"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
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
            notifs = notifDAO.retrieveAllFromUser(username, "Yes", "");

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
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    SimpleDateFormat toPrint = new SimpleDateFormat("dd MMM yyyy 'at' HH:mma");
    out.println("<div id =\"part2\">");

    for (int i = 0; i < notifs.size(); i++) {
        Notification notification = notifs.get(i);
        String status = notification.getStatus();
        if (i < 3) {     
            //onClick="window.location.href = 'notifications.jsp'"
            out.println("<li>");
            out.println("<a style='color:#000000' href=' processReadNotif?notifid=" + notification.getId() +"&markas=readandshowit'>");
            if (status.equals("F")) {
                out.println("<div class=\"alert alert-danger clearfix\" style = \"width:280px ; background:#1fb5ad ; color: #000000 ; height:85px\">");
                out.println("<div class=\"noti-info\" style='color:#fcfcfc'>");
                out.println(notification.toString());
                out.println(toPrint.format(dateFormat.parse(notification.getDatetime())));
                out.println("</div");
            } else {
                out.println("<div class=\"alert alert-success clearfix\" style = \"width:280px ; background:#EDF5ED ; height:85px\">");
                out.println("<div class=\"noti-info\">");
                out.println(notification.toString());
                out.println(dateFormat.parse(notification.getDatetime()));
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

