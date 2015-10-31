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
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Date;

/**
 *
 * @author KIANLAM
 */
public class RecommedationDAO {

    public static ArrayList<Recommendation> getRecommendation(String projectType,
            String projectDueDate, String projectAllocatedDate, int priority) {
        System.out.println("RECCO STARTS!");
        ArrayList<Recommendation> recommendations = new ArrayList<Recommendation>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Person user = null;
        Date dDate = null;
        Date aDate = null;
        String queryStr = null;
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try {
            dDate = formatter.parse(projectDueDate);
            aDate = formatter.parse(projectAllocatedDate);
        } catch (Exception e) {
            System.out.println("error1");
        }

        String pHigh = //"select * from developerskill a, projectallocation b where skill = ? and a.username = b.developerusername and dateallocated=?;";
                "select username, ifnull(numberofprojectsinperiod,0) as workload, ifnull(totalscore,0) as defectscore, ifnull(experiencecount,0)  as experience,"
                + " (ifnull(experiencecount,0)- ifnull(totalscore,0)) as PointSystem"
                + " from"
                + " (select username from developerskill where skill = ?) as temp1 left outer join"
                + " (select developerusername, count(*) as numberofprojectsinperiod from project, projectallocation where project.projectname = projectallocation.projectname"
                + " and ((duedate>= ? and dateallocated <= ?)"
                + " or (duedate>= ? and dateallocated <= ?)) group by developerusername) as temp2"
                + " on temp1.username = developerusername"
                + " left outer join"
                + " (select developerusername, sum(defectscore) as totalscore from("
                + " select developerusername, (count(defectid) * priority) as defectscore, project.projectname from project left outer join projectallocation"
                + " on project.projectname = projectallocation.projectname  left outer join defect on defect.projectname = project.projectname "
                + " where type = ? and dateallocated >= date_add(?, interval -3 month) group by developerusername, projectname) as score group by developerusername)"
                + " as scores on temp1.username =  scores.developerusername"
                + " left outer join"
                + " (select developerusername, count(*) as experiencecount from project, projectallocation where project.projectname = projectallocation.projectname"
                + " and type = ? and priority = 3 group by developerusername) as totalSimilarProjects on temp1.username = totalSimilarProjects.developerusername order by PointSystem desc, workload desc"
                + ";";
        String pMid = "select username, ifnull(numberofprojectsinperiod,0) as workload, ifnull(totalscore,0) as defectscore, ifnull(experiencecount,0)  as experience, (ifnull(experiencecount,0)- ifnull(totalscore,0)) as PointSystem"
                + " from"
                + " (select username from developerskill where skill = ?) as temp1 left outer join"
                + " (select developerusername, count(*) as numberofprojectsinperiod from project, projectallocation where project.projectname = projectallocation.projectname"
                + " and ((duedate>= ? and dateallocated <= ?)"
                + " or (duedate>= ? and dateallocated <= ?)) group by developerusername) as temp2"
                + " on temp1.username = developerusername"
                + " left outer join"
                + " (select developerusername, sum(defectscore) as totalscore from("
                + " select developerusername, (count(defectid) * priority) as defectscore, project.projectname from project left outer join projectallocation"
                + " on project.projectname = projectallocation.projectname  left outer join defect on defect.projectname = project.projectname where type = ? and dateallocated >= date_add(?, interval -3 month) group by developerusername, projectname) as score group by developerusername) as scores on temp1.username =  scores.developerusername"
                + " left outer join"
                + " (select developerusername, count(*) as experiencecount from project, projectallocation where project.projectname = projectallocation.projectname and type = ? and priority = 2 group by developerusername) as totalSimilarProjects on temp1.username = totalSimilarProjects.developerusername order by PointSystem desc, workload desc"
                + ";";

        String pLow = "select username, ifnull(numberofprojectsinperiod,0) as workload, ifnull(totalscore,0) as defectscore, ifnull(experiencecount,0)  as experience, (ifnull(experiencecount,0)- ifnull(totalscore,0)) as PointSystem\n"
                + " from"
                + " (select username from developerskill where skill = ? ) as temp1 left outer join"
                + " (select developerusername, count(*) as numberofprojectsinperiod from project,"
                + " projectallocation where project.projectname = projectallocation.projectname"
                + " and ((duedate>= ? and dateallocated <= ?)"
                + " or (duedate>= ? and dateallocated <= ?)) group by developerusername) as temp2"
                + " on temp1.username = developerusername"
                + " left outer join"
                + " (select developerusername, sum(defectscore) as totalscore from("
                + " select developerusername, (count(defectid) * priority) as defectscore, project.projectname from project"
                + " left outer join projectallocation"
                + " on project.projectname = projectallocation.projectname left outer join defect "
                + " on defect.projectname = project.projectname where type = ? and dateallocated >= date_add(?, interval -3 month)"
                + " group by developerusername, projectname) as score group by developerusername) as scores on temp1.username =  scores.developerusername"
                + " left outer join"
                + " (select developerusername, count(*) as experiencecount from project, projectallocation where project.projectname = projectallocation.projectname"
                + " and type = ? and priority = 1 group by developerusername) as totalSimilarProjects on temp1.username = totalSimilarProjects.developerusername order by PointSystem asc, workload desc";

       
        if(priority==1){queryStr =pHigh;}
        else if(priority==2){queryStr=pMid;}
        else if(priority==3){queryStr=pLow;}
        
        
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement(pLow);
            pstmt.setString(1, projectType);
            pstmt.setDate(2, new java.sql.Date(dDate.getTime()));
            pstmt.setDate(3, new java.sql.Date(aDate.getTime()));
            pstmt.setDate(4, new java.sql.Date(dDate.getTime()));
            pstmt.setDate(5, new java.sql.Date(aDate.getTime()));
            pstmt.setString(6, projectType);
            pstmt.setDate(7, new java.sql.Date(aDate.getTime()));
            pstmt.setString(8, projectType);

           // System.out.println("1");
            //System.out.println(pstmt);
            rs = pstmt.executeQuery();
            System.out.println("2");
            while (rs.next()) {
                Recommendation toAdd = new Recommendation(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5));
                //Recommendation(String username, int workloadScore, int defectScore, int experienceScore, int pointSystemScore)
                recommendations.add(toAdd);
            }
            System.out.println(recommendations);
            return recommendations;
        } catch (SQLException ex) {
            //Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            //return recommendations
            //System.out.println("catch");
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
           //System.out.println("finally");
            return recommendations;

        }
    }
}
