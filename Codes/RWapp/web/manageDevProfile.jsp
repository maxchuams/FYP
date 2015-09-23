<%-- 
    Document   : manageDevProfile
    Created on : Sep 14, 2015, 12:29:13 PM
    Author     : admin
--%>
<%@page import="src.model.Skill"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="src.model.SkillDAO"%>
<%@include file="protectDev.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Profile</title>
    </head>
    <body>
        <h1>The developer's profile management page</h1>
        
         
        <a href="index.jsp">home</a>
        </br>
        <%
            
         

            String errorMsg = (String) request.getAttribute("err");
            String sucess = (String) request.getAttribute("sucess");
            if (errorMsg == null) {
                errorMsg = "";
            } 
            
            if(sucess == null){
                sucess = "";
            }


        %>
        <b style="color:blue;"><%=sucess%></b><b style="color:red;"><%=errorMsg%></b>
         </br>
        Current profile details: </br>
        Username: <%= dev.getUsername()%> </br>
        Date started: to be completed </br>
        Skills: 
        <%
            ArrayList<Skill> sList = SkillDAO.retrieveDevSkill(dev.getUsername());
            for(int i = 0; i < sList.size(); i++){
                Skill s = sList.get(i);
                out.print(s.getSkill());
                if(i != sList.size() -1){
                    out.print(", " );
                }
            }
        %>
        </br>

        </br>

        <h2>Edit</h2>

        </br>
        <form action="ManageProfile" method="POST">
            Password: <input type="password" name="password1" /> </br>
            Confirm password again: <input type="password" name="password2" /> </br>
            Add skills: <input type="text" name="skills" placeholder="eg. java,mysql,php,..."/></br>
            
             </br>
            <button type="submit">submit</button>
        </form>
    </body>
</html>
