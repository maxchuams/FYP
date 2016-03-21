<%-- 
    Document   : addDefect
    Created on : Dec 10, 2015, 8:54:13 PM
    Author     : maxchua
--%>
<%@page import="java.util.HashMap"%>
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
        <link href="js/skins/minimal/green.css" rel="stylesheet">
        <link href="js/skins/square/green.css" rel="stylesheet">
        <link href="js/skins/flat/green.css" rel="stylesheet">
        <script src="js/icheck.js"></script>

        <script>
            <%
                ProjectDAO pp = new ProjectDAO();
                ProjectAllocationDAO aa = new ProjectAllocationDAO();
                ArrayList<Project> allp = pp.retrieveAll();
                ArrayList<String> zz = new ArrayList<String>();
                ArrayList<String> yy = new ArrayList<String>();
                for (Project cheebye : allp) {
                    ArrayList<String> dd = aa.retrieveDev(cheebye.getName());
                    String toR = "";
                    if (dd.size() > 1) {
                        toR = dd.get(0);
                        for (int i = 1; i < dd.size(); i++) {
                            toR = toR + "," + dd.get(i);
                        }
                        zz.add(cheebye.getName());
                        yy.add(toR);
                    } else if (dd.size() == 1) {
                        toR = dd.get(0);
                        zz.add(cheebye.getName());
                        yy.add(toR);
                    }
                    //System.out.println(dd);
                }

