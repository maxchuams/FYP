#experience score based on type and project prority and type
select developerusername,format(experiencefactor,4) as experiencefactor  from
(select developerusername,type,points, 
ifnull(if(points<=20,0.8*points/20,0.8 +(0.2/points*(points-20))),0) as experiencefactor 
from
(
select developerusername, type, sum(points) as points
from 
	#using 1*priority as basis of awarding score, can change to more sophiscated scroing later
	(select developerusername, pa.projectname,(1*priority) as points ,type
	from projectallocation pa, project p 
	where pa.projectname = p.projectname
	and actualend is not null
    and type='eCommerce'
	group by developerusername,projectname,psize,priority,type) as temp
group by developerusername, type
) experiencetable) as final;

