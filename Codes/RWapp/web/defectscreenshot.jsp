<%@page import="src.model.DefectScreenshotDAO"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="src.model.DisplayPictureDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html">
        <title>Manage Screenshot</title>
    </head>
    <body>
        <h1>Screenshot for defect</h1>
 <a href="index.jsp">home</a>
        <%
            String idDef = (String) request.getParameter("id");
            
            String err = (String) request.getParameter("err");
            
            if(err!=null){
                out.println(err);
            }
            %>
       

        <form method="post" action="DefectScreenshotController" enctype="multipart/form-data">
            <center>
                <table border="1" width="25%" cellpadding="5">
                    <thead> 
                    <th colspan="3">Upload File</th>        
                    </thead>
                    <tbody>
                          
                            
                       
                        <tr>
                            <td>Choose File : </td>
                            <td><input type="file" name="file_uploaded" /></td>
                        </tr>
                        <tr>
                            <td><input type="hidden" value='<%=idDef%>' name="defectid" size="30">
                            <td colspan="3"><center><input type="submit" value="Upload"></center></td>
                    </tr>
                    </tbody>             
                </table>
            </center>
        </form>



        
        <%
            

            ArrayList<String> timestamps = DefectScreenshotDAO.getScreenshotTimestamp(idDef);
            for (String stamp : timestamps) {
        %>
        <img src='DefectScreenshotServlet?defectid=<%=idDef%>&updatetime=<%=stamp%>' align="center"/>
        <br/>Defect ID: <%=idDef%>_<%=stamp%>

        <form method="POST"  action="DefectScreenshotController" enctype="multipart/form-data" >

            <label>Delete Image</label>
            <input type='hidden' name="updatetime" value='<%=stamp%>'>
            <input type='hidden' name="delete" value="delete">
            <input type='hidden' name="d" value='delete'>
            <input type='hidden' name='defectid' value='<%=idDef%>'>
            <button  type='submit'>Delete</button>
        </form>
        <%}%>
        </br>

    </body>
</html>
