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
@sorting:=0 as sorting
from
	#loadbalance
	(
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
		on overlap.developerusername = developerskill.username) as loadbalancing

) as loadbalance
left outer join
#zainess
(select final.developerusername,
		ifnull(scheduleperformance,1) as scheduleperformance,ifnull(schedulefactor,0) as schedulefactor,
		ifnull(experiencefactor,0) as experiencefactor, ifnull(projectcount,0) as projectcount,
		ifnull(defectlessfactor,0) defectlessfactor,ifnull(avgdefectperproject,0) as avgdefectperproject,
		format((0.33*ifnull(experiencefactor,0) + 0.33*ifnull(defectlessfactor,0) + 0.33*ifnull(schedulefactor,0)),4) as zainessscore
		from
		#Table 1: Developer
			(select username as developerusername from developerskill where skill ='wordpress') as final
		left outer join
		#Table 2: Experience Factor
			(
			select developerusername,format(experiencefactor,4) as experiencefactor, projectcount from
				(select developerusername, points, projectcount,
				ifnull(if(points<=20,0.8*points/20,0.8 +(0.2/points*(points-20))),0) as experiencefactor 
				from
					#developer experiece based on count and points for a particular project type
					(select developerusername, sum((priority+1)) as points, count(pa.projectname) as projectcount 
						from projectallocation pa, project p 
						where pa.projectname = p.projectname
						and actualend is not null
						and type='wordpress'
					group by developerusername)
			as experiencetable) as finaltable
            ) as final1
		on final.developerusername=final1.developerusername
		left outer join
		#Table 3: Defect Factor
			(
            select developerusername, ifnull(format(1-pavgdpoint,4),1) as defectlessfactor, ifnull(avgdefectperproject,0) as avgdefectperproject
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
				(
                #average defects count n score and score PER DEVELOPER
				select developerusername, sum(totaldefectpoints) as defectpoint, sum(totaldefects) as defectcount,
				avg(totaldefectpoints) as avgdefectpointperproject, avg(totaldefects) as avgdefectperproject, count(projectname) as projectcount
				from	
					(#For each allocation, how many defects points and number of defects
					#defect score and number of defects of each project, high severity_3pts, mid_2, low_1
					select pd.developerusername as developerusername, pd.projectname as projectname, ifnull(sum(severity),0) as totaldefectpoints, count(severity) as totaldefects
					from
					(#Who did what project for past 3 month
					select developerusername, projectname from projectallocation where actualstart >= now()-interval 3 month group by projectname, developerusername) as pd 
					left outer join
					(#List of defects for past 3 month by developer and project
					select projectname, committedby as developerusername,severity from defectcommitby dc left outer join defect d on dc.defectid = d.defectid where updatetime >= now()-interval 3 month) as dc
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
			#average defects count and score PER DEVELOPER
			select developerusername, avg(totaldefectpoints) as avgdefectpoint, avg(totaldefects) as avgdefectcount, count(projectname) as projectcount
			from	
				(#For each allocation, how many defects points and number of defects
				#defect score and number of defects of each project, high severity_3pts, mid_2, low_1
				select pd.developerusername as developerusername, pd.projectname as projectname, ifnull(sum(severity),0) as totaldefectpoints, count(severity) as totaldefects
				from
				(#Who did what project for past 3 month
				select developerusername, projectname from projectallocation where actualstart >= now()-interval 3 month group by projectname, developerusername) as pd 
				left outer join
				(#List of defects for past 3 month by developer and project
				select projectname, committedby as developerusername,severity from defectcommitby dc left outer join defect d on dc.defectid = d.defectid where updatetime >= now()-interval 3 month) as dc
				on pd.developerusername = dc.developerusername and pd.projectname = dc.projectname
				group by pd.developerusername, pd.projectname) as defectbyallocation
			group by developerusername) as d
            ) as e
				) as finaltable
            ) as final2	
		on final.developerusername=final2.developerusername
		left outer join
		#Table 4: Schedule Factor
			(
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
					and type='wordpress'
					and actualend is not null 
					group by developerusername ) as meanperformance) as sdmeantable
			where type='wordpress'
			and actualstart is not null and actualend is not null and planstart is not null and planend is not null 
			group by developerusername
            ) as final3
		on final.developerusername=final3.developerusername
) as zainess
# Combine the table
on zainess.developerusername=loadbalance.developerusername
ORDER BY 
CASE sorting
        WHEN 1 THEN zainessscore 
        ELSE '' END
DESC,
CASE sorting
        WHEN 0 THEN estimatecompletion
        ELSE  '' END
ASC,
CASE sorting
        WHEN 1 THEN estimatecompletion
        ELSE '' END
DESC,
CASE sorting
        WHEN 0 THEN zainessscore 
        ELSE  '' END
ASC;