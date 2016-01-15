<%@page import="src.model.Person"%>
<%
    Person pm = (Person) session.getAttribute("loggedInPm");
    Person dev = (Person) session.getAttribute("loggedInDev");
    Person sudo = null;
    Person desg = null;
    if ( pm == null && dev == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