//            List<String> strList = new ArrayList<String>();
//            strList.add("one");
//            strList.add("two");
//            strList.add("three"); 
            %>

            var jsArray = [<% for (int i = 0; i < zz.size(); i++) {%>"<%= zz.get(i)%>"<%= i + 1 < zz.size() ? "," : ""%><% } %>];
                    var jjArray = [<% for (int i = 0; i < yy.size(); i++) {%>"<%= yy.get(i)%>"<%= i + 1 < yy.size() ? "," : ""%><% } %>];
                    function jsFunction() {
                        var myselect = document.getElementById("projectname");
                        var toCompare = myselect.options[myselect.selectedIndex].value;
                        //alert(toCompare);
                        var indexofP = "";
                        var myNode = document.getElementById("test1");
                        while (myNode.firstChild) {
                            myNode.removeChild(myNode.firstChild);
                        }
                        var nodenode = document.getElementById("test");
                        if (myNode.firstChild != myNode) {
                            nodenode.removeChild(nodenode.firstChild);
                        }
                        for (var i = 0; i < jsArray.length; i++) {
                            if (jsArray[i] === toCompare) {
                                indexofP = i;
//                        alert(indexofP);
//                        alert(toCompare);
                            }
                        }
                        var toPut = jjArray[indexofP];
                        //alert(jsArray);
                        var putput = toPut.split(",");
                        //alert(putput);

                        if (putput.length != 0) {

                            var divdivy = document.getElementById('test');
                            var ccb = document.createElement('label');
                            ccb.className = "col-lg-3 control-label";
                            ccb.appendChild(document.createTextNode("Developer(s) Fault: "));
                            divdivy.insertBefore(ccb, divdivy.firstChild);

                            for (var j = 0; j < putput.length; j++) {
                                // alert(putput[j]);
                                var divdiv = document.getElementById('test1');
                                var cb = document.createElement('input');
                                cb.type = 'checkbox';
                                divdiv.appendChild(cb);
                                cb.name = "blame";
                                cb.value = putput[j];
                                cb.id = 'x';
                                var label = document.createElement('label')
                                label.htmlFor = "blame";
                                label.id = 'y'
                                label.appendChild(document.createTextNode(putput[j]));
                                divdiv.appendChild(label);
                                var foo = document.createTextNode("\u00A0");
                                divdiv.appendChild(foo);
                                //cb.appendChild(document.createTextNode(putput[j]));
                                //opt.value = putput[j];
//                opt.innerHTML = "aaa";
                                //}
//                var labelvar = document.getElementById('yesnos');
//                labelvar.innerHTML = putput[j];
                            }
                        }
//                var opt= document.getElementById('test1').options[1];
//                opt.value = 'sex';
//                opt.text = 'sex';
                    }
            ;

        </script>
        <script>
            $(function () {
                // turn the element to select2 select style
//                $('select').select2();

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
            Person per = null;
            if (session.getAttribute("loggedInPm") != null) {
                per = (Person) session.getAttribute("loggedInPm");
            } else {
                per = (Person) session.getAttribute("loggedInTester");
            }
            HashMap<String, String> form = (HashMap<String, String>) request.getAttribute("formdetails");

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
                                        <select name="projectname" id='projectname' class="projectSelect2 form-control m-bot15" onchange="jsFunction()">
                                            <%
                                                //ArrayList<String> pList = ProjectAllocationDAO.retrieveInProgress();
                                                ArrayList<Project> pList = ProjectDAO.retrieveAll();
                                                if (form != null) {
                                                    name = form.get("projectname");
                                                }
                                            %><option selected="selected">
                                                <%           for (Project p : pList) {
                                                        if (name != null && name.equalsIgnoreCase(p.getName())) {%>
                                            <option value='<%=p.getName()%>' selected="selected"><%=p.getName()%></option>
                                            <%} else {
                                            %>
                                            <option value='<%=p.getName()%>'><%=p.getName()%></option>
                                            <%
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <p></p>

                                    <% if (form != null) {%>
                                    <label for="inputType" class="col-lg-3 control-label">Developer(s) Fault: </label>
                                    <div class="col-lg-9">
                                        <%
                                            ArrayList<String> devListForProj = ProjectAllocationDAO.retrieveDev(form.get("projectname"));
                                            for (String d : devListForProj) {
                                        %>
                                        <input type='checkbox' name='blame' class="form-control m-bot15" value='<%=d%>'/><%=d%> </br>
                                        <%
                                            }

                                        %>
                                    </div>
                                    <%} else if(name != null) {%>
                                    <label for="inputType" class="col-lg-3 control-label">Developer(s) Fault: </label>
                                    <div class="col-lg-9">
                                        <%
                                            ArrayList<String> devListForProj = ProjectAllocationDAO.retrieveDev(name);
                                            for (String d : devListForProj) {
                                        %>
                                        <input type='checkbox' name='blame' class="form-control m-bot15" value='<%=d%>'/><%=d%> </br>
                                        <%
                                            }

                                        %>
                                    </div>
                                    <%} else {%>
                                    <div id='test'>
                                        <div class="col-lg-9" id="test1">
                                        </div>   
                                    </div>
                                    
                                    <%}%>
                                    <br/><br/>

                                    <label for="inputType" class="col-lg-3 control-label">Let pre-assigned developer fix? </label>
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
                                        <label for="inputEmail1" class="col-lg-3 control-label">Select new developer to fix</label>
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
                                            <%
                                                if (form != null) {
                                                    String defectname = form.get("defname");
                                            %>
                                            <input type="text" name="defname" required class="form-control" id="defname" value='<%=defectname%>'placeholder="" required>
                                            <%
                                            } else {
                                            %>
                                            <input type="text" name="defname" required class="form-control" id="defname" placeholder="" required>
                                            <%}%>
                                            <p></p>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="inputEmail1" class="col-lg-3 col-sm-2 control-label">Due Date</label>
                                        <div class="col-lg-9">
                                            <%
                                                if (form != null) {
                                                    String duedate = form.get("duedate");
                                            %>
                                            <input type="date" class="form-control m-bot12" value='<%=duedate%>' name="duedate" required/>
                                            <%
                                            } else {
                                            %>
                                            <input type="date" class="form-control m-bot12" name="duedate" required/>
                                            <%}%>
                                            <p></p>
                                        </div>
                                    </div>   


                                    <div class="form-group">
                                        <label for="inputEmail1" class="col-lg-3 control-label">Description</label>
                                        <div class="col-lg-9">
                                            <%
                                                if (form != null) {
                                                    String desc1 = form.get("desc");
                                            %>
                                            <textarea class="form-control" rows="4" id="desc"  name="desc" required><%=desc1%></textarea>
                                            <%
                                            } else {
                                            %>
                                            <textarea class="form-control" rows="4" id="desc" name="desc" required></textarea>
                                            <%}%>
                                            <p></p>
                                        </div>
                                    </div>


                                    <label for="inputType" class="col-lg-3 control-label">Severity</label>
                                    <%
                                        if (form != null) {
                                            String severity = form.get("severity");
                                            if (("1").equals(severity)) {
                                    %>
                                    <div class="col-lg-1">
                                        <input type='radio' name='severity' checked="checked" value='1'/> Low <br/> 
                                    </div>
                                    <div class="col-lg-1">
                                        <input type='radio' name='severity' value='2'/> Med <br/> 
                                    </div>
                                    <div class="col-lg-1">
                                        <input type='radio' name='severity' value='3'/> High <br/> 
                                    </div>
                                    <%} else if (("2").equals(severity)) {
                                    %>
                                    <div class="col-lg-1">
                                        <input type='radio' name='severity'  value='1'/> Low <br/> 
                                    </div>
                                    <div class="col-lg-1">
                                        <input type='radio' name='severity' checked="checked" value='2'/> Med <br/> 
                                    </div>
                                    <div class="col-lg-1">
                                        <input type='radio' name='severity' value='3'/> High <br/> 
                                    </div>
                                    <%} else if (("3").equals(severity)) {
                                    %>
                                    <div class="col-lg-1">
                                        <input type='radio' name='severity'  value='1'/> Low <br/> 
                                    </div>
                                    <div class="col-lg-1">
                                        <input type='radio' name='severity'  value='2'/> Med <br/> 
                                    </div>
                                    <div class="col-lg-1">
                                        <input type='radio' name='severity' checked="checked" value='3'/> High <br/> 
                                    </div>
                                    <%}%>
                                    <%} else {%>
                                    <div class="col-lg-1">
                                        <input type='radio' name='severity' value='1'/> Low <br/> 
                                    </div>
                                    <div class="col-lg-1">
                                        <input type='radio' name='severity' value='2'/> Med <br/> 
                                    </div>
                                    <div class="col-lg-1">
                                        <input type='radio' name='severity' value='3'/> High <br/> 
                                    </div>
                                    <%}%>
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
