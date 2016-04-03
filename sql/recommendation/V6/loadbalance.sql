#loadbalancing query, outer query to omit weekend result in date
select developerusername,overlapproject,earlieststart, scheduleperformance, nationality,estimateworkingday, estimateday,
CASE WEEKDAY(estimatecompletion) when 1 then date_add(estimatecompletion, interval 1 day) when 7 then date_add(estimatecompletion, interval 2 day) else estimatecompletion END as estimatecompletion,
CASE WEEKDAY(idealcompletion) when 1 then date_add(idealcompletion, interval 1 day) when 7 then date_add(idealcompletion, interval 2 day) else idealcompletion END as idealcompletion
from(
#loadbalancing query
select username as developerusername, 
		ifnull(overlapproject,0) as overlapproject, 
		ifnull(earlieststart,'2016-04-02') as earlieststart,
		ifnull(pertscheduleperformance,1.0) as scheduleperformance,
		ceiling(floor(ifnull(pertscheduleperformance,1.0)*10)) as estimateworkingday,
        ceiling(floor(ifnull(pertscheduleperformance,1.0)*10/(5/7))) as estimateday,
        nationality,
        date_add(ifnull(earlieststart,'2016-04-02'), interval ceiling(floor(ifnull(pertscheduleperformance,1.0)*10/(5/7))) day) as estimatecompletion,
        date_add(ifnull(earlieststart,'2016-04-02'), interval ceiling(floor(10/(5/7))) day) as idealcompletion
        from
			#developers with the necessary skills
			(
            #developers with the necessary skills
			select ds.username as username, nationality  
			from developerskill ds, developer d where d.username=ds.username 
			and skill ='wordpress'
            ) as developerskill
		left outer join
			(
			#developers performace measure in term of schedule and for the type of project
			select developerusername, 
			#best case
			min(datediff(actualend,actualstart)/datediff(planend,planstart)) as bestscheduleperformance,
			#likely case
			avg(datediff(actualend,actualstart)/datediff(planend,planstart)) as likelyscheduleperformance,
			#
			max(datediff(actualend,actualstart)/datediff(planend,planstart)) as worstscheduleperformance,
			#using PERT (Optimistic+4likely+Persimistic)/6
			(min(datediff(actualend,actualstart)/datediff(planend,planstart))
			+4*avg(datediff(actualend,actualstart)/datediff(planend,planstart))
			+max(datediff(actualend,actualstart)/datediff(planend,planstart)))/6 as pertscheduleperformance,
			#Possible variance of Pert Estimation
			POW(max(datediff(actualend,actualstart)/datediff(planend,planstart))
			+min(datediff(actualend,actualstart)/datediff(planend,planstart)),2)/POW(6,2) as variancescheduleperformance
			from projectallocation pa, project p
			where pa.projectname=p.projectname
			and type='wordpress'
			and actualstart is not null and actualend is not null and planstart is not null and planend is not null
			group by developerusername
            ) as timeliness
        on timeliness.developerusername=developerskill.username
		left outer join 
			(
			#earliest start and number of overlapping projects. Outer query omit weekend result in earleststartdate
			select developerusername, 
			#prevent earliest start to fall on a weekend
			CASE WEEKDAY(earlieststart) when 1 then date_add(earlieststart, interval 1 day) when 7 then date_add(earlieststart, interval 2 day) else earlieststart END
			as earlieststart, overlapproject
			from (
				#earliest start and number of overlapping projects
				select developerusername,
				max(date_add(actualstart, interval 
				#add number or working days
				(SELECT 5 * (DATEDIFF(planend, planstart) DIV 7) 
				+ MID('0123444401233334012222340111123400001234000123440', 
				7 * WEEKDAY(planstart) + WEEKDAY(planend) + 1, 1)) + 
				#add number or weekend days
				(SELECT 2 * (DATEDIFF(planend, planstart) DIV 7) 
				+ MID('0123444401233334012222340111123400001234000123440', 
				7 * WEEKDAY(planstart) + WEEKDAY(planend) + 1, 1))
				#the next day after completion
				+1 day)) as earlieststart,
				count(developerusername) as overlapproject
				from developerskill ds, developer d, projectallocation pa
				where d.username=ds.username 
				and d.username = pa.developerusername
				and ds.skill ='wordpress'
				and actualstart is not null 
				and actualend is null
				and planend >= '2016-04-02'
				and planstart <= date_add('2016-04-02', interval (10)/5*7 day)
				group by  developerusername) as earlieststarttable
            ) as overlap
		on overlap.developerusername = developerskill.username) as loadbalancing;