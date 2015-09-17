<%@page import="src.model.Person"%>
<%

    Person dev = (Person) session.getAttribute("loggedInDev");
    
    if (dev == null ) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
