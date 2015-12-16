select a.developerusername, overlapmanday,overlapproject, defectpoint,
 defectcount,avgdefectperproject,avgdefectpointperproject,scheduleperformance,type, ifnull(points,0) as experiencepoints 
 from
(	
    #Workload by no of overlapping mandays
	select username as developerusername , ifnull(overlapmanday,0) as overlapmanday,ifnull(overlapproject,0) as overlapproject
	from developer
	left outer join 
		(select overlap.developerusername as developerusername, sum(overlap.overlapday) as overlapmanday,
			count(overlap.overlapday) as overlapproject
			from
			(select developerusername, datediff(least(planend,'2014-12-04'),least(planstart,'2014-03-04')) as overlapday
			from projectallocation
			where
			#omit project that have  ended
			actualstart is not null 
			and actualend is null
			#omit project that fall outside period, planend must after start and planstart must be before end
			and planend >= '2014-03-04' 
			and planstart <= '2014-12-04') as overlap
		group by overlapday) as overlap
	on overlap.developerusername = developer.username
) as a,
(
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
	on developer.username=c.developerusername
) as b,
(
	#Timeliness Factor
	#SPI = EV / PV, considering to use this as a 
	select developerusername, avg(datediff(actualend,actualstart)/datediff(planend,planstart)) as scheduleperformance
	from projectallocation 
	where actualend is not null 
	group by developerusername
) as c
left outer join
(
	#experience score based on type and project prority
	select developerusername, type, sum(points) as points
	from 
		#using 1*priority as basis of awarding score, can change to more sophiscated scroing later
		(select developerusername, pa.projectname,(1*priority) as points ,type
		from projectallocation pa, project p 
		where pa.projectname = p.projectname
		and actualend is not null
		and type='eCommerce'
		group by developerusername,projectname,psize,priority,type) as temp
	group by developerusername, type
) as d
on c.developerusername=d.developerusername
where a.developerusername=b.developerusername
and b.developerusername=c.developerusername;

