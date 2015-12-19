<%@page import="src.model.Person"%>
<%

    Person dev = (Person) session.getAttribute("loggedInDev");
    Person pm = (Person) session.getAttribute("loggedInPm");
    Person desg = (Person) session.getAttribute("loggedInDesg");
    Person sudo = (Person) session.getAttribute("loggedInSudo");
    Person tester = (Person) session.getAttribute("loggedInTester");
    if (dev == null && pm == null && desg == null && sudo == null && tester==null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
