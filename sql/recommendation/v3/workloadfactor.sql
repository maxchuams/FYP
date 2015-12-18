#Workload by no of overlapping mandays
select username as developerusername, 
ifnull(overlapproject,0) as overlapproject, 
ifnull(earlieststart,'2014-12-04') earlieststart,
ifnull(scheduleperformance,1.0) as scheduleperformance,
ceiling(ifnull(scheduleperformance,1.0)*14) as estimateday,
date_add(ifnull(earlieststart,'2014-12-04'), interval ceiling(ifnull(scheduleperformance,1.0)*14) day) as estimatecompletion
from developer
left outer join
	(select developerusername, 
	format(1-log(avg(datediff(actualend,actualstart)/datediff(planend,planstart))),4) as scheduleperformance
	from projectallocation pa, project p
	where pa.projectname=p.projectname
	and actualend is not null 
	group by developerusername,type
	having type='eCommerce') as timeliness
on timeliness.developerusername=developer.username
left outer join 
	(select developerusername,max(date_add(actualstart, interval planday+1 day)) as earlieststart, 
    count(developerusername) as overlapproject
		from 
		(select developerusername,datediff(planend, planstart) as planday,actualstart
		from projectallocation
		where
		#omit project that have ended
		actualstart is not null 
		and actualend is null
		#omit project that fall outside period, planend must after start and planstart must be before end
		and planend >= '2014-03-04' 
		
        ) as earliestfree
	group by developerusername) as overlap
on overlap.developerusername = developer.username
order by estimatecompletion asc, estimateday asc;