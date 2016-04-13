<%@page import="src.model.DefectDAO"%>
<%@page import="src.model.Defect"%>
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
        <%
            String idDef = (String) request.getParameter("id");
            Defect d = DefectDAO.retrieveDefect(Integer.parseInt(idDef)); %>
        <section id="main-content">
            <section class="wrapper">
                <!--Error/success display-->
                <%  String err = (String) request.getAttribute("err");
                    String sucess = (String) request.getAttribute("sucess");
                    ArrayList<String> errorList = (ArrayList<String>) request.getAttribute("errList");

                    if (err != null) {
                %>
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
                <%
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
                    }
                    if (errorList != null && !errorList.isEmpty()) { %>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="alert alert-block alert-danger fade in">
                                <button data-dismiss="alert" class="close close-sm" type="button">
                                    <i class="fa fa-times"></i>
                                </button>
                                <% for (int i = 0; i < errorList.size(); i++) {
                                        out.println(errorList.get(i));
                                    }%>
                            </div>
                        </section>
                    </div>
                </div>
                <% }
                %>
                <!--End of error/success display-->

                <%int defectId = d.getId();%>
                <div class="row">
                    <div class="col-lg-12">
                        <section class="panel">
                            <header class="panel-heading">
                                Add Defect Screenshot for Defect <%=d.getDefectName()%> 
                            </header>
                            <div class="panel-body">
                                <form method="post" action="DefectScreenshotController" enctype="multipart/form-data" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">Select Image</label>
                                        <div class="col-lg-3">
                                            <input type="file" id="exampleInputFile" name="file_uploaded" class="file-pos">
                                            <input type="hidden" value='<%=idDef%>' name="defectid" size="30">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-3">
                                            <button type="submit" class="btn btn-primary">Upload</button>
                                            
                                            <a href='viewDefectInfo.jsp?defectId=<%=defectId%>'><button type="button" class="btn btn-info">Return</button></a>
                                        </div>
                                        
                                    </div>
                                </form>

                            </div>
                        </section>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <section class="panel">
                            <div class="panel-body">
                                <table>
                                    <%

                                        ArrayList<String> timestamps = DefectScreenshotDAO.getScreenshotTimestamp(idDef);
                                        if (timestamps.size()!=0){
                                        for (String stamp : timestamps) {
                                    %>
                                    <tr><td>
                                            <div class="col-lg-2"><img style="height:75px;width:75px" src='DefectScreenshotServlet?defectid=<%=idDef%>&updatetime=<%=stamp%>' align="center"/></div>
                                            <div class="col-lg-10"></div>
                                            <br/><br/>
                                            <!--Defect ID: -->
                                            <%//=idDef%><%//=stamp%>
                                        <td>
                                            <form method="POST"  action="DefectScreenshotController" enctype="multipart/form-data" >

                                                <div class="form-group">

                                                    <input type='hidden' name="updatetime" value='<%=stamp%>'>
                                                    <input type='hidden' name="delete" value="delete">
                                                    <input type='hidden' name="d" value='delete'>
                                                    <input type='hidden' name='defectid' value='<%=idDef%>'>
                                                    <button type="submit" class="btn btn-primary">Delete</button>

                                                </div>
                                            </form>
                                        </td>
                                        </td></tr>
                                        <%}}else{%>
                                           No screenshots available 
                                        <%}%>
                                </table>
                            </div>
                        </section>
                    </div>
                </div>
            </section>
        </section>
    </body>
</html>
