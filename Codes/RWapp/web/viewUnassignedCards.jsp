<%-- 
    Document   : viewUnassignedCards
    Created on : Oct 5, 2015, 2:15:52 AM
    Author     : admin
--%>

<%@page import="src.model.TrelloCard"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.model.TrelloBoard"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="protect.jsp"%>
<%@include file="navbar.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trello</title>
    </head>
    <body>
        <section id="main-content">
        <section class="wrapper">
        <h1>Hello World!</h1>
        <% ArrayList<TrelloCard> tb = (ArrayList<TrelloCard>) request.getAttribute("tc"); 
           
       
         
        %>
        
        Trello Board data:
        </br>
         <table>
            <thead>
                <tr>
                    <th>Project Name</th>
                    <th>Due Date</th>
                   
                </tr>
            </thead>
            <%
            for (TrelloCard t : tb){
               %> 
               <tr>
                   <td><%=t.getName()%></td>
                   <td><%=t.getDue()%></td>
                  
               </tr>
               <% 
            }
            
            
            
            %>
        </table>
       
        <form action="assignRecommendation" method="GET">
            Select Project:
            
            <select name="card">
                <%
                for(TrelloCard t : tb){
                    %>
                    <option value='<%=t.getId()%>'><%=t.getName()%></option>
                    
                    <%
                    
                }
                
                %>
            </select>
            </br>
            Select start date: 
            <input type="date" name="sDate" required/>
            </br>
            Priority:
            <select name='priority'>
                <option value='1'>1 - Low</option>
                <option value='2'>2 - Medium</option>
                <option value='3'>3 - High</option>
            </select>
            </br>
            
            Project Type:
            <select name='type'>
                <option value='Wordpress'>Wordpress</option>
                <option value='eCommerce'>eCommerce</option>
                <option value='Custom'>Custom</option>
            </select>
            <input type='submit' value='Get Recommendation!'/>
            
        </form>
        
    </section>
</section>
    </body>
</html>
