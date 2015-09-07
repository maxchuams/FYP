<%@page import="src.model.Person"%>
<%

    Person p = (Person) session.getAttribute("LoggedInUser");
    if (p == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
