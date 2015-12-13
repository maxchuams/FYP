/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author KIANLAM
 */
public class RecommedationDAO {
//Recommendation(String username, double loadFactor, double defectScore, 
    //double scheduleScore, double experienceScore) 
    public static ArrayList<Recommendation> getRecommendation(String projectType,
            String projectStartDate, String projectEndDate, int priority) {
        ArrayList<Recommendation> recommendations = new ArrayList<Recommendation>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Person user = null;
        Date sDate = null;
        Date eDate = null;
        String queryStr = null;
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try {
            sDate = formatter.parse(projectStartDate);
            eDate = formatter.parse(projectEndDate);
        } catch (Exception e) {
            System.out.println("error1");
        }

        queryStr = "select a.developerusername, overlapmanday/(datediff(?,?)*(5/7)) as loadfactor, " +
" avgdefectpointperproject,scheduleperformance, " +
"ifnull(if(points<=20,0.8*points/20,0.8 +(0.2/points*(points-20))),0) as experiencefactor" +
", @priority:= ? as priority" +
" from" +
"(	 " +
"	select username as developerusername , ifnull(overlapmanday,0) as overlapmanday,ifnull(overlapproject,0) as overlapproject" +
"	from developer" +
"	left outer join " +
"		(select overlap.developerusername as developerusername, sum(overlap.overlapday) as overlapmanday," +
"			count(overlap.overlapday) as overlapproject" +
"			from" +
"			(select developerusername, datediff(least(planend,?),least(planstart,?)) as overlapday" +
"			from projectallocation" +
"			where" +
"			actualstart is not null " +
"			and actualend is null" +
"			and planend >= ?" +
"			and planstart <= ?) as overlap" +
"		group by overlapday) as overlap" +
"	on overlap.developerusername = developer.username" +
") as a," +
"(" +
"	select username as developerusername,ifnull(defectpoint,0) as defectpoint," +
"	ifnull(defectcount,0) as defectcount,projectcount,(defectcount/projectcount) as avgdefectperproject, " +
"	(defectpoint/projectcount) as avgdefectpointperproject" +
"	from developer" +
"	left outer join" +
"		(	select developerusername, ifnull(sum(severity),0) as defectpoint, " +
"			ifnull(sum(numberdefect),0) as defectcount, ifnull(count(developerusername),0) as projectcount from" +
"			(select developerusername, projectname from projectallocation " +
"			where actualend is not null group by projectname,developerusername) as a" +
"			left outer join" +
"			(select projectname, -sum(severity) as severity, count(severity) " +
"			as numberdefect from defect where updatetime >= now()-interval 3 month" +
"			group by projectname) as b" +
"			on a.projectname=b.projectname" +
"			group by developerusername" +
"		) as c" +
"	on developer.username=c.developerusername" +
") as b," +
"(	select developerusername, avg(datediff(actualend,actualstart)/datediff(planend,planstart)) as scheduleperformance" +
"	from projectallocation " +
"	where actualend is not null " +
"	group by developerusername" +
" ) as c" +
" left outer join" +
" (	select developerusername, type, sum(points) as points" +
"	from " +
"		(select developerusername, pa.projectname,(1*priority) as points ,type" +
"		from projectallocation pa, project p " +
"		where pa.projectname = p.projectname" +
"		and actualend is not null" +
"		and type=?" +
"		group by developerusername,projectname,psize,priority,type) as temp" +
"	group by developerusername, type" +
") as d" +
" on c.developerusername=d.developerusername" +
" where a.developerusername=b.developerusername" +
" and b.developerusername=c.developerusername" +
" having experiencefactor > 0" +
" ORDER BY " +
"    CASE priority" +
"        WHEN 3 THEN experiencefactor" +
"        WHEN 2 THEN ''" +
"        ELSE  '' END" +
"	DESC," +
"    CASE priority" +
"        WHEN 3 THEN scheduleperformance" +
"        WHEN 2 THEN loadfactor" +
"        ELSE  experiencefactor END" +
"    ASC," +
"        CASE priority" +
"        WHEN 3 THEN ''" +
"        WHEN 2 THEN experiencefactor" +
"        ELSE  loadfactor END" +
"	DESC;";

        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement(queryStr);
            
            pstmt.setDate(1, new java.sql.Date(eDate.getTime()));
            pstmt.setDate(2, new java.sql.Date(sDate.getTime()));
            pstmt.setInt(3, priority);
            pstmt.setDate(4, new java.sql.Date(eDate.getTime()));
            pstmt.setDate(5, new java.sql.Date(sDate.getTime()));
            pstmt.setDate(6, new java.sql.Date(sDate.getTime()));
            pstmt.setDate(7, new java.sql.Date(eDate.getTime()));
            pstmt.setString(8, projectType);

            rs = pstmt.executeQuery();
            System.out.println("exe");
            
            while (rs.next()) {
                //System.out.println(rs.getInt(5));
                Recommendation toAdd = new Recommendation(rs.getString("developerusername"), rs.getDouble("loadfactor"), rs.getDouble("avgdefectpointperproject"), rs.getDouble("scheduleperformance"), rs.getDouble("experiencefactor"));
//Recommendation(String username, double loadFactor, double defectScore, double scheduleScore, double experienceScore) 
                recommendations.add(toAdd);
            }

            return recommendations;
        } catch (SQLException ex) {
            //Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            //return recommendations
            System.out.println("catch");
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
            //System.out.println("finally");
            return recommendations;

        }
    }
}