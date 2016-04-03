select avg(avgdefectpoint) as meanavgdefectpointsperproject,
		avg(avgdefectcount) as meanavgdefectperproject,
        STD(avgdefectpoint/projectcount) as sdavgdefectpointsperproject, 
		STD(avgdefectcount/projectcount) as sdavgdefectperproject
    from (
    #average defects count and score PER DEVELOPER
	select developerusername, avg(totaldefectpoints) as avgdefectpoint, avg(totaldefects) as avgdefectcount, count(projectname) as projectcount
	from	
		(#For each allocation, how many defects points and number of defects
        #defect score and number of defects of each project, high severity_3pts, mid_2, low_1
		select pd.developerusername as developerusername, pd.projectname as projectname, ifnull(sum(severity),0) as totaldefectpoints, count(severity) as totaldefects
		from
		(#Who did what project for past 3 month
		select developerusername, projectname from projectallocation where actualstart >= now()-interval 3 month group by projectname, developerusername) as pd 
		left outer join
		(#List of defects for past 3 month by developer and project
		select projectname, committedby as developerusername,severity from defectcommitby dc left outer join defect d on dc.defectid = d.defectid where updatetime >= now()-interval 3 month) as dc
		on pd.developerusername = dc.developerusername and pd.projectname = dc.projectname
		group by pd.developerusername, pd.projectname) as defectbyallocation
		group by developerusername) as d;





        