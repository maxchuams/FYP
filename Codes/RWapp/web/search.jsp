<%-- 
    Document   : search
    Created on : Jan 19, 2016, 5:57:42 PM
    Author     : maxchua
--%>

<%@page import="src.model.Person"%>
<%@page import="src.model.PersonDAO"%>
<%@page import="src.model.Defect"%>
<%@page import="src.model.DefectDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.model.Project"%>
<%@page import="src.model.ProjectDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
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
        <title>Sup</title>

    </head>
    <body>
        <h1>Search something</h1>

        <%
            ArrayList<Project> pList = ProjectDAO.retrieveAll();
            ArrayList<Defect> defList = DefectDAO.retrieveAll();
            ArrayList<Person> devList = PersonDAO.retrievAllDev();
        %>
        <label>Quick Search: <input id="search" type="text"></label>
        <select id="role" name="category">
            <option value="projname">Projects</option>
            <option value="devname">Developers</option>
            <option value="defname">Defects</option>

        </select>
        <div id="proj">
            </br><h2>Looking for Projects:</h2></br>
            <table>
                <%
                    for (Project p : pList) {
                %>
                <tr>

                    <td><%=p.getName()%></td>

                </tr>
                <%
                    }

                %>
            </table>
        </div>
         <div id="dev">
            </br><h2>Looking for developers</h2></br>
            <table>
                <%
                    for (Person p : devList) {
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
            </br><h2>Looking for Defects</h2></br>
            <table>
                <%
                    for (Defect p : defList) {
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
    </body>
</html>
