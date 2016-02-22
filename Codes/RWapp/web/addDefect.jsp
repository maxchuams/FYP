<%-- 
    Document   : addDefect
    Created on : Dec 10, 2015, 8:54:13 PM
    Author     : maxchua
--%>
<%@page import="src.model.ProjectAllocationDAO"%>
<%@page import="src.model.DeveloperDAO"%>
<%@page import="src.model.Developer"%>
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
        <link href="res/select2/css/select2.css" rel="stylesheet"/>
        <script src="res/select2/js/select2.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Defect</title>
        <script src="res/select2/js/select2.js"></script>
        <script>
            $(function () {
                // turn the element to select2 select style
                $('select').select2();

                $(".devSelect2").select2(
                        {
                            placeholder: "Select a developer"
                        }
                );

                $(".projectSelect2").select2(
                        {
                            placeholder: "Select a projecr"
                        }
                );
            });
        </script>
        <script>
            $(function () {
                // turn the element to select2 select style
                $('select').select2();

                $(".devSelect2").select2(
                        {
                            placeholder: "Select a developer"
                        }
                );

                $(".projectSelect2").select2(
                        {
                            placeholder: "Select a project"
                        }
                );
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#showdev').hide(); //hide field on start

                $('#role').change(function () {

                    var $index = $('#role').index(this);
                    if ($('#role').val() == 'yes') { //if this value is NOT selected
                        $('#showdev').hide();

                    }
                    if ($('#role').val() == 'no') { //if this value is NOT selected
                        $('#showdev').show();

                    }
                });
            });
        </script>
    </head>
    <body>
        <%
            String name = request.getParameter("name");
            String errorMsg = (String) request.getAttribute("err");
            String sucess = (String) request.getAttribute("sucess");
            ArrayList<String> errorArr = (ArrayList<String>) request.getAttribute("err1");
        %>
        <section id="main-content">
            <section class="wrapper">
                <% if (sucess != null) {%>
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
                <%}
                    if (errorMsg != null) {%>
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
                <%}
                    if (errorArr != null) {
                        for (String eStr : errorArr) {
                %>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="alert alert-block alert-danger fade in">
                                <button data-dismiss="alert" class="close close-sm" type="button">
                                    <i class="fa fa-times"></i>
                                </button>
                                <%=eStr%>
                            </div>
                        </section>
                    </div>
                </div>  
                <%
                        }
                    }%>
                <div class="row">
                    <div class="col-lg-12">
                        <section class="panel">
                            <header class="panel-heading">
                                Add Defect
                            </header>
                            <div class="panel-body">
                                <form action="addNewDefect" id='main'>
                                    <label for="inputType" class="col-lg-3 control-label">Project name</label>
                                    <div class="col-lg-9">
                                        <select name="projectname" class="devSelect2 form-control m-bot15">
                                            <%
                    Person per = null;
                    if(session.getAttribute("loggedInPm")!=null){
                        per = (Person)session.getAttribute("loggedInPm");
                    }else{
                        per = (Person)session.getAttribute("loggedInTester");
                    }
                                                ArrayList<String> pList = ProjectAllocationDAO.retrieveInProgress();
                                                
                                                
                                                
                                                
                                                for (String p : pList) {
                                                    if (name != null && name.equalsIgnoreCase(p)) {%>
                                            <option value='<%=p%>' selected><%=p%></option>
                                            <%} else {
                                            %>
                                            <option value='<%=p%>'><%=p%></option>
                                            <%
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <p></p><br/><br/>
                                    <label for="inputType" class="col-lg-3 control-label">Use pre-assigned developer? </label>
                                    <div class="col-lg-9">
                                        <select name="filter" id="role" class="form-control m-bot15">
                                            <option selected>Select one..</option>
                                            <option value="yes">Yes</option>
                                            <option value="no">No</option>
                                        </select>
                                    </div>
                                    <p></p>
                                    
                                    <div id="showdev">
                                        <br/><br/>
                                            <label for="inputEmail1" class="col-lg-3 control-label">Developer</label>
                                            <div class="col-lg-9">
                                                <select name="devname" class="devSelect2 form-control m-bot15">
                                                    <%
                                                        ArrayList<Developer> dList = DeveloperDAO.retrieveDevelopers();
                                                        for (Developer d : dList) {
                                                            if (name != null && name.equalsIgnoreCase(d.getUsername())) {%>
                                                    <option value='<%=d.getUsername()%>' selected><%=d.getUsername()%></option>
                                                    <%} else {
                                                    %>
                                                    <option value='<%=d.getUsername()%>'><%=d.getUsername()%></option>
                                                    <%
                                                            }
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                    </div>
                                    <p></p><br/><br/>

                                    <div class="form-group">
                                        <label for="inputEmail1" class="col-lg-3 control-label">Defect Name</label>
                                        <div class="col-lg-9">
                                            <input type="text" name="defname" required class="form-control" id="defname" placeholder="" required>
                                            <p></p>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="inputEmail1" class="col-lg-3 col-sm-2 control-label">Due Date</label>
                                        <div class="col-lg-9">
                                            <input type="date" class="form-control m-bot12" name="duedate" required/>
                                            <p></p>
                                        </div>

                                    </div>   



                                    <div class="form-group">
                                        <label for="inputEmail1" class="col-lg-3 control-label">Description</label>
                                        <div class="col-lg-9">
                                            <textarea class="form-control" rows="4" id="desc" name="desc" required></textarea>
                                            <p></p>
                                        </div>
                                    </div>


                                    <label for="inputType" class="col-lg-3 control-label">Severity</label>
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

                                    <input type='hidden' name='pmName' value='<%=per.getUsername()%>'/>
                                    
                                    <div class="form-group">
                                        <div class="col-lg-offset-3 col-lg-9">
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
