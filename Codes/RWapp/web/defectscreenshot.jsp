<%@page import="src.model.DefectScreenshotDAO"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="src.model.DisplayPictureDAO"%>
<%@include file="protectPM.jsp" %>
<%String thisPage = "addDefect"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html">
        <title>Add Defect Screenshot</title>
    </head>
    <body>
        <section id="main-content">
            <section class="wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <section class="panel">
                            <header class="panel-heading">
                                Add Defect Screenshot
                            </header>
                            <div class="panel-body">
                                <%
                                    String idDef = (String) request.getParameter("id");

                                    String err = (String) request.getAttribute("err");

                                    if (err != null) {
                                        out.println(err);
                                    }
                                %>
                                <form method="post" action="DefectScreenshotController" enctype="multipart/form-data" class="form-horizontal">


                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">Select Screenshot</label>
                                        <div class="col-lg-3">
                                            <input type="file" id="exampleInputFile" name="file_uploaded" class="file-pos">
                                            <input type="hidden" value='<%=idDef%>' name="defectid" size="30">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-3">
                                            <button type="submit" class="btn btn-primary">Upload</button>
                                        </div>
                                    </div>
                                </form>

                                <%

                                    ArrayList<String> timestamps = DefectScreenshotDAO.getScreenshotTimestamp(idDef);
                                    for (String stamp : timestamps) {
                                %>
                                <div class="col-lg-2"><img src='DefectScreenshotServlet?defectid=<%=idDef%>&updatetime=<%=stamp%>' align="center"/></div>
                                <div class="col-lg-10"></div>
                                <br/><br/>
                                <!--Defect ID: -->
                                <%//=idDef%><%//=stamp%>

                                <form method="POST"  action="DefectScreenshotController" enctype="multipart/form-data" >

                                    <div class="form-group">

                                        <input type='hidden' name="updatetime" value='<%=stamp%>'>
                                        <input type='hidden' name="delete" value="delete">
                                        <input type='hidden' name="d" value='delete'>
                                        <input type='hidden' name='defectid' value='<%=idDef%>'>
                                        <button type="submit" class="btn btn-primary">Delete</button>
                                </form>
                                <%}%>
                                </br>
                            </div>
                        </section>
                    </div>
                </div>
            </section>
        </section>
    </body>
</html>
