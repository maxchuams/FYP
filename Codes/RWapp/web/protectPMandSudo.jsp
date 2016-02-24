<%@page import="src.model.Person"%>
<%
    Person pm = (Person) session.getAttribute("loggedInPm");
    Person sudo = (Person) session.getAttribute("loggedInSudo");

    Person dev = null;
    Person desg = null;
    Person tester = null;
    if ( pm == null && sudo == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
