#expected number of project and manhours per person
#total number of allocated mandays divide by numbers of developers for choosen period
#taken project size into account
select sum(psize)/devCount as avgProjectperDev, sum(mandays)/devCount as avgManhourperDev
from(
	#total mandays per project
    select developmentMH.projectname, datediff(e,s)*psize as mandays, psize
	from
	(select projectname, min(planstart) as s, max(planend) as e
	from projectallocation pa
	where planend >= '2013-03-04' 
	#omit project that fall outside period, planend must after start and planstart must be before end
	and planstart <= '2017-12-04'
	group by pa.projectname) as developmentMH, project p
    where developmentMH.projectname = p.projectname) as temp1, (select count(*) as devCount from developer
    ) as temp2;