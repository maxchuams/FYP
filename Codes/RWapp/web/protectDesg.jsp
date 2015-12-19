<%@page import="src.model.Person"%>
<%

     Person desg = (Person) session.getAttribute("loggedInDesg");
     Person pm = null;
     Person dev = null;
     Person sudo = null;
     
    if (desg == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
