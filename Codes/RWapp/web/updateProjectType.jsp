<%-- 
    Document   : updateProjectType
    Created on : Jan 21, 2016, 3:56:49 PM
    Author     : maxchua
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="src.model.ProjectDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SUP<3</title>
    </head>
    <body>
        
        <%
            ArrayList<String> typeList = ProjectDAO.retrieveAllTypes();
            
            %>
        <h1>tidy project type</h1>
        
        <form action="editProjectType"/>
      
        <%
            for(String t: typeList){
                %>
                
                <input type='checkbox' name='type' value='<%=t%>'/><%=t%></br>
                
                <%
            }
            
            
            %>
            
            Replace with: <input type="text" name="replacedText" /></br>
            Or select from: 
            <select name="typeOption">
                <option value="">select...</option>
                <%
                for(String t : typeList){
            %>
            <option value="<%=t%>"><%=t%></option>
            <%}
                %>
            </select>
            <input type="submit" value="submit"/>
        </form>
            
            </br>
            
            <%
                String success = (String) request.getAttribute("success");
                String err = (String) request.getAttribute("err");
                ArrayList<String> errList = (ArrayList<String>) request.getAttribute("errList");
                if (success!= null){
                    out.println(success);
                } 
                if (err!= null){
                    out.println(err);
                }
                if(errList != null && !errList.isEmpty()){
                    out.println(errList);
                }
                %>
    </body>
</html>
