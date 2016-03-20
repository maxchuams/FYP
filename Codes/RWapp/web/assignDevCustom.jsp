<%-- 
    Document   : assignDevCustom
    Created on : Mar 19, 2016, 11:16:53 PM
    Author     : maxchua
--%>

<%@page import="src.model.Person"%>
<%@page import="src.model.PersonDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.model.ProjectAllocationDAO"%>
<%@page import="src.model.Project"%>
<%@page import="src.model.ProjectDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign Developer Manually</title>
    </head>
    <body>
        <%
            String type = request.getParameter("type");
            String priority = request.getParameter("priority");
            String due = request.getParameter("due");
            String desc = request.getParameter("desc");
            String id = request.getParameter("id");
            String pmname = request.getParameter("pmname");
            String psize = request.getParameter("psize");
            String projName =request.getParameter("projName");
            Project p = ProjectDAO.retrieveProjectByProjectName(projName);
            if (p != null){
                type = p.getType();
                priority = "" + p.getPriortiy();
                due = p.getDuedate();
                desc = p.getDesc();
                id = p.getTrelloKey();
                pmname = p.getAssignedBy();
                psize = ""+ p.getPsize();
                        
            }

        %>
        <h1>Current project details</h1>
        
        Project Name: <%=projName%></br>
        Project Type: <%=type%></br>
        Due Date: <%=due%></br>
        Project Size: <%=psize%></br>
        
        
        <form action ="processRecommendation">
            
            <%
            
            ArrayList<String> devForProj = ProjectAllocationDAO.retrieveDev(projName);
            ArrayList<Person> devList = PersonDAO.retrievAllDev();
            
            
            %>
            Select a developer : 
            <select name="devM">
                <%
                for (Person dev : devList){
                    if(devForProj == null || devForProj.size()== 0 ){
                        %>
                        <option value="<%=dev.getUsername()%>"/><%=dev.getUsername()%>
                        <%
                                
                    } else {
                        if(!devForProj.contains(dev.getUsername())){
                            %>
                            
                             <option value="<%=dev.getUsername()%>"/><%=dev.getUsername()%>
                            <%
                        }
                    }
                }
            
            %>
            </select> </br>
            c
            Select start date: <input type="date" name="earliestStart" required></br>
            Select end date: <input type="date" name="completion" required></br>
            
            <%
            %>

            <input type='hidden' name='projName' value='<%=projName%>'/>
            <input type='hidden' name='type' value='<%=type%>'/>
            <input type='hidden' name='priority' value='<%=priority%>'/>
            <input type='hidden' name='due' value='<%=due%>'/>
            <input type='hidden' name='desc' value='<%=desc%>'/>
            <input type='hidden' name='id' value='<%=id%>'/>
            <input type="hidden" name="pmname" value='<%=pmname%>'/>
            <input type="hidden" name="psize" value='<%=psize%>'/>

            <input type="submit" value="submit"/>
        </form>



    </body>
</html>
