<%-- 
    Document   : assignDev
    Created on : Oct 31, 2015, 3:43:09 AM
    Author     : maxchua
--%>

<%@page import="src.model.TrelloCard"%>
<%@page import="src.model.Recommendation"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="protect.jsp" %>
<%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign Dev!</title>
    </head>
    <body>
        <section id="main-content">
        <section class="wrapper">
        <h1>Pick your developer!</h1>
        <%
            ArrayList<Recommendation> rlist = (ArrayList<Recommendation>) request.getAttribute("rList");
            TrelloCard toAssign = (TrelloCard) request.getAttribute("project");
        %>
        <h2>Card Chosen :</h2>
        Project name: <%=toAssign.getName()%> </br>
        Type: <%=toAssign.getType()%> </br>
        Priority: <%=toAssign.getPriority()%> </br>
        Due Date: <%=toAssign.getDue()%> </br>
        
        
        <h2>Developers Available</h2>
        <form action='processRecommendation' method='GET'>
            <%
            //System.out.println(rlist.size());
            for(Recommendation r: rlist){
                
              
                %>
                <input type="checkbox" name="dev" value='<%=r.getUsername()%>'/> <%=r.getUsername()%></br>
                
                <%
            }
            
            %>
            <input type='hidden' name='projName' value='<%=toAssign.getName()%>'/>
            <input type='hidden' name='type' value='<%=toAssign.getType()%>'/>
            <input type='hidden' name='priortiy' value='<%=toAssign.getPriority()%>'/>
            <input type='hidden' name='due' value='<%=toAssign.getDue()%>'/>
            <input type='hidden' name='desc' value='<%=toAssign.getDesc()%>'/>
            <input type='hidden' name='id' value='<%=toAssign.getId()%>'/>
            <input type="submit" value="Submit">
            
        </form>
        
        
        </section>
        </section>
    </body>
</html>
