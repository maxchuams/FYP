<%-- 
    Document   : addDefect
    Created on : Dec 10, 2015, 8:54:13 PM
    Author     : maxchua
--%>
<%@page import="src.model.Defect"%>
<%@page import="src.model.Project"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.model.ProjectDAO"%>
<%@include file="protectPMandTester.jsp" %>
<%String thisPage = "addDefect"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Defect</title>
    </head>
    <body>
        <section id="main-content">
            <section class="wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <section class="panel">
                            <header class="panel-heading">
                                Add Defect
                            </header>
                            <div class="panel-body">

                                <%
                                    String name = request.getParameter("name");
                                    String errorMsg = (String) request.getAttribute("err");
                                    String sucess = (String) request.getAttribute("sucess");
                                    ArrayList<String> errorArr = (ArrayList<String>) request.getAttribute("err1");
                                    if (errorMsg != null) {
                                        out.println(errorMsg);
                                    }
                                    if (sucess != null) {
                                        out.println(sucess);
                                    }
                                    if (errorArr != null) {
                                        for(String es: errorArr){
                                            out.println(es + "<br>");
                                        }
                                        
                                    }
                                %>
                                </br>
                                <form action="addNewDefect" id='main'>
                                    <label for="inputType" class="col-lg-2 control-label">Project name</label>
                                    <div class="col-lg-9">
                                        <select name="projectname" class="form-control m-bot15">
                                            <%
                                                ArrayList<Project> pList = ProjectDAO.retrieveInProgress();
                                                for (Project p : pList) {
                                                    if (name != null && name.equalsIgnoreCase(p.getName())) {%>
                                            <option value='<%=p.getName()%>' selected><%=p.getName()%></option>
                                            <%} else {
                                            %>
                                            <option value='<%=p.getName()%>'><%=p.getName()%></option>
                                            <%
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="inputEmail1" class="col-lg-2 control-label">Defect Name</label>
                                        <div class="col-lg-9">
                                            <input type="text" name="defname" required class="form-control" id="defname" placeholder="" required>
                                            <p></p>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">Due Date</label>
                                        <div class="col-lg-9">
                                            <input type="date" class="form-control m-bot12" name="duedate" required/>
                                            <p></p>
                                        </div>

                                    </div>   



                                    <div class="form-group">
                                        <label for="inputEmail1" class="col-lg-2 control-label">Description</label>
                                        <div class="col-lg-9">
                                            <textarea class="form-control" rows="4" id="desc" name="desc" required></textarea>
                                            <p></p>
                                        </div>
                                    </div>


                                    <label for="inputType" class="col-lg-2 control-label">Severity</label>
                                    <div class="col-lg-1">
                                        <input type='radio' name='severity' value='1'/> Low <br/> 
                                    </div>
                                    <div class="col-lg-1">
                                        <input type='radio' name='severity' value='2'/> Med <br/> 
                                    </div>
                                    <div class="col-lg-1">
                                        <input type='radio' name='severity' value='3'/> High <br/> 
                                    </div>
                                    <!--                                        <select name="severity" class="form-control m-bot15">
                                                                                <option value='1'>Low</option>
                                                                                <option value='2'>Medium</option>
                                                                                <option value='3'>High</option>
                                                                            </select>-->

                                    <input type='hidden' name='pmName' value='<%=pm.getUsername()%>'/>

                                    <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-10">
                                            <p></p>
                                            <button type="submit" class="btn btn-primary">Submit</button>
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
