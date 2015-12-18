#Timeliness Factor
#SPI = EV / PV, considering to use this as a 
select developerusername, 
format(1-log(avg(datediff(actualend,actualstart)/datediff(planend,planstart))),4) as scheduleperformance
from projectallocation pa, project p
where pa.projectname=p.projectname
and actualend is not null 
group by developerusername,type
having type='eCommerce';
