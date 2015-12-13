<%-- 
    Document   : addDefect
    Created on : Dec 10, 2015, 8:54:13 PM
    Author     : maxchua
--%>
<%@page import="src.model.Defect"%>
<%@page import="src.model.Project"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.model.ProjectDAO"%>
<%@include file="protectPM.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new defect</title>
    </head>
    <body>
        <h1>Add new defects</h1>
        <h3><a href='manageDefects.jsp'>View Defects</a></h3>
        <%  String errorMsg = (String) request.getAttribute("err");
            Defect sucess = (Defect) request.getAttribute("sucess");
            ArrayList<String> errorArr = (ArrayList<String>) request.getAttribute("err1");
            if (errorMsg != null) {
                out.println(errorMsg);
            }
            if (sucess != null) {
                out.println(sucess.getDefectName() + " has been added into the System!");
            }
            if(errorArr!=null){
                out.println(errorArr);
            }
        %>
        </br>
        <form action="addNewDefect">
            Project Name: 
                <select name="projectname">
            <%
            ArrayList<Project> pList = ProjectDAO.retrieveInProgress();
            for(Project p : pList){
                %>
                <option value='<%=p.getName()%>'><%=p.getName()%></option>
                <%
            }
            %>
            </select></br>
            Name of Defect: <input type='text' name='defname'required/></br>
            Description:</br>
            <textarea rows="4" cols="50" name='desc' required>
            </textarea></br>
            Severity: 
            <select name='severity'>
                <option value='1'>Low</option>
                <option value='2'>Medium</option>
                <option value='3'>High</option>
            </select></br>
            <input type='hidden' name='pmName' value='<%=pm.getUsername()%>'/>
            <input type='submit' value='submit'/>
        </form>

    </body>
</html>
