#developers with the necessary skills
select ds.username as username, nationality  
from developerskill ds, developer d where d.username=ds.username 
and skill ='eCommerce';


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
group by developerusername;



#earliest start and number of overlapping projects. Outer query push earleststartdate to a weekday
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
	group by  developerusername) as earlieststarttable;


update projectallocation set actualend = '2017-12-12';

set sql_safe_updates=0;


#general expression to get number of business days between 2 dates
SELECT 5 * (DATEDIFF(@E, @S) DIV 7) 
+ MID('0123444401233334012222340111123400001234000123440', 
7 * WEEKDAY(@S) + WEEKDAY(@E) + 1, 1);