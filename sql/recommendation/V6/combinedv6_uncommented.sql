select loadbalance.developerusername as developer,
nationality, 
overlapproject as currentproject, 
earlieststart, 
estimateworkingday,
estimateday, 
loadbalance.scheduleperformance, 
estimatecompletion, 
idealcompletion, 
defectlessfactor,
schedulefactor,
avgdefectperproject,
experiencefactor,
projectcount,
zainessscore,
@sorting:=? as sorting
from
(select developerusername,overlapproject,earlieststart, scheduleperformance, nationality,estimateworkingday, estimateday,
CASE WEEKDAY(estimatecompletion) when 1 then date_add(estimatecompletion, interval 1 day) when 7 then date_add(estimatecompletion, interval 2 day) else estimatecompletion END as estimatecompletion,
CASE WEEKDAY(idealcompletion) when 1 then date_add(idealcompletion, interval 1 day) when 7 then date_add(idealcompletion, interval 2 day) else idealcompletion END as idealcompletion
from(
select username as developerusername, 
ifnull(overlapproject,0) as overlapproject, 
ifnull(earlieststart,?) as earlieststart,
ifnull(pertscheduleperformance,1.0) as scheduleperformance,
ceiling(floor(ifnull(pertscheduleperformance,1.0)*?)) as estimateworkingday,
ceiling(floor(ifnull(pertscheduleperformance,1.0)*?/(5/7))) as estimateday,
nationality,
date_add(ifnull(earlieststart,?), interval ceiling(floor(ifnull(pertscheduleperformance,1.0)*?/(5/7))) day) as estimatecompletion,
date_add(ifnull(earlieststart,?), interval ceiling(floor(?/(5/7))) day) as idealcompletion
from(select ds.username as username, nationality  
from developerskill ds, developer d where d.username=ds.username 
and skill =?
) as developerskill
left outer join
(select developerusername, 
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
and type=?
and actualstart is not null and actualend is not null and planstart is not null and planend is not null
group by developerusername
) as timeliness
on timeliness.developerusername=developerskill.username
left outer join 
(select developerusername, 
CASE WEEKDAY(earlieststart) when 1 then date_add(earlieststart, interval 1 day) when 7 then date_add(earlieststart, interval 2 day) else earlieststart END
as earlieststart, overlapproject
from (
select developerusername,
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
and ds.skill =?
and actualstart is not null 
and actualend is null
and planend >= ?
and planstart <= date_add(?, interval (?)/5*7 day)
group by  developerusername) as earlieststarttable
) as overlap
on overlap.developerusername = developerskill.username) as loadbalancing
) as loadbalance
left outer join
(select final.developerusername,
ifnull(scheduleperformance,1) as scheduleperformance,ifnull(schedulefactor,0) as schedulefactor,
ifnull(experiencefactor,0) as experiencefactor, ifnull(projectcount,0) as projectcount,
ifnull(defectlessfactor,0) defectlessfactor,ifnull(avgdefectperproject,0) as avgdefectperproject,
format((?*ifnull(experiencefactor,0) + ?*ifnull(defectlessfactor,0) + ?*ifnull(schedulefactor,0)),4) as zainessscore
from
(select username as developerusername from developerskill where skill =?) as final
left outer join
(select developerusername,format(experiencefactor,4) as experiencefactor, projectcount from
(select developerusername, points, projectcount,
ifnull(if(points<=20,0.8*points/20,0.8 +(0.2/points*(points-20))),0) as experiencefactor 
from (select developerusername, sum((priority+1)) as points, count(pa.projectname) as projectcount 
		from projectallocation pa, project p 
		where pa.projectname = p.projectname
		and actualend is not null
		and type=?
	group by developerusername)
as experiencetable) as finaltable
) as final1
on final.developerusername=final1.developerusername
left outer join
(select developerusername, ifnull(format(1-pavgdpoint,4),1) as defectlessfactor, ifnull(avgdefectperproject,0) as avgdefectperproject
from(select username as developerusername,defectpoint, defectcount, projectcount,
avgdefectperproject, 
meanavgdefectperproject, 
sdavgdefectperproject, 
format((avgdefectperproject - meanavgdefectperproject)/sdavgdefectperproject,2) as zavgdcount,
(select pvalue from ztable where zvalue=
(if((avgdefectperproject - meanavgdefectperproject)/sdavgdefectperproject>3.5,3.5,format((avgdefectperproject - meanavgdefectperproject)/sdavgdefectperproject,2)))
) as pavgdcount,		
avgdefectpointperproject, 			
meanavgdefectpointsperproject,			
sdavgdefectpointsperproject, 
format((avgdefectpointperproject - meanavgdefectpointsperproject)/sdavgdefectpointsperproject,2) as zavgdpoint,
(select pvalue from ztable where 
zvalue =(if((avgdefectpointperproject - meanavgdefectpointsperproject)/sdavgdefectpointsperproject>3.5,3.5,format((avgdefectpointperproject - meanavgdefectpointsperproject)/sdavgdefectpointsperproject,2)))
) as pavgdpoint
from developer
left outer join
(select developerusername, sum(totaldefectpoints) as defectpoint, sum(totaldefects) as defectcount,
avg(totaldefectpoints) as avgdefectpointperproject, avg(totaldefects) as avgdefectperproject, count(projectname) as projectcount
from	
	(select pd.developerusername as developerusername, pd.projectname as projectname, ifnull(sum(severity),0) as totaldefectpoints, count(severity) as totaldefects
	from
	(
	select developerusername, p.projectname from projectallocation pa, project p
	where p.projectname = pa.projectname and p.type=?
	and actualstart >= now()-interval 3 month group by projectname, developerusername
    ) as pd 
	left outer join
	(select projectname, committedby as developerusername,severity from defectcommitby dc left outer join defect d on dc.defectid = d.defectid where updatetime >= now()-interval 3 month) as dc
	on pd.developerusername = dc.developerusername and pd.projectname = dc.projectname
	group by pd.developerusername, pd.projectname) as defectbyallocation
	group by developerusername
	) as c
on developer.username=c.developerusername
cross join
(select avg(avgdefectpoint) as meanavgdefectpointsperproject,
avg(avgdefectcount) as meanavgdefectperproject,
STD(avgdefectpoint/projectcount) as sdavgdefectpointsperproject, 
STD(avgdefectcount/projectcount) as sdavgdefectperproject
from (
select developerusername, avg(totaldefectpoints) as avgdefectpoint, avg(totaldefects) as avgdefectcount, count(projectname) as projectcount
from	
(select pd.developerusername as developerusername, pd.projectname as projectname, ifnull(sum(severity),0) as totaldefectpoints, count(severity) as totaldefects
from
(
select developerusername, p.projectname from projectallocation pa, project p
where p.projectname = pa.projectname and p.type=?
and actualstart >= now()-interval 3 month group by projectname, developerusername
) as pd 
left outer join
(select projectname, committedby as developerusername,severity from defectcommitby dc left outer join defect d on dc.defectid = d.defectid where updatetime >= now()-interval 3 month) as dc
on pd.developerusername = dc.developerusername and pd.projectname = dc.projectname
group by pd.developerusername, pd.projectname) as defectbyallocation
group by developerusername) as d) as e) as finaltable) as final2	
on final.developerusername=final2.developerusername
left outer join
(select developerusername,
1-(select pvalue from ztable where zvalue=
		(if(((avg(datediff(actualend,actualstart)/datediff(planend,planstart))) - meanscheduleperformance)/sdscheduleperformance>3.5,3.5,format(((avg(datediff(actualend,actualstart)/datediff(planend,planstart))) - meanscheduleperformance)/sdscheduleperformance,2)))
		) as schedulefactor,
avg(datediff(actualend,actualstart)/datediff(planend,planstart)) as scheduleperformance
from projectallocation pa inner join project p
on pa.projectname=p.projectname
cross join
(select avg(scheduleperformance) as meanscheduleperformance, std(scheduleperformance) as sdscheduleperformance
from (
	select avg(datediff(actualend,actualstart)/datediff(planend,planstart)) as scheduleperformance
	from projectallocation pa, project p
	where pa.projectname=p.projectname
	and type=?
	and actualend is not null 
	group by developerusername ) as meanperformance) as sdmeantable
where type=?
and actualstart is not null and actualend is not null and planstart is not null and planend is not null 
group by developerusername
) as final3
on final.developerusername=final3.developerusername
) as zainess
on zainess.developerusername=loadbalance.developerusername
ORDER BY 
CASE sorting
        WHEN 1 THEN zainessscore 
        ELSE '' END
DESC,
CASE sorting
        WHEN 1 THEN estimatecompletion
        ELSE '' END
ASC,
CASE sorting
        WHEN 0 THEN estimatecompletion
        ELSE  '' END
ASC,
CASE sorting
        WHEN 0 THEN zainessscore 
        ELSE  '' END
DESC;