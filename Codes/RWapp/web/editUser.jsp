<%-- 
    Document   : manageUser
    Created on : Sep 14, 2015, 12:28:56 PM
    Author     : admin
--%>
<%@page import="src.model.Skill"%>
<%@page import="src.model.SkillDAO"%>
<%@page import="src.model.PersonDAO"%>
<%@page import="java.util.ArrayList"%>
<%@include file="protectSudo.jsp" %>
<%String thisPage = "manageUser"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recco</title>
    </head>
    <body>
        <%
            ArrayList<Person> users = (ArrayList<Person>) request.getAttribute("users");
            String username1 = request.getParameter("username");
            if (users == null) {

                users = PersonDAO.retrieveUsers();

            }
            if (users != null) {

                Person p = PersonDAO.retrieveUser(username1);
        %>
        <section id="main-content">
            <section class="wrapper">

                <!--Error/success display-->
                <%  String errorMsg = (String) request.getAttribute("err");
                    String sucess = (String) request.getAttribute("sucess");

                    if (errorMsg != null) {
                %>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="panel-body">
                                <div class="text-danger"><%=errorMsg%></div>
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
                            <div class="panel-body">
                                <div class="text-success"><%=sucess%></div>
                            </div>
                        </section>
                    </div>
                </div>
                <%
                    }
                %>


                <!--End of error/success display--> 

                <!--Kaiwen's Code-->
                <div class="row">
                    <div class="col-md-12">
                        <!--widget start-->
                        <aside class="profile-nav alt">
                            <section class="panel">
                                <div class="user-heading alt terques-bg">
                                    <a href="#">
                                        <img alt="" src="ImageServlet?imageid=<%=username1%>">
                                    </a>


                                    <h1><font color="white"><%=p.getUsername()%></font></h1>
                                        <p><font color="white"><% String type = p.getType();
                                        if (type.equals("p")) {  %>Project Manager <% } else if (type.equals("c")) { %>Developer <% } else if (type.equals("d")) { %>Designer<% }%></font></p>
                                </div>
                                <div class="panel-body">      
                                    <i class="fa fa-pencil-square-o"></i> Update Trello Details

                                    <form action="updateTrelloDetails" method="POST">
                                        <div class="form-group">
                                            <label for="inputEmail1" class="col-lg-3 col-sm-3 control-label">Trello Key</label>
                                            <div class="col-lg-9">
                                                <input type="text" name="key" class="form-control" id="inputEmail1" placeholder="Key">
                                                <p class="help-block"></p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword1" class="col-lg-3 col-sm-3 control-label">Trello Token</label>
                                            <div class="col-lg-9">
                                                <input type="text" name="token" class="form-control" id="inputPassword1" placeholder="Token">
                                            </div>
                                        </div>
                                        <input type="hidden" name="user" value="<%=p.getUsername()%>"/>
                                        <div class="col-lg-offset-11 col-lg-1">
                                            <p></p>
                                            <input type="submit" class="btn btn-primary btn-xs" value="Update"></input>
                                        </div>
                                    </form>
                                </div>
                                <hr/>
                                <div class="panel-body">
                                    <i class="fa fa-pencil-square-o"></i> Change Password
                                    <form action="changeUserPassword" method="POST">
                                        <div class="form-group">
                                            <label for="inputEmail1" class="col-lg-3 col-sm-3 control-label">Password</label>
                                            <div class="col-lg-9">
                                                <input type="password" name="password1" class="form-control" id="inputEmail1" placeholder="Password">
                                                <p class="help-block"></p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword1" class="col-lg-3 col-sm-3 control-label">Confirm Password</label>
                                            <div class="col-lg-9">
                                                <input type="password" name="password2" class="form-control" id="inputPassword1" placeholder="Confirm Password">
                                            </div>
                                        </div>
                                        <input type="hidden" name="user" value="<%=p.getUsername()%>"/>
                                        <div class="col-lg-offset-11 col-lg-1">
                                            <p></p>
                                            <input type="submit" class="btn btn-primary btn-xs" value="Change"></input>
                                        </div>
                                    </form>
                                </div>
                                <%
                                    if (p.getType().equals("c")) {
                                        ArrayList<Skill> sList = SkillDAO.retrieveDevSkill(p.getUsername());

                                %><div class="panel-body"><form action="updateDevSkill" method="GET"><hr/>
                                        <i class="fa fa-pencil-square-o"></i> Update Developer Skills
                                        <div class="form-group"></div>
                                        <label for="inputEmail1" class="col-lg-3 col-sm-3 control-label">Developer Current Skills</label>
                                        <div class="col-lg-9">
                                            <% for (int i = 0; i < sList.size(); i++) {
                                                    Skill s = sList.get(i);
                                                    out.print(s.getSkill());
                                                    if (i != sList.size() - 1) {
                                                        out.print(", ");
                                                    }
                                                }

                                            %></div>

                                        <label for="inputEmail1" class="col-lg-12 col-sm-12 control-label"></label>
                                        <label for="inputEmail1" class="col-lg-3 col-sm-3 control-label">Add New Skill</label>
                                        <div class="col-lg-9">
                                            <select name="skills" class="form-control m-bot15">
                                                <option value="Wordpress">Wordpress</option>
                                                <option value="eCommerce">eCommerce</option>
                                                <option value="Custom">Custom</option>
                                            </select>
                                        </div>

                                        <input type="hidden" name="user" value="<%=p.getUsername()%>"/>
                                        <div class="col-lg-offset-11 col-lg-1">
                                            <input type="submit" class="btn btn-primary btn-xs" value="Add"></input>
                                        </div>
                                    </form>
                                </div>
                                <div class="panel-body">
                                    <p></p>
                                    <form action='removeDevSkill'>
                                        <label for="inputEmail1" class="col-lg-3 col-sm-3 control-label">Delete Skill</label>
                                        <div class="col-lg-9">
                                            <select name="skill" class="form-control m-bot15">
                                                <option value="Wordpress">Wordpress</option>
                                                <option value="eCommerce">eCommerce</option>
                                                <option value="Custom">Custom</option>
                                            </select>
                                        </div>
                                        <input type="hidden" name="user" value="<%=p.getUsername()%>"/>
                                        <div class="col-lg-offset-11 col-lg-1">
                                            <input type="submit" class="btn btn-primary btn-xs" value="Delete"></input>
                                        </div>
                                    </form>
                                </div>

                                <%}%>
                                <hr/>
                                <div class="panel-body">
                                    <form action="removeUser">
                                        <input type="hidden" name="user" value="<%=p.getUsername()%>"/>
                                        <button type="submit" class="btn btn-danger btn-block">Delete User</button>
                                    </form>
                                </div>

                            </section>
                            <% }
                            %>

                        </aside>
                        <!--widget end-->
                    </div>
                </div>
                </div>
                <!--End of KW's code-->


            </section>
        </section>
    </section>
</body>
</html>
