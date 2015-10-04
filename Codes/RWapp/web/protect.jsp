<%@page import="src.model.Person"%>
<%

    Person dev = (Person) session.getAttribute("loggedInDev");
    Person pm = (Person) session.getAttribute("loggedInPm");
    Person desg = (Person) session.getAttribute("loggedInDesg");
    Person sudo = (Person) session.getAttribute("loggedInSudo");
    
    if (dev == null && pm == null && desg == null && sudo == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
