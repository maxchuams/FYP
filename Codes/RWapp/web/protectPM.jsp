<%@page import="src.model.Person"%>
<%
    Person pm = (Person) session.getAttribute("loggedInPm");
    Person sudo = null;
    Person dev = null;
    Person desg = null;
    Person tester = null;
    if ( pm == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
