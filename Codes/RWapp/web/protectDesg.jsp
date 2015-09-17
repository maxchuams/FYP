<%@page import="src.model.Person"%>
<%

 
    Person desg = (Person) session.getAttribute("loggedInDesg");
    if (desg == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
