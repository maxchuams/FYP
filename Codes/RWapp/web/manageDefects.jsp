<%-- 
    Document   : viewDefects
    Created on : Dec 11, 2015, 6:27:02 PM
    Author     : maxchua
--%>

<%@page import="src.model.Defect"%>
<%@page import="src.model.DefectDAO"%>
<%@page import="java.util.ArrayList"%>
<%@include file="protectPM.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Defects</title>
    </head>
    <body>
        <h1>Defects</h1>
        
        <a href='addDefect.jsp'><h3>Add new defects</h3></a>
        <%
            ArrayList<Defect> dList = DefectDAO.retrieveAll();
        %>
        <table>
            <%
                for(Defect d: dList){
                    int sev = d.getSeverity();
                    String severity = "";
                    if(sev ==1){
                        severity = "Low";
                    } else if (sev == 2){
                        severity = "Medium";
                    } else if(sev == 3){
                        severity = "High";
                    }
                    %>
                    <th><h4><%=d.getProjectName()%></h4></th>
                    <tr>
                    <td>Name of Defect: </td>
                    <td><%=d.getDefectName()%></td>
                    </tr>
                    <tr>
                        <td>Severity: </td>
                        <td><%=severity%></td>
                    </tr>
                    <tr>
                        <td>Description: </td>
                        <td><%=d.getDesc()%></td>
                    </tr>
                    <tr>
                        <td>Reported by: </td>
                        <td><%=d.getReportedBy()%></td>
                    </tr>
                    <%
                        if(pm != null && d.getIsComplete()==0){
                            %>
                            
                            <tr>
                                <td>Mark Complete :</td>
                                <td><a href='defectComplete?projname=<%=d.getProjectName()%>&defectname=<%=d.getDefectName()%>'>Yes</a></td>
                            </tr>
                            <%
                        }
                        
                        
                        
                     
                    %>
                            
                    <%
                }
            
            %>
        </table>
    </body>
</html>
