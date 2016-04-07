select username,overlapproject,earlieststart, scheduleperformance, nationality,estimateworkingday, estimateday,
CASE WEEKDAY(estimatecompletion) when 1 then date_add(estimatecompletion, interval 1 day) when 7 then date_add(estimatecompletion, interval 2 day) else estimatecompletion END as estimatecompletion,
CASE WEEKDAY(idealcompletion) when 1 then date_add(idealcompletion, interval 1 day) when 7 then date_add(idealcompletion, interval 2 day) else idealcompletion END as idealcompletion
from(
select username as developerusername, 
	ifnull(overlapproject,0) as overlapproject, 
	ifnull(earlieststart,Date(now())) as earlieststart,
	ifnull(pertscheduleperformance,1.0) as scheduleperformance,
	ceiling(floor(ifnull(pertscheduleperformance,1.0)*10)) as estimateworkingday,
	ceiling(floor(ifnull(pertscheduleperformance,1.0)*10/(5/7))) as estimateday,
	nationality,
	date_add(ifnull(earlieststart,Date(now())), interval ceiling(floor(ifnull(pertscheduleperformance,1.0)*10/(5/7))) day) as estimatecompletion,
	date_add(ifnull(earlieststart,Date(now())), interval ceiling(floor(10/(5/7))) day) as idealcompletion
	from
		(select ds.username as username, nationality  
		from developerskill ds, developer d where d.username=ds.username 
		and skill ='ecommerce'
		) as developerskill
	left outer join
		(
		select developerusername, 
		min(datediff(actualend,actualstart)/datediff(planend,planstart)) as bestscheduleperformance,
		avg(datediff(actualend,actualstart)/datediff(planend,planstart)) as likelyscheduleperformance,
		max(datediff(actualend,actualstart)/datediff(planend,planstart)) as worstscheduleperformance,
		(min(datediff(actualend,actualstart)/datediff(planend,planstart))
		+4*avg(datediff(actualend,actualstart)/datediff(planend,planstart))
		+max(datediff(actualend,actualstart)/datediff(planend,planstart)))/6 as pertscheduleperformance,
		POW(max(datediff(actualend,actualstart)/datediff(planend,planstart))
		+min(datediff(actualend,actualstart)/datediff(planend,planstart)),2)/POW(6,2) as variancescheduleperformance
		from projectallocation pa, project p
		where pa.projectname=p.projectname
		and type='ecommerce'
		and actualstart is not null and actualend is not null and planstart is not null and planend is not null
		group by developerusername
		) as timeliness
	on timeliness.developerusername=developerskill.username
	left outer join 
		(select developerusername, 
		CASE WEEKDAY(earlieststart) when 1 then date_add(earlieststart, interval 1 day) when 7 then date_add(earlieststart, interval 2 day) else earlieststart END
		as earlieststart, overlapproject
		from (select developerusername,
			max(date_add(actualstart, interval 
			(SELECT 5 * (DATEDIFF(planend, planstart) DIV 7) 
			+ MID('0123444401233334012222340111123400001234000123440', 
			7 * WEEKDAY(planstart) + WEEKDAY(planend) + 1, 1)) + 
			(SELECT 2 * (DATEDIFF(planend, planstart) DIV 7) 
			+ MID('0123444401233334012222340111123400001234000123440', 
			7 * WEEKDAY(planstart) + WEEKDAY(planend) + 1, 1))
			+1 day)) as earlieststart,
			count(developerusername) as overlapproject
			from developerskill ds, developer d, projectallocation pa
			where d.username=ds.username 
			and d.username = pa.developerusername
			and ds.skill ='ecommerce'
			and actualstart is not null 
			and actualend is null
			and planend >= Date(now())
			and planstart <= date_add(Date(now()), interval (10)/5*7 day)
			group by  developerusername) as earlieststarttable
		) as overlap
	on overlap.developerusername = developerskill.username) as loadbalancing
right outer join
(select username from developer) as developer on developer.username=loadbalancing.developerusername
order by -estimatecompletion desc,-earlieststart desc;