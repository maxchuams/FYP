<%-- 
    Document   : editDefect
    Created on : Dec 14, 2015, 12:01:14 AM
    Author     : maxchua
--%>

<%@page import="src.model.ProjectAllocationDAO"%>
<%@page import="src.model.DefectCommitBy"%>
<%@page import="src.model.DefectCommitByDAO"%>
<%@page import="src.model.Developer"%>
<%@page import="src.model.DeveloperDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.model.Defect"%>
<%@page import="src.model.DefectDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="protectPM.jsp" %>
<%String thisPage = "manageDefects"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Defect</title>
        <link href="js/skins/minimal/green.css" rel="stylesheet">
        <link href="js/skins/square/green.css" rel="stylesheet">
        <link href="js/skins/flat/green.css" rel="stylesheet">
        <script src="js/icheck.js"></script>
        <script>
            $(document).ready(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_flat',
                    radioClass: 'iradio_flat'
                });
            });
        </script>
    </head>
    <body>
        <section id="main-content">
            <section class="wrapper">
                <!--Error/success display-->
                <%  String errorMsg = (String) request.getAttribute("err");
                    String sucess = (String) request.getAttribute("sucess");
                    ArrayList<String> errorList = (ArrayList<String>) request.getAttribute("err1");

                    if (errorMsg != null) {
                %>
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
                <%
                    }
                    if (errorList != null) {
                        for (String eStr : errorList) {
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
                    }
                    if (sucess != null) {%>
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
                <%
                    }%>
                <!--End of error/success display-->
                <div class="row">
                    <div class="col-lg-12">
                        <section class="panel">
                            <header class="panel-heading">
                                Edit Defect
                            </header>
                            <div class="panel-body">
                                <%
                                    String defId = request.getParameter("id");
                                    if (defId == null) {
                                        defId = (String) request.getAttribute("id");
                                    }
                                    int id = Integer.parseInt(defId);

                                    Defect toEdit = DefectDAO.retrieveDefect(id);
                                    int sev = toEdit.getSeverity();
                                    String severity = "";

                                    if (sev == 1) {
                                        severity = "Low";
                                    } else if (sev == 2) {
                                        severity = "Medium";
                                    } else if (sev == 3) {
                                        severity = "High";
                                    }
                                %>

                                <form action="updateDefect" id='main' method="post">
                                    <div class="form-group">
                                        <label for="inputEmail1" class="col-lg-2 control-label">Project Name</label>
                                        <div class="col-lg-9">
                                            <%=toEdit.getProjectName()%>
                                            <p></p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEmail1" class="col-lg-2 control-label">Defect Name</label>
                                        <div class="col-lg-9">
                                            <input type="text" name="defname" required class="form-control" id="defname" placeholder="Name" value="<%=toEdit.getDefectName()%>" required>
                                            <p></p>
                                        </div>
                                    </div>


                                    <label for="inputEmail1" class="col-lg-2 control-label">Caused by</label>
                                    <div class="col-lg-10">
                                        <%
                                            ArrayList<String> dcbList = DefectCommitByDAO.retrieveBlamedDevForDefect(toEdit.getId());
                                            ArrayList<String> devList = ProjectAllocationDAO.retrieveDev(toEdit.getProjectName());
                                            for (String devForProj : devList) {
                                                if (dcbList.contains(devForProj)) {
                                        %>
                                        <input type="checkbox" name="dcbname" checked  value="<%=devForProj%>"> <%=devForProj%>
                                        <%
                                        } else {
                                        %>
                                        <input type="checkbox" name="dcbname"  value="<%=devForProj%>"> <%=devForProj%> 
                                        <%
                                                }
                                            }

                                        %>
                                        <p></p>
                                    </div>

                                    <label for="inputEmail1" class="col-lg-2 control-label">Developer</label>
                                    <div class="col-lg-9">
                                        <select name="devname" class="devSelect2 form-control m-bot15">
                                            <%                                                ArrayList<Developer> dList = DeveloperDAO.retrieveDevelopers();
                                                for (Developer d : dList) {
                                                    if (toEdit.getAssignto() != null && toEdit.getAssignto().equalsIgnoreCase(d.getUsername())) {%>
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


                                    <div class="form-group">
                                        <label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">Due Date</label>
                                        <div class="col-lg-9">
                                            <input type="date" class="form-control m-bot12" name="duedate"  value="<%=toEdit.getDuedate()%>" required/>
                                            <p></p>
                                        </div>

                                    </div>  

                                    <div class="form-group">
                                        <label for="inputEmail1" class="col-lg-2 control-label">Description</label>
                                        <div class="col-lg-9">
                                            <textarea class="form-control" rows="4" id="desc" name="desc"><%=toEdit.getDesc()%></textarea>
                                            <p></p>
                                        </div>
                                    </div>
                                    <label for="inputType" class="col-lg-2 control-label">Severity</label>
                                    <div class="col-lg-9">
                                        <select name="severity" class="form-control m-bot15">
                                            <% if (sev == 1) {%>
                                            <option value='1' selected>Low</option>
                                            <option value='2' >Medium</option>
                                            <option value='3' >High</option>
                                            <% } else if (sev == 2) {%>
                                            <option value='1' >Low</option>
                                            <option value='2' selected>Medium</option>
                                            <option value='3' >High</option>
                                            <% } else if (sev == 3) {%>
                                            <option value='1' >Low</option>
                                            <option value='2' >Medium</option>
                                            <option value='3' selected>High</option>
                                            <% } else {%>
                                            <option value='1' >Low</option>
                                            <option value='2' >Medium</option>
                                            <option value='3' >High</option>
                                            <% }%>
                                        </select>
                                    </div>
                                    <label for="inputType" class="col-lg-2 control-label">Defect status</label>
                                    <div class="col-lg-9">
                                        <select name="complete" class="form-control m-bot15" id="complete">
                                            <option value='0'>Developer has not fixed the bug</option>
                                            <option value='2'>Developer has fixed the bug</option>
                                            <option value='1'>Defect has been solved</option>
                                        </select>
                                    </div>
                                    <input type='hidden' name='pmname' value='<%=pm.getUsername()%>'/>
                                    <input type='hidden' name ='projname' value='<%=toEdit.getProjectName()%>'/>
                                    <input type='hidden' name='id' value='<%=toEdit.getId()%>'/></br>

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
        <script>
            $(document).ready(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_flat-green',
                    radioClass: 'iradio_flat-green'
                });
            });
        </script>
    </body>
</html>
