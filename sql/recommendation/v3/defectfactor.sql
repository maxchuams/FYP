select developerusername, format(1-pavgdcount,4)as defectlessfactor
from
(
#avg defects per developer
select username as developerusername,defectpoint, defectcount, projectcount
#x
avgdefectperproject, 
#mu
meanavgdefectperproject, 
#sd
sdavgdefectperproject, 
format((avgdefectperproject - meanavgdefectperproject)/sdavgdefectperproject,2) as zavgdcount,
(select pvalue from ztable where zvalue=format((avgdefectperproject - meanavgdefectperproject)/sdavgdefectperproject,2)) as pavgdcount,
#x
avgdefectpointperproject, 
#mu
meanavgdefectpointsperproject,
#sd
sdavgdefectpointsperproject, 
format((avgdefectpointperproject - meanavgdefectpointsperproject)/sdavgdefectpointsperproject,2) as zavgdpoint,
(select pvalue from ztable where zvalue=format((avgdefectpointperproject - meanavgdefectpointsperproject)/sdavgdefectpointsperproject,2)) as pavgdpoint
from developer
#we need to get all developers, having 0 zero allocation will result in no project
left outer join
	(select developerusername, 
		ifnull(sum(severity),0) as defectpoint, 
		ifnull(sum(numberdefect),0) as defectcount, 
        ifnull(count(developerusername),0) as projectcount,
        (ifnull(sum(numberdefect),0)/ifnull(count(developerusername),0) ) as avgdefectperproject, 
		(ifnull(sum(severity),0)/ifnull(count(developerusername),0) ) as avgdefectpointperproject		
        from
		#who did what project, filter out uncompleted project for performance sake
		(select developerusername, projectname from projectallocation 
			where actualend is not null group by projectname,developerusername) as a
		left outer join
		#defect score and number of defects of each project, high severity_3pts, mid_2, low_1
        #using data for last 3 months
		(select projectname, sum(severity) as severity, count(severity) 
			as numberdefect from defect where updatetime >= now()-interval 3 month
			group by projectname) as b
		on a.projectname=b.projectname
		group by developerusername
	) as c
 on developer.username=c.developerusername
 cross join
 #the below query gets the true mean 
    (select sum(defectpoint)/sum(projectcount) as meanavgdefectpointsperproject, 
		sum(defectcount)/sum(projectcount) as meanavgdefectperproject,
        STD(defectpoint/projectcount) as sdavgdefectpointsperproject, 
		STD(defectcount/projectcount) as sdavgdefectperproject
        from (
		select developerusername, 
		ifnull(sum(severity),0) as defectpoint, 
		ifnull(sum(numberdefect),0) as defectcount, 
        ifnull(count(developerusername),0) as projectcount	
        from
		#who did what project, filter out uncompleted project for performance sake
		(select developerusername, projectname from projectallocation 
			where actualend is not null group by projectname,developerusername) as a
		left outer join
		(select projectname, sum(severity) as severity, count(severity) 
			as numberdefect from defect where updatetime >= now()-interval 3 month
			group by projectname) as b
		on a.projectname=b.projectname
		group by developerusername) as d) as e
) as finaltable;
