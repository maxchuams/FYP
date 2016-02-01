<%-- 
    Document   : select2example.jsp
    Created on : Feb 1, 2016, 9:42:59 PM
    Author     : KIANLAM
--%>
<%@page import="src.model.Developer"%>
<%@page import="src.model.DeveloperDAO"%>
<%@page import="src.model.Project"%>
<%@page import="src.model.ProjectDAO"%>
<%@page import="src.model.ProjectDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript"  src="http://code.jquery.com/jquery-1.10.2.js"></script>
        <link href="res/select2/css/select2.css" rel="stylesheet"/>
        <script src="res/select2/js/select2.js"></script>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recco Select2Example</title>

        <script>
            $(function () {
                // turn the element to select2 select style
                $('select').select2();

                $(".devSelect2").select2(
                        {
                            placeholder: "Select a developer"
                        }
                );

                $(".projectSelect2").select2(
                        {
                            placeholder: "Select a projecr"
                        }
                );
            });
        </script>

    </head>
    <body>
        <h1>Select2Example</h1>
        <p>Developer:</p>
        <p>
            <%
                ArrayList<Developer> dList = DeveloperDAO.retrieveDevelopers();
            %>

            <select class="devSelect2" style="width:300px">
                <%for (Developer d : dList) {%>
                <option value='<%=d.getUsername()%>'><%=d.getUsername()%></option>
                <%}%>
            </select>
        </p>



        <p>Project:</p>
        <p>
            <%
                ArrayList<Project> pList = ProjectDAO.retrieveAll();
            %>

            <select id="projectSelect2" style="width:300px">
                <%for (Project p : pList) {%>
                <option value='<%=p.getName()%>'><%=p.getName()%></option>
                <%}%>
            </select>
        </p>




















        <br><br><br><br>
        <br><br><br><br>
        <br><br><br><br>
        <br><br><br><br>
        <br><br><br><br>




        <p>Example, dont use: select2 select box:</p>
        <p>
            <select id="select2" style="width:300px">
                <optgroup label="Type 1 Developer">
                    <option value="AK">Ah tiong</option>
                    <option value="HI">Ah neh</option>
                    <option value="HI">Siam</option>
                </optgroup>
                <optgroup label="Type 2 Developer">
                    <option value="CA">Chee Bai</option>
                    <option value="NV">Lan Jiao</option>
                </optgroup>
                <optgroup label="Type 3 Developer">
                    <option value="AZ">Tom</option>
                    <option value="CO">Dick</option>
                    <option value="ID">Hairy</option>
                </optgroup>

            </select>
        </p>
    </body>
</html>



