<%-- 
    Document   : search
    Created on : Jan 19, 2016, 5:57:42 PM
    Author     : maxchua
--%>
<%@include file="protect.jsp" %>
<%@page import="src.model.Person"%>
<%@page import="src.model.PersonDAO"%>
<%@page import="src.model.Defect"%>
<%@page import="src.model.DefectDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.model.Project"%>
<%@page import="src.model.ProjectDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String thisPage = "search"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
                <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>-->
        <script type="text/javascript">
            $.expr[":"].contains = $.expr.createPseudo(function (arg) {
                return function (elem) {
                    return $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0;
                };
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                var $rows = $("tr");

                $("#search").keyup(function () {
                    var val = $.trim(this.value);
                    if (val === "")
                        $rows.show();
                    else {
                        $rows.hide();
                        $rows.has("td:contains(" + val + ")").show();
                    }
                });
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#dev').hide(); //hide field on start
                $('#def').hide();
                $('#prof').hide();
                $('#role').change(function () {

                    var $index = $('#role').index(this);
                    if ($('#role').val() == 'projname') { //if this value is NOT selected
                        $('#proj').show();
                        $('#def').hide();
                        $('#dev').hide();//this field is hidden
                    }
                    if ($('#role').val() == 'defname') { //if this value is NOT selected
                        $('#proj').hide();
                        $('#dev').hide();
                        $('#def').show();//this field is hidden
                    }
                    if ($('#role').val() == 'devname') { //if this value is NOT selected
                        $('#proj').hide();
                        $('#dev').show();
                        $('#def').hide();//this field is hidden
                    }
                });
            });
        </script>
        <title>Search</title>
    </head>
    <body>
        <section id="main-content">
            <section class="wrapper">
                <div class="row">
                    <div class="col-sm-12">
                        <section class="panel">
                            <header class="panel-heading">
                                Search
                            </header>
                            <div class="panel-body">
                                <%
                                    ArrayList<Project> pList = ProjectDAO.retrieveAll();
                                    ArrayList<Defect> defList = DefectDAO.retrieveAll();
                                    ArrayList<Person> devList = PersonDAO.retrievAllDev();
                                %>
                                <label class="control-label col-lg-2" for="inputSuccess">Search for:</label>

                                <div class="col-lg-3">
                                    <input id="search" type="text" class="form-control">
                                </div>
                                <div class="col-lg-3">
                                    <select id="role" name="category" class="form-control">
                                        <option value="projname">Projects</option>
                                        <option value="devname">Developers</option>
                                        <option value="defname">Defects</option>
                                    </select>
                                </div>

                            </div>

                        </section>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <!--                        <section class="panel">-->
                        <!--                            <div class="panel-body">-->
                        <div id="proj">
                            <div class="col-md-12">
                                <div class="well">
                                    Results found under "Projects"
                                </div>
                            </div>

                            <table width="100%">
                                <%
                                    for (Project p : pList) {
                                %>
                                <tr>
                                    <td class="col-md-4">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">
                                                Project <%=p.getName()%>
                                                <span class="tools pull-right">
                                                </span>
                                            </div>
                                            <div class="panel-body">
                                                <ul class="nav nav-pills nav-stacked">
                                                    <li> <span class="badge label-danger pull-left r-activity"><i class="fa fa-bell-o"></i>  <%=p.getDuedate()%></span></li>
                                                    <span class="pull-right">
                                                        <li> <b>Type:</b> <%=p.getType()%> </li>
                                                            <% if (dev != null && pm == null) {%>
                                                        <li> <b>Assigned by:</b> <%=p.getAssignedBy()%> <%}%></li>
                                                    </span>
                                                </ul>
                                            </div>
                                        </div>
                                    </td>

                                </tr>
                                <%
                                    }

                                %>
                            </table>
                        </div>
                        <div id="dev">
                            <div class="col-md-12">
                                <div class="well">
                                    Results found under "Developers"
                                </div>
                            </div>
                            <table>
                                <%                    for (Person p : devList) {
                                %>
                                <tr>

                                    <td><%=p.getUsername()%></td>

                                </tr>
                                <%
                                    }

                                %>
                            </table>
                        </div>
                        <div id="def">
                            <div class="col-md-12">
                                <div class="well">
                                    Results found under "Defects"
                                </div>
                            </div>
                            <table>
                                <%                    for (Defect p : defList) {
                                %>
                                <tr>

                                    <td><%=p.getDefectName()%></td>

                                </tr>
                                <%
                                    }

                                %>
                            </table>
                        </div>
                        <!--        <table>
                                    <tr>
                                        <td>FredF</td>
                                        <td>Fred Flintstone</td>
                                        <td><input type="checkbox" name="userId" value="@user.UserId" /></td>
                                    </tr>
                                    <tr>
                                        <td>BarneyR</td>
                                        <td>Barney Rubble</td>
                                        <td><input type="checkbox" name="userId" value="@user.UserId" /></td>
                                    </tr>
                                    <tr>
                                        <td>FredF</td>
                                        <td>Fred Flintstone</td>
                                        <td><input type="checkbox" name="userId" value="@user.UserId" /></td>
                                    </tr>
                                </table>-->
                    </div>
                    <!--                        </section>-->
                    <!--                    </div>-->
                </div>
                <div>
            </section>
        </section>
    </body>
</html>
