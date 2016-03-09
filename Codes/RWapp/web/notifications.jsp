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
                                <h3 class="prf-border-head">Viewing All Your Notifications</h3>
         <%NotificationDAO notifDAO = new NotificationDAO();
         ArrayList<Notification> notiList = notifDAO.retrieveAllFromUser(username);
         out.println("<table class='table table-hover general-table'>");
         for (Notification noti : notiList){
             out.println("<tr>");
             out.println("<td>");
                out.println("<a href=\""+ noti.toLink() + "\"> " + noti.toString() +"</a>");
                             out.println("</td>");
                            
             out.println("<td>");
             if(noti.getStatus().equals("T")){
             out.println("<form action=\"processReadNotif\" method=\"get\">");
             out.println("<input type=\"hidden\" name=\"defectid\" value=\""+ noti.getId()+"\">");
             out.println("<button class='btn btn-round btn-primary btn-sm' type=\"submit\" name=\"markas\" value=\"unread\">Mark As Unread</button>");
             out.println("</form>");             
             }else{
             out.println("<form action=\"processReadNotif\" method=\"get\">");
                          out.println("<input type=\"hidden\" name=\"defectid\" value=\""+ noti.getId()+"\">");

             out.println("<button class='btn btn-round btn-primary btn-sm' type=\"submit\" name=\"markas\" value=\"read\">Mark As Read</button>");
             
            out.println("</form>");
             }
             out.println("</td>");
             out.println("</tr>");
            
         }
  
    
         out.println("</table>");
    
%>
                            </div>
                        </section>
                    </div>
                </div>
            </section>
            </section>
</html>
