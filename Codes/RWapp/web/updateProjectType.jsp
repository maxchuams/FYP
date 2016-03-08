<%-- 
    Document   : updateProjectType
    Created on : Jan 21, 2016, 3:56:49 PM
    Author     : maxchua
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="src.model.ProjectDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="protect.jsp"%>
<%String thisPage = "updateProjectType"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Project Type</title>
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
                <%  String success = (String) request.getAttribute("success");
                    String err = (String) request.getAttribute("err");
                    ArrayList<String> errList = (ArrayList<String>) request.getAttribute("errList");

                %>
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
                <%if (err != null) {%>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="alert alert-block alert-danger fade in">
                                <button data-dismiss="alert" class="close close-sm" type="button">
                                    <i class="fa fa-times"></i>
                                </button>
                                <%=err%>
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
                                Update All Project Types
                            </header>
                            <div class="panel-body">
                                <%
                                    ArrayList<String> typeList = ProjectDAO.retrieveAllTypes();
                                %>
                                <form action="editProjectType">
                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-3 col-sm-3 control-label">Select Project Type to Update:</label>
                                        <div class="col-lg-9">
                                            <% for (String t : typeList) {%> 
                                            <input type='checkbox' name='type' value='<%=t%>'/> &nbsp;&nbsp;<%=t%> <br/> 
                                            <% } %>
                                            <p></p>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-3 col-sm-3 control-label">Replace with a New Project Type:</label>
                                        <div class="col-lg-9">
                                            <input type="text" name="replacedText" class="form-control" id="inputPassword1" placeholder="">
                                            <p></p>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-3 col-sm-3 control-label">OR Replace with Existing Types:</label>
                                        <div class="col-lg-9">
                                            <select name="typeOption" class="form-control">
                                                <option value="">select...</option>
                                                <%
                                                    for (String t : typeList) {
                                                %>
                                                <option value="<%=t%>"><%=t%></option>
                                                <%}
                                                %>
                                            </select>
                                        </div>
                                    </div>

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
