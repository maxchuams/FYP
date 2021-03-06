<%-- 
    Document   : viewDefects
    Created on : Dec 11, 2015, 6:27:02 PM
    Author     : maxchua
--%>
<%@page import="src.model.Project"%>
<%@page import="src.model.ProjectDAO"%>
<%@page import="src.model.DefectScreenshotDAO"%>
<%@page import="src.model.Defect"%>
<%@page import="src.model.DefectDAO"%>
<%@page import="java.util.ArrayList"%>
<%@include file="protectDev.jsp" %>
<%String thisPage = "viewDefects"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Defects</title>
        <script src="./bootstrap/imtech.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#pname').hide(); //hide field on start
                $('#severity').hide();
                $('#completed').hide();
                $('#role').change(function () {

                    var $index = $('#role').index(this);
                    if ($('#role').val() == 'projectname') { //if this value is NOT selected
                        $('#pname').show();
                        $('#completed').hide();
                        $('#severity').hide();//this field is hidden
                    }
                    if ($('#role').val() == 'severity') { //if this value is NOT selected
                        $('#pname').hide();
                        $('#completed').hide();
                        $('#severity').show();//this field is hidden
                    }
                    if ($('#role').val() == 'iscomplete') { //if this value is NOT selected
                        $('#pname').hide();
                        $('#completed').show();
                        $('#severity').hide();//this field is hidden
                    }
                });
            });
        </script>

        <script>
            function fuck() {
                var lowlow = [];
                var medmed = [];
                var highhigh = [];
                var obj = document.getElementsByClassName("divClass");
                for (var j = 0; j < obj.length; j++) {
                    var allDivTd = obj[j].getElementsByTagName("TD");
                    if (allDivTd[3].id == 'Low') {

                        lowlow.push(obj[j].id);
                    } else if (allDivTd[3].id == 'Medium') {
                        medmed.push(obj[j].id);
                    } else {
                        //alert(allDivTd[3].id)
                        highhigh.push(obj[j].id);
                    }
//                for(var i = 0; i < allDivTd.length; i++){
//                var td = allDivTd[i].id;
//                if(td == 'Low'){
//                            alert(obj[j].id +"" +td);
//                }
//                }
//                alert('next');
                }
                //alert(lowlow);
//            alert(medmed);
//            alert(highhigh);
                var final1 = medmed.concat(highhigh);
                var final2 = lowlow.concat(final1);
//            alert(final2);

                var myNode = document.getElementById('mainmain');
//            while (myNode.firstChild) {
//                myNode.removeChild(myNode.firstChild);
//                }

                for (var i = 0; i < final2.length; i++) {
                    var xx = document.getElementById(final2[i]);
                    myNode.appendChild(xx);

                }

            }
        </script>

        <script>
            function suck() {
                var lowlow = [];
                var medmed = [];
                var highhigh = [];
                var obj = document.getElementsByClassName("divClass");
                for (var j = 0; j < obj.length; j++) {
                    var allDivTd = obj[j].getElementsByTagName("TD");
                    if (allDivTd[3].id == 'Low') {

                        lowlow.push(obj[j].id);
                    } else if (allDivTd[3].id == 'Medium') {
                        medmed.push(obj[j].id);
                    } else {
                        //alert(allDivTd[3].id)
                        highhigh.push(obj[j].id);
                    }
//                for(var i = 0; i < allDivTd.length; i++){
//                var td = allDivTd[i].id;
//                if(td == 'Low'){
//                            alert(obj[j].id +"" +td);
//                }
//                }
//                alert('next');
                }
                //alert(lowlow);
//            alert(medmed);
//            alert(highhigh);
                var final1 = medmed.concat(lowlow);
                var final2 = highhigh.concat(final1);
//            alert(final2);

                var myNode = document.getElementById('mainmain');
//            while (myNode.firstChild) {
//                myNode.removeChild(myNode.firstChild);
//                }

                for (var i = 0; i < final2.length; i++) {
                    var xx = document.getElementById(final2[i]);
                    myNode.appendChild(xx);

                }

            }
        </script>

    </head>
    <body>
        <section id="main-content">
            <section class="wrapper">
                <!--Error/success display-->
                <%
                    ArrayList<String> pListString = DefectDAO.retrieveDevDistinctProject(dev.getUsername());
                    String errorMsg = (String) request.getAttribute("err");
                    String sucess = (String) request.getAttribute("sucess");
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
                <%}
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
                    if (errorList != null && !errorList.isEmpty()) {%>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="alert alert-block alert-danger fade in">
                                <button data-dismiss="alert" class="close close-sm" type="button">
                                    <i class="fa fa-times"></i>
                                </button>
                                <%=errorList%>
                            </div>
                        </section>
                    </div>
                </div>
                <% }
                %>
                <!--End of error/success display-->

                <%
                    String sort = request.getParameter("sort");
                    ArrayList<Defect> dList = null;
                    //ArrayList<Defect> dList = DefectDAO.retrieveAllocatedDev(dev.getUsername());
                    if (sort == null) {
                        dList = DefectDAO.retrieveAllIncompleteByMonth(3, dev.getUsername());
                    } else {
                        dList = DefectDAO.retrieveAllIncompleteByMonth(Integer.parseInt(sort), dev.getUsername());
                    }
                %>
                

                <div class="row">
                    <div class="col-lg-12" id="mainmain"> 
                        <section class="panel">
                            <div class="panel-body">
                                <span class="pull-right top-menu">
                                    <form class="form-inline" role="form" action="viewDefects.jsp">
                                        <div class="form-group">View:
                                            <select name="sort" class="form-control" onchange="this.form.submit()">
                                                <%if (sort == null) {%>
                                                <option value="3" selected>Last 3 months</option>
                                                <option value="6">Last 6 months</option>
                                                <option value="9">Last 9 months</option>
                                                <option value="12">Last 12 months</option>
                                                <%} else {
                                                    for (int i = 3; i <= 12; i += 3) {
                                                        if (Integer.parseInt(sort) == i) {%>
                                                <option value="<%=i%>" selected="selected">Last <%=i%> months</option>
                                                <%} else {%>
                                                <option value="<%=i%>" >Last <%=i%> months</option>
                                                <%
                                                            }
                                                        }
                                                    }%>
                                            </select>
                                        </div>
                                    </form>


                                    <!--                            Defect severity:
                                                                <button onclick="fuck()" class="btn btn-round btn-primary btn-sm"><i class="fa fa-sort-amount-asc"></i> Sort Ascending</button> &nbsp;
                                                                <button onclick="suck()" class="btn btn-round btn-primary btn-sm"><i class="fa fa-sort-amount-desc"></i> Sort Descending</button>
                                    -->
                                </span></div></section>

                                                <div id="content">
                        <%
                                int counter = 0;                
                                for (String p : pListString) {
                                if (DefectDAO.retrieveAllByProjectOne(p,dev.getUsername()).size() != 0) {
                                    counter++;
                        %>
                        <div class="row divClass z" id="<%=p%>">
                            <div class="col-sm-12">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <%=p%> 
                                        <span class="tools pull-right">
                                            <a title='Collapse this box' href="javascript:;" class="fa fa-chevron-down"></a>
                                        </span>
                                    </header>
                                    <div class="panel-body">
                                        <%
                                            int count = 0;
                                            for (Defect d : dList) {
                                                int sev = d.getSeverity();
                                                String severity = "";
                                                if (sev == 1) {
                                                    severity = "Low";
                                                } else if (sev == 2) {
                                                    severity = "Medium";
                                                } else if (sev == 3) {
                                                    severity = "High";
                                                }
                                                
                                                if (p.equalsIgnoreCase(d.getProjectName()) && (d.getIsComplete() == 0 || d.getIsComplete() == 2)) {%>
                                                <a href='viewDefectInfo.jsp?defectId=<%=d.getId()%>' title='<%=d.getDefectName()%>'>
                                        <%
//                                                out.println("<a title='" + d.getDefectName() + "' href='viewDefectInfo.jsp?defectId=" + d.getId() + ">");
//                                                  out.println("<a href='viewDefectInfo.jsp?defectId=" + d.getId() + "'>");
                                                    if (d.getIsComplete() == 1) { %>
                                        <div class='col-lg-4 col-sm-4'> 
                                            <div class="alert alert-success fade in"> 
                                                    <% } else if (d.getIsComplete() == 2) { %> 
                                                <div class='col-lg-4 col-sm-4'> 
                                                    <div class="alert alert-warning fade in"> 
                                                        <% } else if (d.getIsComplete() == 0) { %>
                                                        <div class='col-lg-4 col-sm-4'> 
                                                            <div class="alert alert-danger fade in"> 
                                                                <% }
                                                                %>
                                                                <%
                                                                    String dName;
                                                                    if (d.getDefectName().length() > 18) {
                                                                        dName = d.getDefectName().substring(0, 18) + "...";
                                                                    } else {
                                                                        dName = d.getDefectName();
                                                                    }%>
                                                                    
                                                                <%out.println("<table border='0' width='100%'><tr><td style='text-align:right; padding-right: 5px;'><b>Defect Name: </b></td><td style='text-align:left'> " + dName + "</td></tr>");
                                                                    out.println("<tr><td style='text-align:right; padding-right: 5px;'><b>Severity: </b></td><td style='text-align:left' id='" + severity + "'> " + severity + "</td></tr>");
                                                                    //out.println("<tr><td><b>Date: </b></td><td> " + d.getUpdateTime().subSequence(0, 16) + "</td></tr>");
                                                                %>
                                                                <tr><td style='text-align:right; padding-right: 5px;'><b>Duedate: </b></td><td style='text-align:left'><span class="time" data-datetime="<%=d.getDuedate()%>" data-format="Do MMM YYYY"></span></tr>
                                                                <tr><td style='text-align:right; padding-right: 5px;'><b>PM:</b></td><td style='text-align:left'><%=d.getReportedBy()%></td></tr>

                                                                <%out.println("</table>");

                                                                %> 
                                                            </div>
                                                        </div>
                                                        </a>
                                                        <%                                                                count++;
                                                                }
                                                            }
                                                            if (count == 0) {
                                                                out.println("<a href='addDefect.jsp'>No defects found <i>yet</i>. <br/>Add one?</a>");
                                                            }

                                                            count = 0;

                                                        %>
                                                    </div>
                                                    </section>
                                                </div>
                                            </div>
                                                    
                                        
                                            <% }
                                                
                }%>
                                
                                
                                            </div>
                                                    <div class="dataTables_paginate paging_bootstrap pagination" id="pagingControls"></div>
                                       <%     if(counter<=0){%>
                                    
                <div class="row">
                    <div class="col-lg-12"> 
                        <div class="row">
                            <div class="col-md-12">
                                <section class="panel">
                                    <div class="alert alert-block alert-danger fade in">
                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                            <i class="fa fa-times"></i>
                                        </button>
                                        No defects found
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
               
                               <% }
                                            %>
                                            <!--end of kw codes-->
                                            </section>
                                        </div>
                                    </div>
                                </section>
                                </section>
                                </table>
                                </body>
                                </html>
                                <script>
                                    $(document).ready(function () {
                                        $('.time').each(function () {
                                            var $this = $(this),
                                                    dt = moment($this.data('datetime')),
                                                    format = $this.data('format'),
                                                    formatted = dt.format(format);

                                            $this.html('<span class="time">' + formatted + '</span>');
                                        });
                                    });
                                </script>
                                <script type="text/javascript">
var pager = new Imtech.Pager();
$(document).ready(function() {
    pager.paragraphsPerPage = 5; // set amount elements per page
    pager.pagingContainer = $('#content'); // set of main container
    pager.paragraphs = $('div.z', pager.pagingContainer); // set of required containers
    pager.showPage(1);
});
</script>
<style>
    
 
.example{background:#FFF;width:1000px;font-size:80%;border:1px #000 solid;margin:0.5em 10% 0.5em;padding:1em 2em 2em;-moz-border-radius:3px;-webkit-border-radius:3px}

#content p{text-indent:20px;text-align:justify;}
#pagingControls ul{display:inline;padding-left:0.5em}
#pagingControls li{display:inline;padding:0 0.5em}
    
</style>