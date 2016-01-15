<%@page import="src.model.Person"%>
<%
    Person pm = (Person) session.getAttribute("loggedInPm");
    Person tester = (Person) session.getAttribute("loggedInTester");
    Person sudo = null;
    Person dev = null;
    Person desg = null;
    if ( pm == null && tester == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
