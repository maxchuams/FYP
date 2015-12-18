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
on overlap.developerusername = developer.username;

