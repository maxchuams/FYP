<%@page import="src.model.Person"%>
<%
    Person tester = (Person) session.getAttribute("loggedInTester");
    Person sudo = null;
    Person dev = null;
    Person desg = null;
    Person pm = null;
    if ( tester == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
