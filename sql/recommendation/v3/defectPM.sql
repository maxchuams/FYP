select defectid,d.projectname,defectname,description,reportby,updatetime, iscomplete,severity,filtering, filteringvalue,sorting
from defect d, 
(
select projectname,
@filtering := 'projectname' as filtering,
@filteringvalue := 'recco' as filteringvalue,
@inputdeveloperusername := 'kaiwen12' as inputpmusername,
@sorting:= 'defectname' as sorting
from project group by 
assignby , projectname 
having assignby = inputpmusername
) as p
where d.projectname = p.projectname
AND
 CASE filtering
        WHEN 'projectname' THEN d.projectname
        WHEN 'severity' THEN severity
        WHEN 'iscomplete' THEN iscomplete
        ELSE '' END
=filteringvalue
ORDER BY 
    CASE sorting
        WHEN 'updatetime' THEN updatetime 
        ELSE '' END
DESC,
CASE sorting
        WHEN 'defectname' THEN defectname
        WHEN 'projectname' THEN d.projectname
        ELSE  '' END
ASC;
	