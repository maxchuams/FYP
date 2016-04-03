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
				) as finaltable;