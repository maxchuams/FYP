<%@page import="src.model.Person"%>
<%

     Person tester = (Person) session.getAttribute("loggedInTester");
     Person pm = null;
     Person dev = null;
     Person sudo = null;
    if (tester == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
