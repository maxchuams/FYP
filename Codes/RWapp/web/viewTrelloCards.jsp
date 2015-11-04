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
<%String thisPage = "viewTrelloCards"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trello</title>
    </head>
    <body>
        <%
            
            ArrayList<TrelloCard> tList = TrelloCardDAO.retrieveAll();
            
        %>
        <section id="main-content">
        <section class="wrapper">
            <!--kw code-->
            <div class="row">
            <div class="col-sm-12">
                <section class="panel">
                    <header class="panel-heading">
                        View All Projects
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                         </span>
                    </header>
                    <div class="panel-body">
                        <table class="table  table-hover general-table">
                            <thead>
                            <tr>
                                <th>Project Name</th>
                                <th>Due Date</th>
                                <!--<th>Members</th>-->
                            </tr>
                            </thead>
                            <tbody>
                            <%
            for (TrelloCard t : tList){
               %> 
               <tr>
                   <td><%=t.getName()%></td>
                   <td><%=t.getDue()%></td>
                   <!--<td>
                   <%//ArrayList<Person> memberList = t.getMembers(); 
                   //for(Person p : memberList){
                    //   p.getUsername();
//}%>
                   </td>-->
               </tr>
               <% 
            }
            %>
                            </tbody>
                        </table>
                    </div>
                </section>
            </div>
            <!--kw code-->
        
        
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
        
<!--        <h2>Edit Priority</h2>
        <form action="editPriority" method="GET">
            Select Project:
            <select name="projectTitle">
            <%
           
//            for(TrelloCard card: tList){
//                String projectName = card.getName();
                //System.out.println(projectName);
                %>
                <option value='projectName%>'>projectName%></option>
                <%
//            }
           
           
           
           %>
        </select>
        </br>
        <select name="priority">
            <option value="Low">Low</option>
            <option valie="Medium">Medium</option>
            <option value="High">High</option>
        </select>
        <input type="submit" value="Set Priority!">
        </form>-->
        
       
        
        </section>
        </section>
        
    </body>
</html>
