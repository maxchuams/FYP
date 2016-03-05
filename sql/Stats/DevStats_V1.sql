#getDefectScore(String devusername) --> Quality
#getDefectScoreRW() --> Quality


#getExperienceScore(String devusername)
#getExperienceScoreRW()


#getTimelinessScore(String Devusername)
#getTimelinessScoreRW()

#getSkill dev
#retrieveDevSkillString(String username) - Done in SkillDAO
#number of skill rw

#getAverageDefect(String username, int month, String type)


        
        
        
        
        
        
        #timeliness
        select developerusername, 
			format(1-log(avg(datediff(actualend,actualstart)/datediff(planend,planstart))),4) as schedulefactor,
			avg(datediff(actualend,actualstart)/datediff(planend,planstart)) as scheduleperformance
			from projectallocation pa, project p
			where pa.projectname=p.projectname
			and actualend is not null 
			group by developerusername,type;