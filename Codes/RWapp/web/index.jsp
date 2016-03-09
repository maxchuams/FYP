<%-- 
    Document   : index
    Created on : Sep 7, 2015, 1:30:53 PM
    Author     : admin
--%>
<%@page import="java.util.Date"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="src.model.Gnatt"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.model.GanttDAO"%>
<%@include file="protect.jsp" %>
<%String thisPage = "index"; //This is to change the highlight in Navigation Bar%>
<%@include file="navbar.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="src.model.Person"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recco</title>
        <link rel=stylesheet href="./bootstrap/platform.css" type="text/css">
        <link rel=stylesheet href="./bootstrap/libs/dateField/jquery.dateField.css" type="text/css">

        <link rel=stylesheet href="./bootstrap/gantt.css" type="text/css">
        <link rel=stylesheet href="./bootstrap/ganttPrint.css" type="text/css" media="print">

        <script src="./bootstrap/libs/jquery.livequery.min.js"></script>
        <script src="./bootstrap/libs/jquery.timers.js"></script>
        <script src="./bootstrap/libs/platform.js"></script>
        <script src="./bootstrap/libs/date.js"></script>
        <script src="./bootstrap/libs/i18nJs.js"></script>
        <script src="./bootstrap/libs/dateField/jquery.dateField.js"></script>
        <script src="./bootstrap/libs/JST/jquery.JST.js"></script>

        <link rel="stylesheet" type="text/css" href="./bootstrap/libs/jquery.svg.css">
        <script type="text/javascript" src="./bootstrap/libs/jquery.svg.min.js"></script>

        <!--In case of jquery 1.7-->
        <!--<script type="text/javascript" src="libs/jquery.svgdom.pack.js"></script>-->

        <!--In case of jquery 1.8-->
        <script type="text/javascript" src="./bootstrap/libs/jquery.svgdom.1.8.js"></script>


        <script src="./bootstrap/ganttUtilities.js"></script>
        <script src="./bootstrap/ganttTask.js"></script>
        <script src="./bootstrap/ganttDrawerSVG.js"></script>
        <!--<script src="ganttDrawer.js"></script>-->
        <script src="./bootstrap/ganttGridEditor.js"></script>
        <script src="./bootstrap/ganttMaster.js"></script>  
    </head>
    <body>
        <section id="main-content">
            <section class="wrapper1">
                <div class="row">
                    <div class="col-md-12 no-padding">
                        <section class="panel">
                            <%
        //Person pop = (Person)session.getAttribute("loggedInPm");
                                    //String name = pop.getUsername();
                                    JsonObject jO = new JsonObject();
                                    GanttDAO gdao = new GanttDAO();
                                    if (pm != null) {
                                        Person p = (Person) session.getAttribute("loggedInPm");
                                        ArrayList<Gnatt> ff = gdao.retrieveGnattPm(p.getUsername());
                                        ArrayList<String> developer = gdao.retrieveDeveloper();
                                        if (!ff.isEmpty()) {
                                            JsonArray jA = new JsonArray();
                                            String deve = "";
                                            int count = -1;
                                            JsonObject jj = new JsonObject();
                                            for (String a : developer) {
                                                deve = a;
                                                Date start = ff.get(0).getPlanstart();
                                                Date end = ff.get(0).getPlanend();;
                                                for (int i = 0; i < ff.size(); i++) {
                                                    if (ff.get(i).getDeveloperName().equalsIgnoreCase(deve)) {
                                                        start = ff.get(i).getPlanstart();

                                                        end = ff.get(i).getPlanend();
                                                    }
                                                }
                                                if (start == null || end == null) {
                                                    //tochange
                                                    //developer.remove(a);
                                                }else{
                                                
                                                Date today = new Date();
                                                for (int i = 0; i < ff.size(); i++) {
                                                    if (ff.get(i).getPlanstart() != null && ff.get(i).getDeveloperName().equalsIgnoreCase(deve)) {
                                                        if (start.getTime() > ff.get(i).getPlanstart().getTime()) {
                                                            start = ff.get(i).getPlanstart();
                                                        }

                                                        if (ff.get(i).getPlanend() != null && end.getTime() < ff.get(i).getPlanend().getTime()) {
                                                            end = ff.get(i).getPlanend();
                                                        }
                                                    }
                                                }
                                                long duration = (end.getTime() - start.getTime()) / (1000 * 60 * 60 * 24);
                                                jj = new JsonObject();
                                                jj.addProperty("id", count);
                                                jj.addProperty("name", a);
                                                jj.addProperty("Code", "");
                                                jj.addProperty("level", 0);
                                                jj.addProperty("status", "STATUS_ACTIVE");
                                                jj.addProperty("canWrite", true);
                                                jj.addProperty("start", start.getTime());
                                                jj.addProperty("duration", duration);
                                                jj.addProperty("end", end.getTime());
                                                jj.addProperty("startISMilestone", true);
                                                jj.addProperty("endISMilestone", false);
                                                jj.addProperty("collapsed", false);
                                                jj.addProperty("hasChild", true);
                                                count = count - 1;
                                                jA.add(jj);
                                                for (Gnatt cb : ff) {
                                                    jj = new JsonObject();
                                                    //long duration = (cb.getPlanend().getTime() - cb.getPlanstart().getTime())/1000*60*60*24;
                                                    if (cb.getPlanstart() != null && deve.equals(cb.getDeveloperName())) {
                                                        long duration1 = (cb.getPlanend().getTime() - cb.getPlanstart().getTime()) / (1000 * 60 * 60 * 24);
                                                        jj.addProperty("id", count);
                                                        jj.addProperty("name", cb.getProjectName());
                                                        jj.addProperty("Code", "");
                                                        jj.addProperty("level", 1);
                                                        jj.addProperty("status", "STATUS_COMPLETED");
                                                        jj.addProperty("canWrite", false);
                                                        jj.addProperty("start", cb.getPlanstart().getTime());
                                                        jj.addProperty("duration", duration1);
                                                        jj.addProperty("end", cb.getPlanend().getTime());
                                                        jj.addProperty("startISMilestone", true);
                                                        jj.addProperty("endISMilestone", false);
                                                        jj.addProperty("collapsed", true);
                                                        jj.addProperty("hasChild", false);
                                                        jA.add(jj);
                                                        count = count - 1;
                                                    }

                                                }
                                                }
                                            }
                                            jO.add("tasks", jA);
                                            jO.addProperty("selectedRow", 0);
                                            jO.addProperty("canWrite", true);
                                            jO.addProperty("canWriteOnParent", true);
                                        }
                                    } else if (dev !=null) {
                                        Person p = (Person) session.getAttribute("loggedInDev");

                                        ArrayList<Gnatt> ff = gdao.retrieveGnattDev(p.getUsername());
                                        if (!ff.isEmpty()) {
                                            JsonArray jA = new JsonArray();
                                            JsonObject jj = new JsonObject();
                                            int count = -1;
                                            
                                            
                                            
                                            for (Gnatt cb : ff) {
                                                if(cb.getPlanend()!=null && cb.getPlanstart()!=null){
                                                long duration = (cb.getPlanend().getTime() - cb.getPlanstart().getTime()) / (1000 * 60 * 60 * 24);
                                                jj = new JsonObject();
                                                jj.addProperty("id", count);
                                                jj.addProperty("name", cb.getProjectName());
                                                jj.addProperty("Code", "");
                                                jj.addProperty("level", 0);
                                                jj.addProperty("status", "STATUS_COMPLETED");
                                                jj.addProperty("canWrite", true);
                                                jj.addProperty("start", cb.getPlanstart().getTime());
                                                jj.addProperty("duration", duration);
                                                jj.addProperty("end", cb.getPlanend().getTime());
                                                jj.addProperty("startISMilestone", true);
                                                jj.addProperty("endISMilestone", false);
                                                jj.addProperty("collapsed", false);
                                                jj.addProperty("hasChild", false);
                                                count = count - 1;
                                                jA.add(jj);
                                                }
                                            }
                                            jO.add("tasks", jA);
                                            jO.addProperty("selectedRow", 0);
                                            jO.addProperty("canWrite", true);
                                            jO.addProperty("canWriteOnParent", true);
                                        }
                                    }else{
                                    
                                        //admin and tester views all schedule -- 
                                        ArrayList<Gnatt> ff = gdao.retrieveGnattAll();
                                        ArrayList<String> developer = gdao.retrieveDeveloper();
                                        if (!ff.isEmpty()) {
                                            JsonArray jA = new JsonArray();
                                            String deve = "";
                                            int count = -1;
                                            JsonObject jj = new JsonObject();
                                            for (String a : developer) {
                                                deve = a;
                                                Date start = ff.get(0).getPlanstart();
                                                Date end = ff.get(0).getPlanend();;
                                                for (int i = 0; i < ff.size(); i++) {
                                                    if (ff.get(i).getDeveloperName().equalsIgnoreCase(deve)) {
                                                        start = ff.get(i).getPlanstart();

                                                        end = ff.get(i).getPlanend();
                                                    }
                                                }
                                                if (start == null || end == null) {
                                                    //tochange
                                                    developer.remove(a);
                                                }else{
                                                Date today = new Date();
                                                for (int i = 0; i < ff.size(); i++) {
                                                    if (ff.get(i).getPlanstart() != null && ff.get(i).getDeveloperName().equalsIgnoreCase(deve)) {
                                                        if (start.getTime() > ff.get(i).getPlanstart().getTime()) {
                                                            start = ff.get(i).getPlanstart();
                                                        }

                                                        if (ff.get(i).getPlanend() != null && end.getTime() < ff.get(i).getPlanend().getTime()) {
                                                            end = ff.get(i).getPlanend();
                                                        }
                                                    }
                                                }
                                                long duration = (end.getTime() - start.getTime()) / (1000 * 60 * 60 * 24);
                                                jj = new JsonObject();
                                                jj.addProperty("id", count);
                                                jj.addProperty("name", a);
                                                jj.addProperty("Code", "");
                                                jj.addProperty("level", 0);
                                                jj.addProperty("status", "STATUS_COMPLETED");
                                                jj.addProperty("canWrite", true);
                                                jj.addProperty("start", start.getTime());
                                                jj.addProperty("duration", duration);
                                                jj.addProperty("end", end.getTime());
                                                jj.addProperty("startISMilestone", true);
                                                jj.addProperty("endISMilestone", false);
                                                jj.addProperty("collapsed", false);
                                                jj.addProperty("hasChild", true);
                                                count = count - 1;
                                                jA.add(jj);
                                                for (Gnatt cb : ff) {
                                                    jj = new JsonObject();
                                                    //long duration = (cb.getPlanend().getTime() - cb.getPlanstart().getTime())/1000*60*60*24;
                                                    if (cb.getPlanstart() != null && deve.equals(cb.getDeveloperName())) {
                                                        long duration1 = (cb.getPlanend().getTime() - cb.getPlanstart().getTime()) / (1000 * 60 * 60 * 24);
                                                        jj.addProperty("id", count);
                                                        jj.addProperty("name", cb.getProjectName());
                                                        jj.addProperty("Code", "");
                                                        jj.addProperty("level", 1);
                                                        jj.addProperty("status", "STATUS_ACTIVE");
                                                        jj.addProperty("canWrite", false);
                                                        jj.addProperty("start", cb.getPlanstart().getTime());
                                                        jj.addProperty("duration", duration1);
                                                        jj.addProperty("end", cb.getPlanend().getTime());
                                                        jj.addProperty("startISMilestone", true);
                                                        jj.addProperty("endISMilestone", false);
                                                        jj.addProperty("collapsed", true);
                                                        jj.addProperty("hasChild", false);
                                                        jA.add(jj);
                                                        count = count - 1;
                                                    }

                                                }
                                                }
                                            }
                                            jO.add("tasks", jA);
                                            jO.addProperty("selectedRow", 0);
                                            jO.addProperty("canWrite", true);
                                            jO.addProperty("canWriteOnParent", true);
                                        }
                                        
                                    }
                            %>

                            <div id="workSpace" style="padding:0px; overflow-y:auto; overflow-x:hidden;border:1px solid #e5e5e5;position:relative;margin:0 1px"></div>

                            <div id="taZone" style="display:none;" class="noprint">
                                <textarea rows="99" cols="100" id="ta">
                                    <%=jO%>
                                </textarea>

                                <button onclick="loadGanttFromServer();">load</button>
                            </div>

                            <style>
                                .resEdit {
                                    padding: 15px;
                                }

                                .resLine {
                                    width: 95%;
                                    padding: 3px;
                                    margin: 5px;
                                    border: 1px solid #d0d0d0;
                                }

                                body {
                                    overflow: hidden;
                                }

                                .ganttButtonBar h1{
                                    color: #000000;
                                    font-weight: bold;
                                    font-size: 28px;
                                    margin-left: 10px;
                                }

                            </style>

                            <form id="gimmeBack" style="display:none;" action="../gimmeBack.jsp" method="post" target="_blank"><input type="hidden" name="prj" id="gimBaPrj"></form>

                            <script type="text/javascript">

                                var ge;  //this is the hugly but very friendly global var for the gantt editor
                                $(function () {

                                    //load templates
                                    $("#ganttemplates").loadTemplates();

                                    // here starts gantt initialization
                                    ge = new GanttMaster();
                                    var workSpace = $("#workSpace");
                                    workSpace.css({width: $(window).width() - 20, height: $(window).height() - 100});
                                    ge.init(workSpace);

                                    //inject some buttons (for this demo only)
                                    //  $(".ganttButtonBar div").append("<button onclick='clearGantt();' class='button'>clear</button>")
                                    //          .append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;")
                                    //          .append("<button onclick='getFile();' class='button'>export</button>");
                                    //  $(".ganttButtonBar h1").html("<a href='http://twproject.com' title='Twproject the friendly project and work management tool' target='_blank'><img width='80%' src='res/twBanner.jpg'></a>");
                                    //  $(".ganttButtonBar div").addClass('buttons');
                                    //overwrite with localized ones
                                    //  loadI18n();

                                    //simulate a data load from a server.
                                    loadGanttFromServer();


                                    //fill default Teamwork roles if any
                                    //  if (!ge.roles || ge.roles.length == 0) {
                                    //    setRoles();
                                    //  }
                                    //
                                    //  //fill default Resources roles if any
                                    //  if (!ge.resources || ge.resources.length == 0) {
                                    //    setResource();
                                    //  }


                                    /*/debug time scale
                                     $(".splitBox2").mousemove(function(e){
                                     var x=e.clientX-$(this).offset().left;
                                     var mill=Math.round(x/(ge.gantt.fx) + ge.gantt.startMillis)
                                     $("#ndo").html(x+" "+new Date(mill))
                                     });*/

                                    $(window).resize(function () {
                                        workSpace.css({width: $(window).width() - 1, height: $(window).height() - workSpace.position().top});
                                        workSpace.trigger("resize.gantt");
                                    }).oneTime(150, "resize", function () {
                                        $(this).trigger("resize")
                                    });

                                });


                                function loadGanttFromServer(taskId, callback) {

                                    //this is a simulation: load data from the local storage if you have already played with the demo or a textarea with starting demo data
                                    loadFromLocalStorage();

                                    //this is the real implementation
                                    /*
                                     //var taskId = $("#taskSelector").val();
                                     var prof = new Profiler("loadServerSide");
                                     prof.reset();
                                     
                                     $.getJSON("ganttAjaxController.jsp", {CM:"LOADPROJECT",taskId:taskId}, function(response) {
                                     //console.debug(response);
                                     if (response.ok) {
                                     prof.stop();
                                     
                                     ge.loadProject(response.project);
                                     ge.checkpoint(); //empty the undo stack
                                     
                                     if (typeof(callback)=="function") {
                                     callback(response);
                                     }
                                     } else {
                                     jsonErrorHandling(response);
                                     }
                                     });
                                     */
                                }


                                function saveGanttOnServer() {
                                    if (!ge.canWrite)
                                        return;


                                    //this is a simulation: save data to the local storage or to the textarea
                                    saveInLocalStorage();


                                    /*
                                     var prj = ge.saveProject();
                                     
                                     delete prj.resources;
                                     delete prj.roles;
                                     
                                     var prof = new Profiler("saveServerSide");
                                     prof.reset();
                                     
                                     if (ge.deletedTaskIds.length>0) {
                                     if (!confirm("TASK_THAT_WILL_BE_REMOVED\n"+ge.deletedTaskIds.length)) {
                                     return;
                                     }
                                     }
                                     
                                     $.ajax("ganttAjaxController.jsp", {
                                     dataType:"json",
                                     data: {CM:"SVPROJECT",prj:JSON.stringify(prj)},
                                     type:"POST",
                                     
                                     success: function(response) {
                                     if (response.ok) {
                                     prof.stop();
                                     if (response.project) {
                                     ge.loadProject(response.project); //must reload as "tmp_" ids are now the good ones
                                     } else {
                                     ge.reset();
                                     }
                                     } else {
                                     var errMsg="Errors saving project\n";
                                     if (response.message) {
                                     errMsg=errMsg+response.message+"\n";
                                     }
                                     
                                     if (response.errorMessages.length) {
                                     errMsg += response.errorMessages.join("\n");
                                     }
                                     
                                     alert(errMsg);
                                     }
                                     }
                                     
                                     });
                                     */
                                }


                                //-------------------------------------------  Create some demo data ------------------------------------------------------
                                function setRoles() {
                                    ge.roles = [
                                        {
                                            id: "tmp_1",
                                            name: "Project Manager"
                                        },
                                        {
                                            id: "tmp_2",
                                            name: "Worker"
                                        },
                                        {
                                            id: "tmp_3",
                                            name: "Stakeholder/Customer"
                                        }
                                    ];
                                }

                                function setResource() {
                                    var res = [];
                                    for (var i = 1; i <= 10; i++) {
                                        res.push({id: "tmp_" + i, name: "Resource " + i});
                                    }
                                    ge.resources = res;
                                }


                                function editResources() {

                                }

                                function clearGantt() {
                                    ge.reset();
                                }

                                function loadI18n() {
                                    GanttMaster.messages = {
                                        "CANNOT_WRITE": "CANNOT_WRITE",
                                        "CHANGE_OUT_OF_SCOPE": "NO_RIGHTS_FOR_UPDATE_PARENTS_OUT_OF_EDITOR_SCOPE",
                                        "START_IS_MILESTONE": "START_IS_MILESTONE",
                                        "END_IS_MILESTONE": "END_IS_MILESTONE",
                                        "TASK_HAS_CONSTRAINTS": "TASK_HAS_CONSTRAINTS",
                                        "GANTT_ERROR_DEPENDS_ON_OPEN_TASK": "GANTT_ERROR_DEPENDS_ON_OPEN_TASK",
                                        "GANTT_ERROR_DESCENDANT_OF_CLOSED_TASK": "GANTT_ERROR_DESCENDANT_OF_CLOSED_TASK",
                                        "TASK_HAS_EXTERNAL_DEPS": "TASK_HAS_EXTERNAL_DEPS",
                                        "GANTT_ERROR_LOADING_DATA_TASK_REMOVED": "GANTT_ERROR_LOADING_DATA_TASK_REMOVED",
                                        "ERROR_SETTING_DATES": "ERROR_SETTING_DATES",
                                        "CIRCULAR_REFERENCE": "CIRCULAR_REFERENCE",
                                        "CANNOT_DEPENDS_ON_ANCESTORS": "CANNOT_DEPENDS_ON_ANCESTORS",
                                        "CANNOT_DEPENDS_ON_DESCENDANTS": "CANNOT_DEPENDS_ON_DESCENDANTS",
                                        "INVALID_DATE_FORMAT": "INVALID_DATE_FORMAT",
                                        "TASK_MOVE_INCONSISTENT_LEVEL": "TASK_MOVE_INCONSISTENT_LEVEL",
                                        "GANTT_QUARTER_SHORT": "trim.",
                                        "GANTT_SEMESTER_SHORT": "sem."
                                    };
                                }



                                //-------------------------------------------  Get project file as JSON (used for migrate project from gantt to Teamwork) ------------------------------------------------------
                                function getFile() {
                                    $("#gimBaPrj").val(JSON.stringify(ge.saveProject()));
                                    $("#gimmeBack").submit();
                                    $("#gimBaPrj").val("");

                                    /*  var uriContent = "data:text/html;charset=utf-8," + encodeURIComponent(JSON.stringify(prj));
                                     neww=window.open(uriContent,"dl");*/
                                }


                                //-------------------------------------------  LOCAL STORAGE MANAGEMENT (for this demo only) ------------------------------------------------------
                                Storage.prototype.setObject = function (key, value) {
                                    this.setItem(key, JSON.stringify(value));
                                };


                                Storage.prototype.getObject = function (key) {
                                    return this.getItem(key) && JSON.parse(this.getItem(key));
                                };


                                function loadFromLocalStorage() {
                                    var ret;
                                    if (localStorage) {
                                        if (localStorage.getObject("teamworkGantDemo")) {
                                            ret = localStorage.getObject("teamworkGantDemo");
                                        }
                                    } else {
                                        $("#taZone").show();
                                    }
                                    if (!ret || !ret.tasks || ret.tasks.length == 0) {
                                        ret = JSON.parse($("#ta").val());


                                        //actualiza data
                                        var offset = new Date().getTime() - ret.tasks[0].start;
                                        for (var i = 0; i < ret.tasks.length; i++)
                                            ret.tasks[i].start = ret.tasks[i].start + offset;


                                    }
                                    ge.loadProject(ret);
                                    ge.checkpoint(); //empty the undo stack
                                }


                                function saveInLocalStorage() {
                                    var prj = ge.saveProject();
                                    if (localStorage) {
                                        localStorage.setObject("teamworkGantDemo", prj);
                                    } else {
                                        $("#ta").val(JSON.stringify(prj));
                                    }
                                }


                                //-------------------------------------------  Open a black popup for managing resources. This is only an axample of implementation (usually resources come from server) ------------------------------------------------------

                                function editResources() {

                                    //make resource editor
                                    var resourceEditor = $.JST.createFromTemplate({}, "RESOURCE_EDITOR");
                                    var resTbl = resourceEditor.find("#resourcesTable");

                                    for (var i = 0; i < ge.resources.length; i++) {
                                        var res = ge.resources[i];
                                        resTbl.append($.JST.createFromTemplate(res, "RESOURCE_ROW"))
                                    }


                                    //bind add resource
                                    resourceEditor.find("#addResource").click(function () {
                                        resTbl.append($.JST.createFromTemplate({id: "new", name: "resource"}, "RESOURCE_ROW"))
                                    });

                                    //bind save event
                                    resourceEditor.find("#resSaveButton").click(function () {
                                        var newRes = [];
                                        //find for deleted res
                                        for (var i = 0; i < ge.resources.length; i++) {
                                            var res = ge.resources[i];
                                            var row = resourceEditor.find("[resId=" + res.id + "]");
                                            if (row.size() > 0) {
                                                //if still there save it
                                                var name = row.find("input[name]").val();
                                                if (name && name != "")
                                                    res.name = name;
                                                newRes.push(res);
                                            } else {
                                                //remove assignments
                                                for (var j = 0; j < ge.tasks.length; j++) {
                                                    var task = ge.tasks[j];
                                                    var newAss = [];
                                                    for (var k = 0; k < task.assigs.length; k++) {
                                                        var ass = task.assigs[k];
                                                        if (ass.resourceId != res.id)
                                                            newAss.push(ass);
                                                    }
                                                    task.assigs = newAss;
                                                }
                                            }
                                        }

                                        //loop on new rows
                                        resourceEditor.find("[resId=new]").each(function () {
                                            var row = $(this);
                                            var name = row.find("input[name]").val();
                                            if (name && name != "")
                                                newRes.push(new Resource("tmp_" + new Date().getTime(), name));
                                        });

                                        ge.resources = newRes;

                                        closeBlackPopup();
                                        ge.redraw();
                                    });


                                    var ndo = createBlackPage(400, 500).append(resourceEditor);
                                }


                            </script>


                            <div id="gantEditorTemplates" style="display:none;">


                                <div class="__template__" type="TASKSEDITHEAD"><!--
                                <table class="gdfTable" cellspacing="0" cellpadding="0">
                                  <thead>
                                  <tr style="height:40px">
                                    <th class="gdfColHeader" style="width:35px;"></th>
                                    <th class="gdfColHeader" style="width:25px;"></th>
                                    <th class="gdfColHeader gdfResizable" style="width:0px;">Code/short name</th>
                              
                                    <th class="gdfColHeader gdfResizable" style="width:300px;">Name</th>
                                    <th class="gdfColHeader gdfResizable" style="width:80px;">Start</th>
                                    <th class="gdfColHeader gdfResizable" style="width:80px;">End</th>
                                    <th class="gdfColHeader gdfResizable" style="width:50px;">Dur.</th>
                                    
                                  </tr>
                                  </thead>
                                </table>
                                    --></div>

                                <div class="__template__" type="TASKROW"><!--
                                <tr taskId="(#=obj.id#)" class="taskEditRow" level="(#=level#)">
                                  <th class="gdfCell edit" align="right" style="cursor:pointer;"><span class="taskRowIndex">(#=obj.getRow()+1#)</span> <span class="teamworkIcon" style="font-size:12px;" >e</span></th>
                                  <td class="gdfCell noClip" align="center"><div class="taskStatus cvcColorSquare" status="(#=obj.status#)"></div></td>
                                  <td class="gdfCell"><input type="text" name="code" value="(#=obj.code?obj.code:''#)"></td>
                                  <td class="gdfCell indentCell" style="padding-left:(#=obj.level*10#)px;">
                                    <div class="(#=obj.isParent()?'exp-controller expcoll exp':'exp-controller'#)" align="center"></div>
                                    <input type="text" name="name" value="(#=obj.name#)">
                                  </td>
                              
                                  <td class="gdfCell"><input type="text" name="start"  value="" class="date"></td>
                                  <td class="gdfCell"><input type="text" name="end" value="" class="date"></td>
                                  <td class="gdfCell"><input type="text" name="duration" value="(#=obj.duration#)"></td>
                                  <td class="gdfCell"><input type="text" name="depends" value="(#=obj.depends#)" (#=obj.hasExternalDep?"readonly":""#)></td>
                                  <td class="gdfCell taskAssigs">(#=obj.getAssigsString()#)</td>
                                </tr>
                                    --></div>

                                <div class="__template__" type="TASKEMPTYROW"><!--
                                <tr class="taskEditRow emptyRow" >
                                  <th class="gdfCell" align="right"></th>
                                  <td class="gdfCell noClip" align="center"></td>
                                  <td class="gdfCell"></td>
                                  <td class="gdfCell"></td>
                                  <td class="gdfCell"></td>
                                  <td class="gdfCell"></td>
                                  <td class="gdfCell"></td>
                                  <td class="gdfCell"></td>
                                  <td class="gdfCell"></td>
                                </tr>
                                    --></div>

                                <div class="__template__" type="TASKBAR"><!--
                                <div class="taskBox taskBoxDiv" taskId="(#=obj.id#)" >
                                  <div class="layout (#=obj.hasExternalDep?'extDep':''#)">
                                    <div class="taskStatus" status="(#=obj.status#)"></div>
                                    <div class="taskProgress" style="width:(#=obj.progress>100?100:obj.progress#)%; background-color:(#=obj.progress>100?'red':'rgb(153,255,51);'#);"></div>
                                    <div class="milestone (#=obj.startIsMilestone?'active':''#)" ></div>
                              
                                    <div class="taskLabel"></div>
                                    <div class="milestone end (#=obj.endIsMilestone?'active':''#)" ></div>
                                  </div>
                                </div>
                                    --></div>

                                <div class="__template__" type="CHANGE_STATUS"><!--
                                  <div class="taskStatusBox">
                                    <div class="taskStatus cvcColorSquare" status="STATUS_ACTIVE" title="active"></div>
                                    <div class="taskStatus cvcColorSquare" status="STATUS_DONE" title="completed"></div>
                                    <div class="taskStatus cvcColorSquare" status="STATUS_FAILED" title="failed"></div>
                                    <div class="taskStatus cvcColorSquare" status="STATUS_SUSPENDED" title="suspended"></div>
                                    <div class="taskStatus cvcColorSquare" status="STATUS_UNDEFINED" title="undefined"></div>
                                  </div>
                                    --></div>


                                <div class="__template__" type="TASK_EDITOR"><!--
                                <div class="ganttTaskEditor">
                                <table width="100%">
                                  <tr>
                                    <td>
                                      <table cellpadding="5">
                                        <tr>
                                          <td><label for="code">Code/short name</label><br><input type="text" name="code" id="code" value="" class="formElements"></td>
                                         </tr><tr>
                                          <td><label for="name">Name</label><br><input type="text" name="name" id="name" value=""  size="35" class="formElements"></td>
                                        </tr>
                                        <tr></tr>
                                          <td>
                                            <label for="description">Description</label><br>
                                            <textarea rows="5" cols="30" id="description" name="description" class="formElements"></textarea>
                                          </td>
                                        </tr>
                                      </table>
                                    </td>
                                    <td valign="top">
                                      <table cellpadding="5">
                                        <tr>
                                        <td colspan="2"><label for="status">status</label><br><div id="status" class="taskStatus" status=""></div></td>
                                        <tr>
                                        <td colspan="2"><label for="progress">progress</label><br><input type="text" name="progress" id="progress" value="" size="3" class="formElements"></td>
                                        </tr>
                                        <tr>
                                        <td><label for="start">Start</label><br><input type="text" name="start" id="start"  value="" class="date" size="10" class="formElements"><input type="checkbox" id="startIsMilestone"> </td>
                                        <td rowspan="2" class="graph" style="padding-left:50px"><label for="duration">dur.</label><br><input type="text" name="duration" id="duration" value=""  size="5" class="formElements"></td>
                                      </tr><tr>
                                        <td><label for="end">End</label><br><input type="text" name="end" id="end" value="" class="date"  size="10" class="formElements"><input type="checkbox" id="endIsMilestone"></td>
                                      </table>
                                    </td>
                                  </tr>
                                  </table>
                              
                                <h2>assignments</h2>
                                <table  cellspacing="1" cellpadding="0" width="100%" id="assigsTable">
                                  <tr>
                                    <th style="width:100px;">name</th>
                                    <th style="width:70px;">role</th>
                                    <th style="width:30px;">est.wklg.</th>
                                    <th style="width:30px;" id="addAssig"><span class="teamworkIcon" style="cursor: pointer">+</span></th>
                                  </tr>
                                </table>
                              
                                <div style="text-align: right; padding-top: 20px"><button id="saveButton" class="button big">save</button></div>
                                </div>
                                    --></div>


                                <div class="__template__" type="ASSIGNMENT_ROW"><!--
                                <tr taskId="(#=obj.task.id#)" assigId="(#=obj.assig.id#)" class="assigEditRow" >
                                  <td ><select name="resourceId"  class="formElements" (#=obj.assig.id.indexOf("tmp_")==0?"":"disabled"#) ></select></td>
                                  <td ><select type="select" name="roleId"  class="formElements"></select></td>
                                  <td ><input type="text" name="effort" value="(#=getMillisInHoursMinutes(obj.assig.effort)#)" size="5" class="formElements"></td>
                                  <td align="center"><span class="teamworkIcon delAssig" style="cursor: pointer">d</span></td>
                                </tr>
                                    --></div>


                                <div class="__template__" type="RESOURCE_EDITOR"><!--
                                <div class="resourceEditor" style="padding: 5px;">
                              
                                  <h2>Project team</h2>
                                  <table  cellspacing="1" cellpadding="0" width="100%" id="resourcesTable">
                                    <tr>
                                      <th style="width:100px;">name</th>
                                      <th style="width:30px;" id="addResource"><span class="teamworkIcon" style="cursor: pointer">+</span></th>
                                    </tr>
                                  </table>
                              
                                  <div style="text-align: right; padding-top: 20px"><button id="resSaveButton" class="button big">save</button></div>
                                </div>
                                    --></div>


                                <div class="__template__" type="RESOURCE_ROW"><!--
                                <tr resId="(#=obj.id#)" class="resRow" >
                                  <td ><input type="text" name="name" value="(#=obj.name#)" style="width:100%;" class="formElements"></td>
                                  <td align="center"><span class="teamworkIcon delRes" style="cursor: pointer">d</span></td>
                                </tr>
                                    --></div>


                            </div>
                            <script type="text/javascript">
                                $.JST.loadDecorator("ASSIGNMENT_ROW", function (assigTr, taskAssig) {

                                    var resEl = assigTr.find("[name=resourceId]");
                                    for (var i in taskAssig.task.master.resources) {
                                        var res = taskAssig.task.master.resources[i];
                                        var opt = $("<option>");
                                        opt.val(res.id).html(res.name);
                                        if (taskAssig.assig.resourceId == res.id)
                                            opt.attr("selected", "true");
                                        resEl.append(opt);
                                    }


                                    var roleEl = assigTr.find("[name=roleId]");
                                    for (var i in taskAssig.task.master.roles) {
                                        var role = taskAssig.task.master.roles[i];
                                        var optr = $("<option>");
                                        optr.val(role.id).html(role.name);
                                        if (taskAssig.assig.roleId == role.id)
                                            optr.attr("selected", "true");
                                        roleEl.append(optr);
                                    }

                                    if (taskAssig.task.master.canWrite && taskAssig.task.canWrite) {
                                        assigTr.find(".delAssig").click(function () {
                                            var tr = $(this).closest("[assigId]").fadeOut(200, function () {
                                                $(this).remove();
                                            });
                                        });
                                    }


                                });
                            </script>
                          
                        </section>
                    </div>
                </div>
            </section>
        </section>

    </body>
</html>
