<%-- 
    Document   : editProject
    Created on : Jan 27, 2016, 2:50:34 PM
    Author     : maxchua
--%>

<%@page import="src.model.Person"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.model.PersonDAO"%>
<%@page import="src.model.Project"%>
<%@page import="src.model.ProjectDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hi wen wen</title>
    </head>
    <body>
        <%
            String pname = request.getParameter("pname");
            Project toEdit = ProjectDAO.retrieveProjectByProjectName(pname);
            ArrayList<Person> pmList = PersonDAO.retrievAllPM();
            ArrayList<String> typeList = ProjectDAO.retrieveAllTypes();
        %>
        <h1>Project Details</h1>
        <form action="updateProject">
        Name: <%=toEdit.getName()%> </br>
        Id: <%=toEdit.getTrelloKey()%> </br>
        Description: <%=toEdit.getDesc()%> </br>
        Type: <%=toEdit.getType()%> </br>
        Project size: <%=toEdit.getPsize()%> days</br>
        Assigned by: 
        <select name="assignedby">
            <%
                for (Person pm : pmList) {
                    if (pm.getUsername().equals(toEdit.getName())) {
            %>
            <option value="<%=pm.getUsername()%>" selected><%=pm.getUsername()%></option>

            <%
            } else {
            %>

            <option value="<%=pm.getUsername()%>"><%=pm.getUsername()%></option>
            <%
                    }
                }

            %>
        </select></br>
        Due date: <input type="date" name="duedate"/> </br>
        Priority: 
        <select name="priority">
            <%                if (toEdit.getPriortiy() == 1) {
            %>
            <option value="1" selected>Low</option>
            <%
                } else {%>

            <option value="1">Low</option>
            <%
                }
            %>
            <%
                if (toEdit.getPriortiy() == 2) {
            %>
            <option value="2" selected>Medium</option>
            <%
                } else {%>

            <option value="2">Medium</option>
            <%
                }
            %>
            <%
                if (toEdit.getPriortiy() == 3) {
            %>
            <option value="3" selected>High</option>
            <%
                } else {%>

            <option value="3">High</option>
            <%
                }
            %>

        </select></br>
        Completion status: 
        <select name="iscomplete">
            <option value="0">Developer not yet done</option>
            <option value="1">Developer has completed the task</option>
        </select> </br>
        <input type="hidden" value="<%=pname%>" name="pname"/>
        <input type="submit" value="submit"/>
        </form>
    </body>
</html>
