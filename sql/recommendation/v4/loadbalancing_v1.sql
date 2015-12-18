#Workload by no of overlapping mandays
select username as developerusername, 
ifnull(overlapproject,0) as overlapproject, 
ifnull(earlieststart,'2014-12-04') earlieststart,
ifnull(scheduleperformance,1.0) as scheduleperformance,
ceiling(ifnull(scheduleperformance,1.0)*14) as estimateworkingday,
ceiling(ifnull(scheduleperformance,1.0)*14/(5/7)) as estimateday,
nationality,
#need to manually account for weekend using 5/7
date_add(ifnull(earlieststart,'2014-12-04'), interval ceiling(ifnull(scheduleperformance,1.0)*14/(5/7)) day) as estimatecompletion,
date_add(ifnull(earlieststart,'2014-12-04'), interval ceiling(14/(5/7)) day) as idealcompletion
from 
		(select ds.username as username, nationality  
        from developerskill ds, developer d where d.username=ds.username 
        and skill ='eCommerce') as developerskill
left outer join
	(select developerusername, 
	avg(datediff(actualend,actualstart)/datediff(planend,planstart)) as scheduleperformance
	from projectallocation pa, project p
	where pa.projectname=p.projectname
	and actualend is not null 
	group by developerusername,type
	having type='eCommerce') as timeliness
on timeliness.developerusername=developerskill.username
left outer join 
	#planday+1 weekend accounted for
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
		and planstart <= date_add('2014-03-04', interval 14 day)) as earliestfree
	group by developerusername) as overlap
on overlap.developerusername = developerskill.username
order by estimatecompletion asc, estimateworkingday asc;