#public static double getExperienceScore(String devusername, int year)
select format(ifnull(if(points<=20,0.8*points/20,0.8 +(0.2/points*(points-20))),0),4) as experiencefactor
from
(select developerusername, sum((priority+1)) as points, count(pa.projectname) as projectcount 
from projectallocation pa, project p 
where pa.projectname = p.projectname
and year(dateallocated)='2016' 
and actualend is not null
group by developerusername)
as experiencetable
where developerusername='pukpik';

#public static double getExperienceScoreRW(int year)
select format(avg(ifnull(if(points<=20,0.8*points/20,0.8 +(0.2/points*(points-20))),0)),2) as experiencefactor
from
(select developerusername, sum((priority+1)) as points, count(pa.projectname) as projectcount 
from projectallocation pa, project p 
where pa.projectname = p.projectname
and year(dateallocated)='2016' 
and actualend is not null
group by developerusername)
as experiencetable;

#public static HashMap<String, Double> getLoadRW(int year)
select month, format(avg(count),2) as count from ( 
select MONTHNAME(actualstart) as month,  count(distinct pa.projectname) as count 
from project p, projectallocation pa 
where p.projectname=pa.projectname 
and actualstart is not null 
and year(actualstart) = 2016 
group by developerusername, month) as temp 
group by month;

#public static HashMap<String, Double> getLoadDev(String devname, int year) 
select MONTHNAME(actualstart) as month,  count(distinct pa.projectname) as count 
from project p, projectallocation pa 
where p.projectname=pa.projectname 
and actualstart is not null 
and developerusername = 'bahri_ripplewerkz'
and year(actualstart) = 2016 
group by developerusername, month;

#public static double getDefectScore(String devusername, int year)
select format(ifnull(1-pavgdpoint,1),2) as defectlessfactor
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
					(select developerusername, projectname from projectallocation where year(actualstart)='2016' group by projectname, developerusername
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
				(
				select pd.developerusername as developerusername, pd.projectname as projectname, ifnull(sum(severity),0) as totaldefectpoints, count(severity) as totaldefects
				from
				(
				select developerusername, projectname from projectallocation where year(actualstart)='2016' group by projectname, developerusername
                ) as pd 
				left outer join
				(
				select projectname, committedby as developerusername,severity from defectcommitby dc left outer join defect d on dc.defectid = d.defectid where updatetime >= now()-interval 3 month) as dc
				on pd.developerusername = dc.developerusername and pd.projectname = dc.projectname
				group by pd.developerusername, pd.projectname) as defectbyallocation
			group by developerusername) as d
            ) as e
				) as finaltable
where developerusername='pukpik';


#public static double getDefectScoreRW()
select format(avg(ifnull(1-pavgdpoint,1)),2) as defectlessfactor
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
					(select developerusername, projectname from projectallocation where year(actualstart)='2016' group by projectname, developerusername
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
				(
				select pd.developerusername as developerusername, pd.projectname as projectname, ifnull(sum(severity),0) as totaldefectpoints, count(severity) as totaldefects
				from
				(
				select developerusername, projectname from projectallocation where year(actualstart)='2016' group by projectname, developerusername
                ) as pd 
				left outer join
				(
				select projectname, committedby as developerusername,severity from defectcommitby dc left outer join defect d on dc.defectid = d.defectid where updatetime >= now()-interval 3 month) as dc
				on pd.developerusername = dc.developerusername and pd.projectname = dc.projectname
				group by pd.developerusername, pd.projectname) as defectbyallocation
			group by developerusername) as d
            ) as e
				) as finaltable;

#public static double getTimelinessScore(String devusername, int year)
select schedulefactor from(
select developerusername,
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
and year(actualstart)='2016' 
and actualend is not null 
group by developerusername ) as meanperformance) as sdmeantable
where actualstart is not null and actualend is not null and planstart is not null and planend is not null 
and year(actualstart)='2016' 
group by developerusername) as final
where developerusername = 'pukpik';


# public static double getTimelinessScoreRW(int year)    
select format(avg(schedulefactor) as score,2) from(
select developerusername,
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
and year(actualstart)='2016' 
and actualend is not null 
group by developerusername ) as meanperformance) as sdmeantable
where actualstart is not null and actualend is not null and planstart is not null and planend is not null 
and year(actualstart)='2016' 
group by developerusername) as final;
            
      
            
            
            
            
            
            
            
            
            

            
            
            
#getAverageDefect(String username, int month, String type)
select format(ifnull(avgdefectperproject,0),2) as avgdefectperproject
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
                    select developerusername, p.projectname from projectallocation pa, project p where pa.projectname = p.projectname and p.type='ecommerce'and year(actualstart)='2016' group by projectname, developerusername
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
				(
				select pd.developerusername as developerusername, pd.projectname as projectname, ifnull(sum(severity),0) as totaldefectpoints, count(severity) as totaldefects
				from
				(
				select developerusername, p.projectname from projectallocation pa, project p where pa.projectname = p.projectname and p.type='ecommerce'and year(actualstart)='2016' group by projectname, developerusername
                ) as pd 
				left outer join
				(
				select projectname, committedby as developerusername,severity from defectcommitby dc left outer join defect d on dc.defectid = d.defectid where updatetime >= now()-interval 3 month) as dc
				on pd.developerusername = dc.developerusername and pd.projectname = dc.projectname
				group by pd.developerusername, pd.projectname) as defectbyallocation
			group by developerusername) as d
            ) as e
				) as finaltable
where developerusername='pukpik';
            

		


        