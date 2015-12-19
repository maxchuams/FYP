<%-- 
    Document   : sortedDefects
    Created on : Dec 14, 2015, 3:05:42 PM
    Author     : maxchua
--%>
<%@page import="src.model.Defect"%>
<%@page import="java.util.ArrayList"%>
<%@include file="protectPM.jsp" %>
<%@include file="protectTester.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sort/Filter Defects</title>
    </head>
    <body>
        
         <%  String errorMsg = (String) request.getAttribute("err");
                    ArrayList<Defect> sucess = (ArrayList<Defect>) request.getAttribute("sucess");

                    if (errorMsg != null) {
                        out.println(errorMsg);
                    } 
                    
        %>
        
        <h2>Sort results</h2>
        <form action="sortData">
            <select name="sortby">
                <option value="projectname">Project Name</option>
                <option value="defectname">Defect Name</option>
                <option value="updatetime">Update Time</option>
                 <option value='iscomplete'>Defect Status</option>
            </select>
            <input type="hidden"  name='username' value='<%=pm.getUsername()%>'/>
            <input type='hidden' value='' name='inputText'/>
            <input type='hidden' value='' name='filter'/>
            <input type='hidden' value='pm' name='case'/>
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
            <input type="hidden" name='username' value='<%=pm.getUsername()%>'/>
            <input type='hidden' name='sortby' value=''/>
            <input type='hidden' value='pm' name='case'/>
            <input type="submit" value="Filter!"/>
            
        </form>
            <%
            if(sucess!=null){
               %>
                <table>
            <%
                for(Defect d: sucess){
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
                        if(pm != null){
                            if (d.getIsComplete() == 1){
                            %>
                            
                            <tr>
                                <td>Developer has completed, mark Complete?</td>
                                <td><a href='defectComplete?id=<%=d.getId()%>&case=1'>Yes</a></td>
                            </tr>
                            <%
                            } else if (d.getIsComplete() == 0) {
                                %>
                                <tr>
                                    <td> Developer has not yet completed the defect</td>
                                </tr>
                                
                                <%
                            }
                            %> 
                            <tr>
                                <td>Edit : </td>
                                <td><a href='editDefect.jsp?id=<%=d.getId()%>'>Yes</a></td>
                            </tr>
                            <tr>
                                <td>Delete :</td>
                                <td><a href='defectComplete?id=<%=d.getId()%>&case=0'>Yes</a></td>
                            </tr>
                            <%
                        }
                        
                        
                        
                     
                    %>
                            
                    <%
                }
            
            %>
        </table>
               
               <%
            }
            
            
            
            %>
    </body>
</html>
