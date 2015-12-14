<%-- 
    Document   : viewDefects
    Created on : Dec 11, 2015, 6:27:02 PM
    Author     : maxchua
--%>

<%@page import="src.model.Defect"%>
<%@page import="src.model.DefectDAO"%>
<%@page import="java.util.ArrayList"%>
<%@include file="protectDev.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Defects</title>
    </head>
    <body>
        <h1>Defects</h1>
        
        <h2>Sort results</h2>
        <form action="sortData">
            <select name="sortby">
                <option value="projectname">Project Name</option>
                <option value="defectname">Defect Name</option>
                <option value="updatetime">Latest Update Time</option>
                <option value='iscomplete'>Defect Status</option>
            </select>
            <input type="hidden"  name='username' value='<%=dev.getUsername()%>'/>
            <input type='hidden' value='' name='inputText'/>
            <input type='hidden' value='' name='filter'/>
            <input type='hidden' value='dev' name='case'/>
            <input type="submit" value="Sort!"/>
        </form>
        <h2>Filter results</h2>
        <form action="sortData">
            <select name="filter">
                <option value="projectname">Project Name</option>
                <option value="defectname">Defect Name</option>
                <option value="severity">Severity</option>
            </select>
            Search for: <input type="text" name="inputText"/> </br>
            <input type="hidden" name='username' value='<%=dev.getUsername()%>'/>
            <input type='hidden' name='sortby' value=''/>
            <input type='hidden' value='dev' name='case'/>
            <input type="submit" value="Filter!"/>
            
        </form>
        <%
            //need  to change to cater to projects under dev
        ArrayList<Defect> dList = DefectDAO.retrieveDev(dev.getUsername());
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
                     <tr>
                        <td>Last updated time: </td>
                        <td><%=d.getUpdateTime()%></td>
                    </tr>
                    <%
                        
                        if(dev != null && d.getIsComplete()== 0){
                             %>
                            <tr>
                                <td>Mark Complete :</td>
                                <td><a href='defectComplete?id=<%=d.getId()%>&case=2'>Yes</a></td>
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
