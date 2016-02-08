<%@page import="src.model.Person"%>
<%

    Person dev = (Person) session.getAttribute("loggedInDev");
    Person desg = null;
    Person pm = null;
    Person sudo = null;
    Person tester = null;
    if (dev == null ) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
