<%-- 
    Document   : editProject
    Created on : Jan 27, 2016, 2:50:34 PM
    Author     : maxchua
--%>

<%@page import="src.model.Person"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.model.PersonDAO"%>
<%@page import="src.model.Project"%>
<%@page import="src.model.ProjectDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="protectPM.jsp"%>
<%String thisPage = "viewTrelloCards"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Project</title>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#devOnly').hide(); //hide field on start

                $('#role').change(function () {

                    var $index = $('#role').index(this);
                    if ($('#role').val() != 'Others') { //if this value is NOT selected
                        $('#devOnly').hide(); //this field is hidden
                    }
                    else {
                        $('#devOnly').show();//else it is shown

                    }
                });
            });
        </script>
    </head>
    <body>
        <%
            String pname = request.getParameter("pname");
            Project toEdit = ProjectDAO.retrieveProjectByProjectName(pname);
            ArrayList<Person> pmList = PersonDAO.retrievAllPM();
            ArrayList<String> typeList = ProjectDAO.retrieveAllTypes();
        %>
        <section id="main-content">
            <section class="wrapper">
                <!--Error/success display-->
                <%  String errorMsg = (String) request.getAttribute("err");
                    String sucess = (String) request.getAttribute("sucess");
                    String success = (String) request.getAttribute("success");
                    ArrayList<String> errorList = (ArrayList<String>) request.getAttribute("errList");

                %>
                <%if (errorMsg != null) {%>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="alert alert-block alert-danger fade in">
                                <button data-dismiss="alert" class="close close-sm" type="button">
                                    <i class="fa fa-times"></i>
                                </button>
                                <%=errorMsg%>
                            </div>
                        </section>
                    </div>
                </div>
                <%}%>
                <%if (success != null) {%>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="alert alert-success fade in">
                                <button data-dismiss="alert" class="close close-sm" type="button">
                                    <i class="fa fa-times"></i>
                                </button>
                                <%=success%>
                            </div>
                        </section>
                    </div>
                </div>
                <%}%>
                <%if (sucess != null) {%>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="alert alert-success fade in">
                                <button data-dismiss="alert" class="close close-sm" type="button">
                                    <i class="fa fa-times"></i>
                                </button>
                                <%=sucess%>
                            </div>
                        </section>
                    </div>
                </div>
                <%}%>

                <!--End of error/success display-->
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <header class="panel-heading">
                                Viewing: Project <%=toEdit.getName()%>
                            </header>
                            <div class="panel-body">

                                <form action="updateProject" class="form-horizontal" role="form">
                                    
                                    <!--<div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Project days</label>
                                        <div class="col-lg-10">
                                            <input class="form-control m-bot12" type="number" name="days" min=1 value="<%=toEdit.getPsize()%>" required/>
                                        </div>
                                    </div>-->
                                       <input type="hidden" name="days" value="<%=toEdit.getPsize()%>"/>
                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Priority</label>
                                        <div class="col-lg-10">
                                            <%if (0==toEdit.getPriortiy()){%>
                                                <select name='priority' class="form-control m-bot12">
                                                <option value='0' selected>Standard Project</option>
                                                <option value='1'>High Priority Project</option>
                                                </select>
                                            <%}else{%>
                                            <select name='priority' class="form-control m-bot12">
                                                <option value='0'>Standard Project</option>
                                                <option value='1' selected>High Priority Project</option>
                                            </select>
                                            <%}%>
                                        </div>
                                    </div>
                                        
                                    <%
                                        ArrayList<String> pTypeList = ProjectDAO.retrieveAllTypes();
                                    %>
                                                
                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Project manager</label>
                                        <div class="col-lg-10">
                                            <select name="assignedby" class="form-control m-bot12">
                                        <%
                                            Project proj = ProjectDAO.retrieveProjectByProjectName(toEdit.getName());
                                            String pmOfProj = proj.getAssignedBy();
                                            for (Person p : pmList) {
                                                if (p.getUsername().equals(pmOfProj)) {
                                        %>
                                        <option value="<%=pmOfProj%>" selected><%=pmOfProj%></option>

                                        <%
                                        } else {
                                        %>
                                        <option value="<%=p.getUsername()%>"><%=p.getUsername()%></option>
                                        <%
                                                }
                                            }

                                        %>
                                    </select>
                                        </div>
                                    </div>

                                    
                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Due date</label>
                                        <div class="col-lg-10">
                                            <input class="form-control m-bot12" type="date" name="duedate" min=1 value="<%=toEdit.getDuedate()%>" required/>
                                        </div>
                                    </div>
                                        
                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Project status</label>
                                        <div class="col-lg-10">
                                            <select name="iscomplete" class="form-control m-bot12">
                                                <option value="0">Project not completed</option>
                                                <option value="1">Project has been completed</option>
                                            </select>
                                        </div>
                                    </div>
                                        
                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Project Type</label>
                                        <div class="col-lg-10">
                                            <select name='type' class="form-control m-bot15" id="role">
                                                <%
                                                if(toEdit.getType()!=null){
                                                    if("to be updated".equals(toEdit.getType())){
                                                        for (String s : pTypeList) {%>
                                                          <option value='<%=s%>'><%=s%></option>  
                                                        <%}
                                                    }else{
                                                        for (String s : pTypeList) {
                                                            if(toEdit.getType().equals(s)){%>
                                                                <option value='<%=s%>' selected><%=s%></option>  
                                                            <%}else{%>
                                                                <option value='<%=s%>' ><%=s%></option>
                                                            <%}
                                                        }
                                                    }
                                                }
                                                    
                                                %>

                                                <option value="Others">Others</option>
                                            </select>
                                        </div>
                                        <div id='devOnly'>
                                            <label for="inputType" class="col-lg-2 control-label">Project Type </label>
                                            <div class="col-lg-10">
                                                <input type='text' name='otherType' class="form-control"/>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <input type="hidden" value="<%=pname%>" name="pname"/>
                                    
                                    <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-10">
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
