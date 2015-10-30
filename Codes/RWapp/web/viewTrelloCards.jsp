<%-- 
    Document   : viewTrelloCards
    Created on : Oct 5, 2015, 2:15:52 AM
    Author     : admin
--%>

<%@page import="src.model.TrelloCardDAO"%>
<%@page import="src.model.TrelloCard"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.model.TrelloBoard"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="protect.jsp"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trello</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <a href="index.jsp">home</a> </br>
        
        <h2> Trello Board data:</h2>
        </br>
        <%
            
            ArrayList<TrelloCard> tList = TrelloCardDAO.retrieveAll();
            
        %>
        <table>
            <thead>
                <tr>
                    <th>Project Name</th>
                    <th>Due Date</th>
                    <th>Priority</th>
                </tr>
            </thead>
            <%
            for (TrelloCard t : tList){
               %> 
               <tr>
                   <td><%=t.getName()%></td>
                   <td><%=t.getDue()%></td>
                   <td><%=t.getPriority()%></td>
               </tr>
               <% 
            }
            
            
            
            %>
        </table>
        
        
        
        
        <form action="getTrelloData">
            <input type="submit" value="update"/>
        </form>
              
        
        <% 
        
       
            
         
        %>
        
        </br>
        
        <%             String errorMsg = (String) request.getAttribute("err");
            String sucess = (String) request.getAttribute("sucess");
            if (errorMsg == null) {
                errorMsg = "";
            }

            if (sucess == null) {
                sucess = "";
            }


        %>
        
        <h2>Edit Priority</h2>
        <form action="editPriority" method="GET">
            Select Project:
            <select name="projectTitle">
            <%
           
            for(TrelloCard card: tList){
                String projectName = card.getName();
                //System.out.println(projectName);
                %>
                <option value='<%=projectName%>'><%=projectName%></option>
                <%
            }
           
           
           
           %>
        </select>
        </br>
        <select name="priority">
            <option value="Low">Low</option>
            <option valie="Medium">Medium</option>
            <option value="High">High</option>
        </select>
        <input type="submit" value="Set Priority!">
        </form>
        
       
        
        
        
    </body>
</html>
