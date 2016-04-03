#schedule factor based on project type
select developerusername,
#1- p-value of developer individual schedule factor against population
1-(select pvalue from ztable where zvalue=
            (if(((avg(datediff(actualend,actualstart)/datediff(planend,planstart))) - meanscheduleperformance)/sdscheduleperformance>3.5,3.5,format(((avg(datediff(actualend,actualstart)/datediff(planend,planstart))) - meanscheduleperformance)/sdscheduleperformance,2)))
            ) as schedulefactor,
avg(datediff(actualend,actualstart)/datediff(planend,planstart)) as scheduleperformance
from projectallocation pa inner join project p
on pa.projectname=p.projectname
cross join
	#table for SD and mean schedule performace
	(select avg(scheduleperformance) as meanscheduleperformance, std(scheduleperformance) as sdscheduleperformance
	from (
		#schedule performance of indivudual for a project type
		select avg(datediff(actualend,actualstart)/datediff(planend,planstart)) as scheduleperformance
		from projectallocation pa, project p
		where pa.projectname=p.projectname
		and type='eCommerce'
		and actualend is not null 
		group by developerusername ) as meanperformance) as sdmeantable
where type='eCommerce'
and actualstart is not null and actualend is not null and planstart is not null and planend is not null 
group by developerusername;