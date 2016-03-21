<%-- 
    Document   : test
    Created on : 18 Feb, 2016, 11:57:18 PM
    Author     : Lau Guo Xi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div data-order="30">30</div>
<div data-order="40">40</div>
<div data-order="10">10</div>
<div data-order="20">20</div>
<div data-order="1">1</div>
<button onclick=a()>Click</button>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
    function(a)
    (function($) {
    var $fields, $container, sorted, index;
  
    $container = $('body');
    $fields = $("div[data-order]", $container);
    sorted = [];
    $fields.detach().each(function() {
        sorted[parseInt(this.getAttribute("data-order"), 10)] = this;
    });
    sorted.forEach(function(element) {
        $container.append(element);
    });
})(jQuery);
    
</script>
    </body>
</html>
