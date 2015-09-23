<%@page import="src.model.Person"%>
<%

    Person dev = (Person) session.getAttribute("loggedInDev");
    Person d = (Person) session.getAttribute("loggedInPm");
    Person desg = (Person) session.getAttribute("loggedInDesg");
    if (dev == null && d == null && desg == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
