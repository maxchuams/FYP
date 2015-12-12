#Timeliness Factor
#SPI = EV / PV, considering to use this as a 
select developerusername, avg(datediff(actualend,actualstart)/datediff(planend,planstart)) as scheduleperformance
from projectallocation 
where actualend is not null 
group by developerusername;