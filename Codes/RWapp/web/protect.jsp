<%@page import="src.model.Person"%>
<%

    Person dev = (Person) session.getAttribute("loggedInDev");
    Person d = (Person) session.getAttribute("loggedInPm");
    Person desg = (Person) session.getAttribute("loggedInDesg");
    Person sudo = (Person) session.getAttribute("loggedInSudo");
    
    if (dev == null && d == null && desg == null && sudo == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
