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
as experiencetable) as finaltable;
                
                
			
            
            