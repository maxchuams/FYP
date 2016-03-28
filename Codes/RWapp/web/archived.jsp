<%-- 
    Document   : archived
    Created on : Mar 28, 2016, 12:49:14 PM
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
<%String thisPage = "index"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>

<html>
    <%
        username = "";
        url = "";
        if (dev != null) {
            username = dev.getUsername();
            url = "manageDevProfile.jsp";
        } else if (pm != null) {
            username = pm.getUsername();
            url = "managePmProfile.jsp";
        } else if (tester != null) {
            username = tester.getUsername();
            url = "manageTesterProfile.jsp";
        } else if (sudo != null) {
            username = sudo.getUsername();
            url = "manageSudoProfile.jsp";
        } else {
            username = desg.getUsername();
            url = "manageDesgProfile.jsp";
    }%>

    <section id="main-content">
        <section class="wrapper">
            <div class="row">
                <div class="col-md-12">
                    <section class="panel">
                        <div class="panel-body">
                            <h3 class="prf-border-head">Archived Notifications</h3>
                            <h2><a href = "notifications.jsp">Go To Notifications</a></h2>

                            <%NotificationDAO notifDAO = new NotificationDAO();
                                ArrayList<Notification> notiList = notifDAO.retrieveAllArchivedFromUser(username);
                                if (notiList.size() != 0) {
                                    out.println("<table class='table table-hover general-table'>");
                                    for (Notification noti : notiList) {
                                        out.println("<tr>");
                                        out.println("<td>");
                                        out.println("<a href=\"" + noti.toLink() + "\"> " + noti.toString() + "</a>");
                                        out.println("</td>");
                                        out.println("</td>");
                                        out.println("<td>");
                                            out.println("<form action=\"processArchiveNotif\" method=\"get\">");
                                            out.println("<input type=\"hidden\" name=\"notifid\" value=\"" + noti.getId() + "\">");
                                            out.println("<button class='btn btn-round btn-default btn-sm' type=\"submit\" name=\"markas\" value=\"unarchive\">Unarchive Notification</button>");
                                            out.println("</form>");
                                        
                                        out.println("</td>");
                                        out.println("</tr>");

                                    }

                                    out.println("</table>");
                                } else {
                                    out.println("You have no archived notifications");
                                }
                            %>
                        </div>
                    </section>
                </div>
            </div>
        </section>
    </section>
</html>
