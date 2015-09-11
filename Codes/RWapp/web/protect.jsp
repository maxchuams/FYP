<%@page import="src.model.Person"%>
<%

    Person p = (Person) session.getAttribute("loggedInDev");
    Person d = (Person) session.getAttribute("loggedInPm");
    Person desg = (Person) session.getAttribute("loggedInDesg");
    if (p == null && d == null && desg == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
