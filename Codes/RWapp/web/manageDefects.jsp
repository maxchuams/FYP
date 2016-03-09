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
<%@include file="protectPMandTester.jsp" %>
<%String thisPage = "manageDefects"; //This is to change the highlight in Navigation Bar%>
<%String selected = null;%>
<%@include file="navbar.jsp"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Defects</title>
        <script src="js/moment.js"></script>
        <script>
            moment().format();
        </script>
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
        <script type="text/javascript">
            function confirmDelete(x) {
                var agree = confirm("Are you sure you want to delete this defect?");
                if (agree) {
                    window.location = x;
                } else {
                    return false;
                }
            }
        </script>
        
        <script>
            function fuck(){
                var lowlow = [];
                var medmed = [];
                var highhigh = [];
            var obj = document.getElementsByClassName("divClass");
            for (var j = 0; j < obj.length; j++) {
                var allDivTd = obj[j].getElementsByTagName("TD");
                if(allDivTd[3].id == 'Low'){
                    
                    lowlow.push(obj[j].id);
                }else if(allDivTd[3].id == 'Medium'){
                    medmed.push(obj[j].id);
                }else{
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
            
            for(var i = 0; i < final2.length; i++){
                var xx = document.getElementById(final2[i]);
                myNode.appendChild(xx);
                
            }
            
        }
        </script>
        
        <script>
            function suck(){
                var lowlow = [];
                var medmed = [];
                var highhigh = [];
            var obj = document.getElementsByClassName("divClass");
            for (var j = 0; j < obj.length; j++) {
                var allDivTd = obj[j].getElementsByTagName("TD");
                if(allDivTd[3].id == 'Low'){
                    
                    lowlow.push(obj[j].id);
                }else if(allDivTd[3].id == 'Medium'){
                    medmed.push(obj[j].id);
                }else{
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
            
            for(var i = 0; i < final2.length; i++){
                var xx = document.getElementById(final2[i]);
                myNode.appendChild(xx);
                
            }
            
        }
        </script>
        
    </head>
    <body>

        <%  String errorMsg = (String) request.getAttribute("err");
            String sucess = (String) request.getAttribute("sucess");
            ArrayList<String> errorMsg1 = (ArrayList<String>) request.getAttribute("err1"); %>

        <section id="main-content">
            <section class="wrapper">
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
                <%if (errorMsg1 != null) {%>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="alert alert-block alert-danger fade in">
                                <button data-dismiss="alert" class="close close-sm" type="button">
                                    <i class="fa fa-times"></i>
                                </button>
                                <%=errorMsg1%>
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
                <%
                    Person per = null;
                    if(session.getAttribute("loggedInPm")!=null){
                        per = (Person)session.getAttribute("loggedInPm");
                    }else{
                        per = (Person)session.getAttribute("loggedInTester");
                    }
                %>
                <div class="row">
                    <div class="col-lg-12" id="mainmain">
                        <section class="panel">
                            <div class="panel-body">
                        <!--kaiwen codes-->

                        <%
                            //ArrayList<Project> pList = ProjectDAO.retrieveAll();
                            ArrayList<String> pListString = DefectDAO.retrieveDistinctProject();
                            ArrayList<Defect> dList = null;
                            if(pm!=null){
                                //dList = DefectDAO.retrievePm(pm.getUsername());
                                dList = DefectDAO.retrieveAll();
                            }else{
                                dList = DefectDAO.retrieveTester();
                            }
                        %><span class="pull-right top-menu">
                            Defect severity:
                        <button onclick="fuck()" class="btn btn-round btn-primary btn-sm"><i class="fa fa-sort-amount-asc"></i> Sort Ascending</button> &nbsp;
                        <button onclick="suck()" class="btn btn-round btn-primary btn-sm"><i class="fa fa-sort-amount-desc"></i> Sort Descending</button>
                        </span>
                            </div>
                        </section>
                        
                        <%for (String s : pListString) {%>
                        <div class="row divClass" id="<%=s%>">
                            <div class="col-sm-12">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <%=s%>
                                        <span class="tools pull-right">
                                            <a href="addDefect.jsp?name=<%=s%>" class="fa fa-plus-circle"></a>
                                            <a href="javascript:;" class="fa fa-chevron-down"></a>
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
                                                if (s.equalsIgnoreCase(d.getProjectName()) && (d.getIsComplete()==0 || d.getIsComplete()==1)) {
                                                    if (pm != null) {
                                                        out.println("<a href='viewDefectInfo.jsp?defectId=" + d.getId() + "'>");
                                                        if (d.getIsComplete() == 2) { %>
                                        <div class='col-lg-4 col-sm-4'> 
                                            <div class="alert alert-success fade in"> 
                                                <% } else if (d.getIsComplete() == 1) {
                                                %> 
                                                <div class='col-lg-4 col-sm-4'> 
                                                    <div class="alert alert-warning fade in"> 
                                                        <% } else if (d.getIsComplete() == 0) { %>
                                                        <div class='col-lg-4 col-sm-4'> 
                                                            <div class="alert alert-danger fade in"> 
                                                                <% }
                                                                %>
                                                                <%String dName;
                                                                    if (d.getDefectName().length() > 18) {
                                                                        dName = d.getDefectName().substring(0, 18) + "...";
                                                                    } else {
                                                                        dName = d.getDefectName();
                                                                    }
                                                                        out.println("<table border='0' width='100%'><tr><td><b>Defect Name: </b></td><td> " + dName + "</td></tr>");
                                                                        out.println("<tr><td><b>Severity: </b></td><td id='"+severity+"'> " + severity + "</td></tr>");%>
                                                                        <tr><td><b>Created: </b></td><td><span class="time" data-datetime="<%=d.getUpdateTime()%>" data-format="Do MMM YYYY"></span></tr>
                                                                        <tr><td><b>Duedate: </b></td><td><span class="time" data-datetime="<%=d.getDuedate()%>" data-format="Do MMM YYYY"></span></tr>
                                                                        <tr><td><b>PM:</b></td><td><%=d.getReportedBy()%></td></tr>
                                                                        <tr><td><b>Assigned to:</b></td><td><%=d.getAssignto()%></td></tr>
                                                                                
                                                                                
                                                                        <%out.println("</table>");
                                                                    }
                                                                %> 
                                                            </div>
                                                        </div>
                                                        </a>
                                                        <%
                                                                    count++;
                                                                }
                                                            }
                                                            if (count == 0) {
                                                                out.println("<a href='addDefect.jsp?name=" + s + "'>No defects found <i>yet</i>. <br/><br/><button type='button' class='btn btn-round btn-primary'>Add a defect</button></a>");
                                                            }

                                                            count = 0;

                                                        %>
                                                    </div>
                                                    </section>
                                                </div>
                                            </div>
                                            <% } %>

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
$(document).ready(function() {
    $('.time').each(function() {
        var $this = $(this),
            dt = moment($this.data('datetime')),
            format = $this.data('format'),
            formatted = dt.format(format);
            
            $this.html('<span class="time">' + formatted + '</span>');
    });
});
</script>