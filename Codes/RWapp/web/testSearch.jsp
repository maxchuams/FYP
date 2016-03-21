<%-- 
    Document   : testSearch
    Created on : 16 Feb, 2016, 5:20:07 PM
    Author     : Lau Guo Xi
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <%
        ArrayList<String> xx = new ArrayList<String>();
        xx.add("xxx");
        xx.add("yyy");
        xx.add("zzz");
        xx.add("aaa");
        xx.add("bbb");
        
    %>
    
    <body>
        <h1>Hello World!</h1>
        
        <div id="users">
  <input class="search" placeholder="Search" />
  <button class="sort" data-sort="born">
    Sort by name
  </button>

  <ul class="list">
    <li>
      <h3 class="name">Jonny Stromberg</h3>
      <p class="born">1986</p>
    </li>
    <li>
      <h3 class="name">Jonas Arnklint</h3>
      <p class="born">1985</p>
    </li>
    <li>
      <h3 class="name">Martina Elm</h3>
      <p class="born">1996</p>
    </li>
    <li>
      <h3 class="name">Gustaf Lindqvist</h3>
      <p class="born">1993</p>
    </li>
  </ul>

</div>
<script src="http://listjs.com/no-cdn/list.js"></script>
<script>
var options = {
  valueNames: [ 'name', 'born' ]
};

var userList = new List('users', options);
    </script>        
        
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tinysort/2.2.4/tinysort.js"></script>
    
    
    
    
    
    
    </body>
</html>
