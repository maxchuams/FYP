<%-- 
    Document   : editDefect
    Created on : Dec 14, 2015, 12:01:14 AM
    Author     : maxchua
--%>

<%@page import="src.model.Defect"%>
<%@page import="src.model.DefectDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="protectPM.jsp" %>
<%@include file="protectTester.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Defect</title>
    </head>
    <body>
        <h1>Edit Defect!</h1>
        <%
            String defId = request.getParameter("id");
            int id = Integer.parseInt(defId);
            
            Defect toEdit = DefectDAO.retrieveDefect(id);
            
        %>
        
         <%  String errorMsg = (String) request.getAttribute("err");
            String sucess = (String) request.getAttribute("sucess");
           
            if (errorMsg != null) {
                out.println(errorMsg);
            }
            if (sucess != null) {
                out.println(sucess);
            }
          
        %>
        <a href='manageDefects.jsp'>Back to manage defects</a>
        <form action="updateDefect">
            Project Name: <%=toEdit.getProjectName()%> </br>
            Name of Defect: <input type='text' name='defname'value='<%=toEdit.getDefectName()%>'required/></br>
            Description:</br>
            <textarea rows="4" cols="50" name='desc'  required><%=toEdit.getDesc()%></textarea></br>
            Severity: 
            <select name='severity'>
                <option value='1'>Low</option>
                <option value='2'>Medium</option>
                <option value='3'>High</option>
            </select></br>
            Completion Status:
            <select name='complete'>
                <option value='0'>Developer has not fixed the bug</option>
                <option value='1'>Developer has fixed the bug</option>
                <option value='2'>Defect has been solved</option>
            </select>
            <input type='hidden' name='pmName' value='<%=pm.getUsername()%>'/>
            <input type='hidden' name ='projname' value='<%=toEdit.getProjectName()%>'/>
            <input type='hidden' name='id' value='<%=toEdit.getId()%>'/></br>
            <input type='submit' value='submit'/>
        </form>
    </body>
</html>
