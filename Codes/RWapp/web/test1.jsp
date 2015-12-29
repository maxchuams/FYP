<%-- 
    Document   : test1
    Created on : Dec 29, 2015, 2:51:24 PM
    Author     : calvin
--%>

<%@page import="src.model.ProjectAllocation"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.model.ProjectAllocationDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <script src="bootstrap/jsgantt.js"></script>
        <link href="bootstrap/jsgantt.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <title>gnatt chart</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div style="position:relative" class="gantt" id="GanttChartDIV"></div>
        
        <%
            ProjectAllocationDAO paDAO = new ProjectAllocationDAO();
            ArrayList<ProjectAllocation> pA = paDAO.returnProject();
            out.println(pA.get(0).getProject());
            out.println(pA.get(0).getStartDate());
            out.println(pA.get(0).getEndDate());
        %>
        
        
        <script type="text/javascript">
            var g = new JSGantt.GanttChart('g',document.getElementById('GanttChartDIV'), 'day');
            var a = <%pA.get(0).getProject();%>
g.setShowRes(0); // Show/Hide Responsible (0/1)
g.setShowDur(1); // Show/Hide Duration (0/1)
g.setShowComp(0); // Show/Hide % Complete(0/1)
g.setCaptionType("Resource");  // Set to Show Caption (None,Caption,Resource,Duration,Complete)
g.setShowStartDate(1); // Show/Hide Start Date(0/1)
g.setShowEndDate(1); // Show/Hide End Date(0/1)
g.setDateInputFormat('mm/dd/yyyy')  // Set format of input dates ('mm/dd/yyyy', 'dd/mm/yyyy', 'yyyy-mm-dd')
g.setDateDisplayFormat('mm/dd/yyyy') // Set format to display dates ('mm/dd/yyyy', 'dd/mm/yyyy', 'yyyy-mm-dd')
g.setFormatArr("day","week","month","quarter") // Set format options (up to 4 : "minute","hour","day","week","month","quarter")



g.AddTaskItem(new JSGantt.TaskItem(1,a,'<%pA.get(0).getStartDate();%>','<%pA.get(0).getEndDate();%>','ff0000', 'http://help.com',0,'Brian',1, 0, 1));
g.AddTaskItem(new JSGantt.TaskItem(2,'Project Pj','2/10/2015', '2/11/2015','ff00ff', 'http://www.yahoo.com',0,'Shlomy', 1, 0, 1, "My Caption"));

g.Draw();	
g.DrawDependencies();

        </script>
        
         <script>    
        $(document).ready(function() {
            $.ajax({
                url : 'AjaxHandler', // servlet mapping ("web.xml")
                success : function(responseText) {
                    $('#ajaxHandlerResponse').text(responseText);
                        g.AddTaskItem(new JSGantt.TaskItem(1,a,'$('#ajaxHandlerResponse').text(responseText)';,'<%pA.get(0).getEndDate();%>','ff0000', 'http://help.com',0,'Brian',1, 0, 1));
                        g.Draw(); g.DrawDependencies();
                    }
            });
        });
    </script>
        
    Servlet's message: <span id="ajaxHandlerResponse"></span>
    
    </body>
</html>

