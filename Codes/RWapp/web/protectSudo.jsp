<%@page import="src.model.Person"%>
<%
    Person sudo = (Person) session.getAttribute("loggedInSudo");
    Person pm = null;
    Person desg = null;
    Person dev = null;
    Person tester= null;
            
    if ( sudo == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
