#avg defects per developer
select username as developerusername,ifnull(defectpoint,0) as defectpoint,
ifnull(defectcount,0) as defectcount,projectcount,(defectcount/projectcount) as avgdefectperproject, 
(defectpoint/projectcount) as avgdefectpointperproject
from developer
#we need to get all developers, having 0 zero allocation will result in no project
left outer join
	(	select developerusername, ifnull(sum(severity),0) as defectpoint, 
		ifnull(sum(numberdefect),0) as defectcount, ifnull(count(developerusername),0) as projectcount from
		#who did what project, filter out uncompleted project for performance sake
		(select developerusername, projectname from projectallocation 
		where actualend is not null group by projectname,developerusername) as a
		left outer join
		#defect score and numner of defects of each project, high severity_3pts, mid_2, low_1
        #using data for last 3 months
		(select projectname, -sum(severity) as severity, count(severity) 
		as numberdefect from defect where updatetime >= now()-interval 3 month
		group by projectname) as b
		on a.projectname=b.projectname
		group by developerusername
	) as c
on developer.username=c.developerusername;