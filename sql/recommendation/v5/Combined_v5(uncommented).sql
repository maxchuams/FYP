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
(select username as developerusername, 
		ifnull(overlapproject,0) as overlapproject, 
		ifnull(earlieststart,'2014-03-04') earlieststart,
		ifnull(scheduleperformance,1.0) as scheduleperformance,
		ceiling(floor(ifnull(scheduleperformance,1.0)*10)) as estimateworkingday,
        ceiling(floor(ifnull(scheduleperformance,1.0)*10/(5/7))) as estimateday,
        nationality,
		date_add(ifnull(earlieststart,'2014-03-04'), interval ceiling(floor(ifnull(scheduleperformance,1.0)*10/(5/7))) day) as estimatecompletion,
		date_add(ifnull(earlieststart,'2014-03-04'), interval ceiling(floor(10/(5/7))) day) as idealcompletion
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
			(select developerusername,max(date_add(actualstart, interval planday+1 day)) as earlieststart, 
			count(developerusername) as overlapproject
				from 
				(select developerusername,datediff(planend, planstart) as planday,actualstart
				from projectallocation
				where
				actualstart is not null 
				and actualend is null
				and planend >= '2014-03-04'
				and planstart <= date_add('2014-03-04', interval 10 day)) as earliestfree
			group by developerusername) as overlap
		on overlap.developerusername = developerskill.username
) as loadbalance
inner join
(select final.developerusername,
		ifnull(scheduleperformance,1) as scheduleperformance,ifnull(schedulefactor,0) as schedulefactor,
		ifnull(experiencefactor,0) as experiencefactor, ifnull(projectcount,0) as projectcount,
		ifnull(defectlessfactor,0) defectlessfactor,ifnull(avgdefectperproject,0) as avgdefectperproject,
		format((0.33*ifnull(experiencefactor,0) + 0.33*ifnull(defectlessfactor,0) + 0.33*ifnull(schedulefactor,0)),4) as zainessscore
		from
			(select username as developerusername from developerskill where skill ='eCommerce') as final
		left outer join
			(select developerusername,format(experiencefactor,4) as experiencefactor, projectcount from
			(select developerusername,type,points, projectcount,
			ifnull(if(points<=20,0.8*points/20,0.8 +(0.2/points*(points-20))),0) as experiencefactor 
			from
			(
			select developerusername, type, sum(points) as points, count(developerusername) as projectcount
			from 
				(select developerusername, pa.projectname,(1*priority) as points ,type
				from projectallocation pa, project p 
				where pa.projectname = p.projectname
				and actualend is not null
				and type='eCommerce'
				group by developerusername,projectname,psize,priority,type) as temp
			group by developerusername, type
			) experiencetable) as finaltable) as final1
		on final1.developerusername=final.developerusername
		left outer join
			(select developerusername, format(1-pavgdcount,4)as defectlessfactor, avgdefectperproject
			from
			(
			select username as developerusername,defectpoint, defectcount, projectcount
			avgdefectperproject, 
			meanavgdefectperproject, 
			sdavgdefectperproject, 
			format((avgdefectperproject - meanavgdefectperproject)/sdavgdefectperproject,2) as zavgdcount,
			(select pvalue from ztable where zvalue=format((avgdefectperproject - meanavgdefectperproject)/sdavgdefectperproject,2)) as pavgdcount,			
			avgdefectpointperproject, 			
			meanavgdefectpointsperproject,			
			sdavgdefectpointsperproject, 
			format((avgdefectpointperproject - meanavgdefectpointsperproject)/sdavgdefectpointsperproject,2) as zavgdpoint,
			(select pvalue from ztable where zvalue=format((avgdefectpointperproject - meanavgdefectpointsperproject)/sdavgdefectpointsperproject,2)) as pavgdpoint
			from developer
			left outer join
				(select developerusername, 
					ifnull(sum(severity),0) as defectpoint, 
					ifnull(sum(numberdefect),0) as defectcount, 
					ifnull(count(developerusername),0) as projectcount,
					(ifnull(sum(numberdefect),0)/ifnull(count(developerusername),0) ) as avgdefectperproject, 
					(ifnull(sum(severity),0)/ifnull(count(developerusername),0) ) as avgdefectpointperproject		
					from
					(select developerusername, projectname from projectallocation 
						where actualend is not null group by projectname,developerusername) as a
					left outer join
					(select projectname, sum(severity) as severity, count(severity) 
						as numberdefect from defect where updatetime >= now()-interval 3 month
						group by projectname) as b
					on a.projectname=b.projectname
					group by developerusername
				) as c
			 on developer.username=c.developerusername
			 cross join
				(select sum(defectpoint)/sum(projectcount) as meanavgdefectpointsperproject, 
					sum(defectcount)/sum(projectcount) as meanavgdefectperproject,
					STD(defectpoint/projectcount) as sdavgdefectpointsperproject, 
					STD(defectcount/projectcount) as sdavgdefectperproject
					from (
					select developerusername, 
					ifnull(sum(severity),0) as defectpoint, 
					ifnull(sum(numberdefect),0) as defectcount, 
					ifnull(count(developerusername),0) as projectcount	
					from
					(select developerusername, projectname from projectallocation 
						where actualend is not null group by projectname,developerusername) as a
					left outer join
					(select projectname, sum(severity) as severity, count(severity) 
						as numberdefect from defect where updatetime >= now()-interval 3 month
						group by projectname) as b
					on a.projectname=b.projectname
					group by developerusername) as d) as e
			) as finaltable) as final2
		on final1.developerusername=final2.developerusername
		left outer join
			(select developerusername, 
			format(1-log(avg(datediff(actualend,actualstart)/datediff(planend,planstart))),4) as schedulefactor,
			avg(datediff(actualend,actualstart)/datediff(planend,planstart)) as scheduleperformance
			from projectallocation pa, project p
			where pa.projectname=p.projectname
			and actualend is not null 
			group by developerusername,type
			having type='eCommerce') as final3
		on final2.developerusername=final3.developerusername
) as zainess
on zainess.developerusername=loadbalance.developerusername
ORDER BY 
    CASE sorting
        WHEN 1 THEN zainessscore 
        ELSE '' END
DESC,
CASE sorting
        WHEN 0 THEN estimatecompletion
        ELSE  '' END
ASC;