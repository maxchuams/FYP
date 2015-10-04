<%@page import="src.model.Person"%>
<%
    Person sudo = (Person) session.getAttribute("loggedInSudo");
    
    if ( sudo == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
