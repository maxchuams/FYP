select final.developerusername, 
ifnull(scheduleperformance,1) as scheduleperformance,ifnull(schedulefactor,0) as schedulefactor,
ifnull(experiencefactor,0) as experiencefactor, ifnull(projectcount,0) as projectcount,
ifnull(defectlessfactor,0) defectlessfactor,ifnull(avgdefectperproject,0) as avgdefectperproject,
format((0.33*ifnull(experiencefactor,0) + 0.33*ifnull(defectlessfactor,0) + 0.33*ifnull(schedulefactor,0)),4) as zainessscore
from
	(select username as developerusername from developerskill where skill ='eCommerce') as final
left outer join
	(select developerusername,format(experiencefactor,4) as experiencefactor, projectcount from
	(select developerusername,type,points, projectcount,
	ifnull(if(points<=20,0.8*points/20,0.8 +(0.2/points*(points-20))),0) as experiencefactor 
	from
	(
	select developerusername, type, sum(points) as points, count(developerusername) as projectcount
	from 
		(select developerusername, pa.projectname,(1*priority) as points ,type
		from projectallocation pa, project p 
		where pa.projectname = p.projectname
		and actualend is not null
		and type='eCommerce'
		group by developerusername,projectname,psize,priority,type) as temp
	group by developerusername, type
	) experiencetable) as finaltable) as final1
on final1.developerusername=final.developerusername
left outer join
	#defects
	(select developerusername, format(1-pavgdcount,4)as defectlessfactor, avgdefectperproject
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
			(select developerusername, projectname from projectallocation 
				where actualend is not null group by projectname,developerusername) as a
			left outer join
			(select projectname, sum(severity) as severity, count(severity) 
				as numberdefect from defect where updatetime >= now()-interval 3 month
				group by projectname) as b
			on a.projectname=b.projectname
			group by developerusername) as d) as e
	) as finaltable) as final2
on final1.developerusername=final2.developerusername
left outer join
#schedule factor
	(select developerusername, 
	format(1-log(avg(datediff(actualend,actualstart)/datediff(planend,planstart))),4) as schedulefactor,
    avg(datediff(actualend,actualstart)/datediff(planend,planstart)) as scheduleperformance
	from projectallocation pa, project p
	where pa.projectname=p.projectname
	and actualend is not null 
	group by developerusername,type
	having type='eCommerce') as final3
on final2.developerusername=final3.developerusername
order by zainessscore desc;
