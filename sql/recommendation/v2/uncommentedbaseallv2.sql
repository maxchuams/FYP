select a.developerusername, overlapmanday/(datediff('2014-12-04','2014-03-04')*(5/7)) as loadfactor, 
 avgdefectpointperproject,scheduleperformance, 
ifnull(if(points<=20,0.8*points/20,0.8 +(0.2/points*(points-20))),0) as experiencefactor
, @priority:= 2 as priority
 from
(	 
	select username as developerusername , ifnull(overlapmanday,0) as overlapmanday,ifnull(overlapproject,0) as overlapproject
	from developer
	left outer join 
		(select overlap.developerusername as developerusername, sum(overlap.overlapday) as overlapmanday,
			count(overlap.overlapday) as overlapproject
			from
			(select developerusername, datediff(least(planend,'2014-12-04'),least(planstart,'2014-03-04')) as overlapday
			from projectallocation
			where
			actualstart is not null 
			and actualend is null
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
	left outer join
		(	select developerusername, ifnull(sum(severity),0) as defectpoint, 
			ifnull(sum(numberdefect),0) as defectcount, ifnull(count(developerusername),0) as projectcount from
			(select developerusername, projectname from projectallocation 
			where actualend is not null group by projectname,developerusername) as a
			left outer join
			(select projectname, -sum(severity) as severity, count(severity) 
			as numberdefect from defect where updatetime >= now()-interval 3 month
			group by projectname) as b
			on a.projectname=b.projectname
			group by developerusername
		) as c
	on developer.username=c.developerusername
) as b,
(	select developerusername, avg(datediff(actualend,actualstart)/datediff(planend,planstart)) as scheduleperformance
	from projectallocation 
	where actualend is not null 
	group by developerusername
) as c
left outer join
(	select developerusername, type, sum(points) as points
	from 
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
and b.developerusername=c.developerusername
having experiencefactor > 0
ORDER BY 
    CASE priority
        WHEN 3 THEN experiencefactor
        WHEN 2 THEN ''
        ELSE  '' END
	DESC,
    CASE priority
        WHEN 3 THEN scheduleperformance
        WHEN 2 THEN loadfactor
        ELSE  experiencefactor END
    ASC,
        CASE priority
        WHEN 3 THEN ''
        WHEN 2 THEN experiencefactor
        ELSE  loadfactor END
	DESC;