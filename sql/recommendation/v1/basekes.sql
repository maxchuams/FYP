select username, ifnull(numberofprojectsinperiod,0) as workload, ifnull(totalscore,0) as defectscore, 
	ifnull(experiencecount,0) as experience, (ifnull(experiencecount,0)- ifnull(totalscore,0)) as PointSystem 
from 
(select username from developerskill where skill = 'ecommerce') as temp1 
left outer join 


(select developerusername, count(*) as numberofprojectsinperiod 
from project, projectallocation where project.projectname = projectallocation.projectname 
and ((duedate>= '2015-10-30' and dateallocated <= '2015-10-30') 
or (duedate>= '2015-09-29' and dateallocated <= '2015-09-29')) group by developerusername) as temp2 
on temp1.username = developerusername 
left outer join 


(select developerusername, sum(defectscore) as totalscore from( 
select developerusername, (count(defectid) * priority) as 
defectscore, project.projectname from project left outer join projectallocation 
on project.projectname = projectallocation.projectname left 
outer join defect on defect.projectname = project.projectname where type = 'ecommerce' and dateallocated >= date_add('2015-10-30', interval - 3 month) 
group by developerusername, projectname) as score group by developerusername) as scores on temp1.username = scores.developerusername 
left outer join 


(select developerusername, count(*) as experiencecount from project, 
projectallocation where project.projectname = projectallocation.projectname and type = 'ecommerce' and priority = 3 group by developerusername) 
as totalSimilarProjects on temp1.username = totalSimilarProjects.developerusername 


order by PointSystem desc, workload asc;