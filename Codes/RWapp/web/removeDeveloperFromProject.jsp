<%-- 
    Document   : removeDeveloperFromProject
    Created on : Jan 14, 2016, 10:11:41 PM
    Author     : maxchua
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="src.model.ProjectAllocationDAO"%>
<%@page import="src.model.Project"%>
<%@page import="src.model.ProjectDAO"%>
<%@include file="protectPM.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String thisPage = "viewTrelloCards"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove Developer</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");

            Project currP = ProjectDAO.retrieveProjectById(id);

            ArrayList<String> devList = ProjectAllocationDAO.retrieveDev(currP.getName());

        %>
        <section id="main-content">
            <section class="wrapper">
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <header class="panel-heading">
                                Editing: Project <%=currP.getName()%>
              
                                </span>
                            </header>
                            <div class="panel-body">
                                <form action="removeDev">
                                    <div class="form-group">
                                        <label for="inputEmail1" class="col-lg-3 control-label">Developer(s) to remove:</label>
                                        <div class="col-lg-9">
                                            <%
                                                for (String d : devList) {
                                            %>
                                            <input type='checkbox' name='dev' value='<%=d%>'/> <%=d%></br>
                                            <%}%>
                                            <p></p>
                                        </div>
                                    </div>

                                    <input type='hidden' name='projectId' value='<%=id%>'/>
                                    <input type="hidden" name="pmname" value="<%=pm.getUsername()%>"/>
                                    
                                    <div class="form-group">
                                        <div class="col-lg-offset-3 col-lg-9">
                                            <p></p>
                                            <button type="submit" class="btn btn-primary">Remove</button>
                                        </div>
                                    </div>
                                    
                                </form>
                            </div>
                        </section>
                    </div>
                </div>
        
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                
                            <div class="panel-body">
                                <form action="completeDev">
                                    <div class="form-group">
                                        <label for="inputEmail1" class="col-lg-3 control-label">Developer(s) to mark complete:</label>
                                        <div class="col-lg-9">
                                            <%
                                                for (String d : devList) {
                                            %>
                                            <input type='checkbox' name='dev' value='<%=d%>'/> <%=d%></br>
                                            <%}%>
                                            <p></p>
                                        </div>
                                    </div>

                                    <input type='hidden' name='projectId' value='<%=id%>'/>
                                    <input type="hidden" name="pmname" value="<%=pm.getUsername()%>"/>
                                    
                                    <div class="form-group">
                                        <div class="col-lg-offset-3 col-lg-9">
                                            <p></p>
                                            <button type="submit" class="btn btn-primary">Remove</button>
                                        </div>
                                    </div>
                                    
                                </form>
                            </div>
                        </section>
                    </div>
                </div>
            </section>
 
                                    
                                    
        </section>
    </body>
</html>
