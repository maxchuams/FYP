<%-- 
    Document   : removeDeveloperFromProject
    Created on : Jan 14, 2016, 10:11:41 PM
    Author     : maxchua
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="src.model.ProjectAllocationDAO"%>
<%@page import="src.model.Project"%>
<%@page import="src.model.ProjectDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove Developer</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            
            Project currP = ProjectDAO.retrieveProjectById(id);
            
            ArrayList<String> devList = ProjectAllocationDAO.retrieveDev(currP.getName());
        %>
        <h1>Select developer to remove from <%=currP.getName()%></h1>
        <form action="removeDev">
            
                <%
                    for(String d: devList){
                        
                    
                %>
                <input type='checkbox' name='dev' value='<%=d%>'/><%=d%></br>
                <%}%>
            
            <input type='hidden' name='projectId' value='<%=id%>'/>
            <input type='submit' value='submit'/>
        </form>
    </body>
</html>
