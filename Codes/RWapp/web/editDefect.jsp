<%-- 
    Document   : editDefect
    Created on : Dec 14, 2015, 12:01:14 AM
    Author     : maxchua
--%>

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
    </head>
    <body>
        <section id="main-content">
            <section class="wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <section class="panel">
                            <header class="panel-heading">
                                Edit Defect
                            </header>
                            <div class="panel-body">
                                <%
                                    String defId = request.getParameter("id");
                                    int id = Integer.parseInt(defId);

                                    Defect toEdit = DefectDAO.retrieveDefect(id);
                                %>

                                <%  String errorMsg = (String) request.getAttribute("err");
                                    String sucess = (String) request.getAttribute("sucess");

                                    if (errorMsg != null) {
                                        out.println(errorMsg);
                                    }
                                    if (sucess != null) {
                                        out.println(sucess);
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
                                            <option value='1'>Low</option>
                                            <option value='2'>Medium</option>
                                            <option value='3'>High</option>
                                        </select>
                                    </div>
                                    <label for="inputType" class="col-lg-2 control-label">Defect status</label>
                                    <div class="col-lg-9">
                                        <select name="complete" class="form-control m-bot15" id="complete">
                                            <option value='0'>Developer has not fixed the bug</option>
                                            <option value='1'>Developer has fixed the bug</option>
                                            <option value='2'>Defect has been solved</option>
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
    </body>
</html>
