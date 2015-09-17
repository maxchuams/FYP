<%@page import="src.model.Person"%>
<%
    Person pm = (Person) session.getAttribute("loggedInPm");
    
    if ( pm == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
