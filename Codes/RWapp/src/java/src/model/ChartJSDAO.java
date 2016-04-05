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

import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.joda.time.DateTime;

/**
 *
 * @author KIANLAM
 */
public class ChartJSDAO {

    //get string of last 6 months
    public static ArrayList<String> getSixMonth() {
        ArrayList<String> toReturn = new ArrayList<String>();
        for (int i = 5; i >= 0; i--) {
            String j = new DateTime().minusMonths(i).monthOfYear().getAsText();
            toReturn.add(j);
        }
        return toReturn;
    }

    public static String getColor(int id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String toReturn = "";
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select color from color where id=?");
            pstmt.setInt(1, id);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn = rs.getString("color");
            }
        } catch (SQLException ex) {
            //Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }

    public static double getExperienceScore(String devusername, int year) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Double toReturn = 0.0;
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement(
                    "select format(ifnull(if(points<=20,0.8*points/20,0.8 +(0.2/points*(points-20))),0),4) as experiencefactor "
                    + "from "
                    + "(select developerusername, sum((priority+1)) as points, count(pa.projectname) as projectcount "
                    + "from projectallocation pa, project p "
                    + "where pa.projectname = p.projectname "
                    + "and year(dateallocated)=? "
                    + "and actualend is not null "
                    + "group by developerusername) "
                    + "as experiencetable "
                    + "where developerusername=?;");
            pstmt.setInt(1, year);
            pstmt.setString(2, devusername);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn = rs.getDouble("experiencefactor");
            }
        } catch (SQLException ex) {
            //Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }

    public static double getExperienceScoreRW(int year) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Double toReturn = 0.0;
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement(
                    "select format(avg(ifnull(if(points<=20,0.8*points/20,0.8 +(0.2/points*(points-20))),0)),2) as experiencefactor "
                    + "from "
                    + "(select developerusername, sum((priority+1)) as points, count(pa.projectname) as projectcount "
                    + "from projectallocation pa, project p "
                    + "where pa.projectname = p.projectname "
                    + "and year(dateallocated)=? "
                    + "and actualend is not null "
                    + "group by developerusername) "
                    + "as experiencetable;"
            );
            pstmt.setInt(1, year);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn = rs.getDouble("experiencefactor");
            }
        } catch (SQLException ex) {
            //Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }
    public static double getDefectScore(String devusername, int year) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Double toReturn = 0.0;
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select format(ifnull(1-pavgdpoint,1),2) as defectlessfactor "
                    + "	from(select username as developerusername,defectpoint, defectcount, projectcount, "
                    + "			avgdefectperproject,  "
                    + "			meanavgdefectperproject,  "
                    + "			sdavgdefectperproject,  "
                    + "			format((avgdefectperproject - meanavgdefectperproject)/sdavgdefectperproject,2) as zavgdcount, "
                    + "			(select pvalue from ztable where zvalue= "
                    + "            (if((avgdefectperproject - meanavgdefectperproject)/sdavgdefectperproject>3.5,3.5,format((avgdefectperproject - meanavgdefectperproject)/sdavgdefectperproject,2))) "
                    + "            ) as pavgdcount,		 "
                    + "			avgdefectpointperproject, 			 "
                    + "			meanavgdefectpointsperproject,			 "
                    + "			sdavgdefectpointsperproject,  "
                    + "			format((avgdefectpointperproject - meanavgdefectpointsperproject)/sdavgdefectpointsperproject,2) as zavgdpoint, "
                    + "			(select pvalue from ztable where  "
                    + "				zvalue =(if((avgdefectpointperproject - meanavgdefectpointsperproject)/sdavgdefectpointsperproject>3.5,3.5,format((avgdefectpointperproject - meanavgdefectpointsperproject)/sdavgdefectpointsperproject,2))) "
                    + "            ) as pavgdpoint "
                    + "            from developer "
                    + "            left outer join "
                    + "				(select developerusername, sum(totaldefectpoints) as defectpoint, sum(totaldefects) as defectcount, "
                    + "				avg(totaldefectpoints) as avgdefectpointperproject, avg(totaldefects) as avgdefectperproject, count(projectname) as projectcount "
                    + "				from	 "
                    + "					(select pd.developerusername as developerusername, pd.projectname as projectname, ifnull(sum(severity),0) as totaldefectpoints, count(severity) as totaldefects "
                    + "					from "
                    + "					(select developerusername, projectname from projectallocation where year(actualstart)=? group by projectname, developerusername "
                    + "					) as pd  "
                    + "					left outer join "
                    + "					(select projectname, committedby as developerusername,severity from defectcommitby dc left outer join defect d on dc.defectid = d.defectid where updatetime >= now()-interval 3 month) as dc "
                    + "					on pd.developerusername = dc.developerusername and pd.projectname = dc.projectname "
                    + "					group by pd.developerusername, pd.projectname) as defectbyallocation "
                    + "					group by developerusername "
                    + "                    ) as c "
                    + "			 on developer.username=c.developerusername "
                    + "			 cross join "
                    + "			(select avg(avgdefectpoint) as meanavgdefectpointsperproject, "
                    + "			avg(avgdefectcount) as meanavgdefectperproject, "
                    + "			STD(avgdefectpoint/projectcount) as sdavgdefectpointsperproject,  "
                    + "			STD(avgdefectcount/projectcount) as sdavgdefectperproject "
                    + "			from ( "
                    + "			select developerusername, avg(totaldefectpoints) as avgdefectpoint, avg(totaldefects) as avgdefectcount, count(projectname) as projectcount "
                    + "			from	 "
                    + "				( "
                    + "				select pd.developerusername as developerusername, pd.projectname as projectname, ifnull(sum(severity),0) as totaldefectpoints, count(severity) as totaldefects "
                    + "				from "
                    + "				( "
                    + "				select developerusername, projectname from projectallocation where year(actualstart)=? group by projectname, developerusername "
                    + "                ) as pd  "
                    + "				left outer join "
                    + "				( "
                    + "				select projectname, committedby as developerusername,severity from defectcommitby dc left outer join defect d on dc.defectid = d.defectid where updatetime >= now()-interval 3 month) as dc "
                    + "				on pd.developerusername = dc.developerusername and pd.projectname = dc.projectname "
                    + "				group by pd.developerusername, pd.projectname) as defectbyallocation "
                    + "			group by developerusername) as d "
                    + "            ) as e "
                    + "				) as finaltable "
                    + "where developerusername=?;");

            pstmt.setInt(1, year);
            pstmt.setInt(2, year);
            pstmt.setString(3, devusername);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn = rs.getDouble("defectlessfactor");
            }
        } catch (SQLException ex) {
            //Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }

    public static double getDefectScoreRW(int year) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Double toReturn = 0.0;
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select format(avg(ifnull(1-pavgdpoint,1)),2) as defectlessfactor "
                    + "	from(select username as developerusername,defectpoint, defectcount, projectcount, "
                    + "			avgdefectperproject,  "
                    + "			meanavgdefectperproject,  "
                    + "			sdavgdefectperproject,  "
                    + "			format((avgdefectperproject - meanavgdefectperproject)/sdavgdefectperproject,2) as zavgdcount, "
                    + "			(select pvalue from ztable where zvalue= "
                    + "            (if((avgdefectperproject - meanavgdefectperproject)/sdavgdefectperproject>3.5,3.5,format((avgdefectperproject - meanavgdefectperproject)/sdavgdefectperproject,2))) "
                    + "            ) as pavgdcount,		 "
                    + "			avgdefectpointperproject, 			 "
                    + "			meanavgdefectpointsperproject,			 "
                    + "			sdavgdefectpointsperproject,  "
                    + "			format((avgdefectpointperproject - meanavgdefectpointsperproject)/sdavgdefectpointsperproject,2) as zavgdpoint, "
                    + "			(select pvalue from ztable where  "
                    + "				zvalue =(if((avgdefectpointperproject - meanavgdefectpointsperproject)/sdavgdefectpointsperproject>3.5,3.5,format((avgdefectpointperproject - meanavgdefectpointsperproject)/sdavgdefectpointsperproject,2))) "
                    + "            ) as pavgdpoint "
                    + "            from developer "
                    + "            left outer join "
                    + "				(select developerusername, sum(totaldefectpoints) as defectpoint, sum(totaldefects) as defectcount, "
                    + "				avg(totaldefectpoints) as avgdefectpointperproject, avg(totaldefects) as avgdefectperproject, count(projectname) as projectcount "
                    + "				from	 "
                    + "					(select pd.developerusername as developerusername, pd.projectname as projectname, ifnull(sum(severity),0) as totaldefectpoints, count(severity) as totaldefects "
                    + "					from "
                    + "					(select developerusername, projectname from projectallocation where year(actualstart)=? group by projectname, developerusername "
                    + "					) as pd  "
                    + "					left outer join "
                    + "					(select projectname, committedby as developerusername,severity from defectcommitby dc left outer join defect d on dc.defectid = d.defectid where updatetime >= now()-interval 3 month) as dc "
                    + "					on pd.developerusername = dc.developerusername and pd.projectname = dc.projectname "
                    + "					group by pd.developerusername, pd.projectname) as defectbyallocation "
                    + "					group by developerusername "
                    + "                    ) as c "
                    + "			 on developer.username=c.developerusername "
                    + "			 cross join "
                    + "			(select avg(avgdefectpoint) as meanavgdefectpointsperproject, "
                    + "			avg(avgdefectcount) as meanavgdefectperproject, "
                    + "			STD(avgdefectpoint/projectcount) as sdavgdefectpointsperproject,  "
                    + "			STD(avgdefectcount/projectcount) as sdavgdefectperproject "
                    + "			from ( "
                    + "			select developerusername, avg(totaldefectpoints) as avgdefectpoint, avg(totaldefects) as avgdefectcount, count(projectname) as projectcount "
                    + "			from	 "
                    + "				( "
                    + "				select pd.developerusername as developerusername, pd.projectname as projectname, ifnull(sum(severity),0) as totaldefectpoints, count(severity) as totaldefects "
                    + "				from "
                    + "				( "
                    + "				select developerusername, projectname from projectallocation where year(actualstart)=? group by projectname, developerusername "
                    + "                ) as pd  "
                    + "				left outer join "
                    + "				( "
                    + "				select projectname, committedby as developerusername,severity from defectcommitby dc left outer join defect d on dc.defectid = d.defectid where updatetime >= now()-interval 3 month) as dc "
                    + "				on pd.developerusername = dc.developerusername and pd.projectname = dc.projectname "
                    + "				group by pd.developerusername, pd.projectname) as defectbyallocation "
                    + "			group by developerusername) as d "
                    + "            ) as e "
                    + "				) as finaltable;");

            pstmt.setInt(1, year);
            pstmt.setInt(2, year);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn = rs.getDouble("defectlessfactor");
            }
        } catch (SQLException ex) {
            //Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }

    public static double getTimelinessScore(String devusername, int year) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Double toReturn = 0.0;
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select schedulefactor from( "
                    + "select developerusername, "
                    + "1-(select pvalue from ztable where zvalue= "
                    + "(if(((avg(datediff(actualend,actualstart)/datediff(planend,planstart))) - meanscheduleperformance)/sdscheduleperformance>3.5,3.5,format(((avg(datediff(actualend,actualstart)/datediff(planend,planstart))) - meanscheduleperformance)/sdscheduleperformance,2))) "
                    + ") as schedulefactor, "
                    + "avg(datediff(actualend,actualstart)/datediff(planend,planstart)) as scheduleperformance "
                    + "from projectallocation pa inner join project p "
                    + "on pa.projectname=p.projectname "
                    + "cross join "
                    + "(select avg(scheduleperformance) as meanscheduleperformance, std(scheduleperformance) as sdscheduleperformance "
                    + "from ( "
                    + "select avg(datediff(actualend,actualstart)/datediff(planend,planstart)) as scheduleperformance "
                    + "from projectallocation pa, project p "
                    + "where pa.projectname=p.projectname "
                    + "and year(actualstart)=?  "
                    + "and actualend is not null  "
                    + "group by developerusername ) as meanperformance) as sdmeantable "
                    + "where actualstart is not null and actualend is not null and planstart is not null and planend is not null  "
                    + "and year(actualstart)=?  "
                    + "group by developerusername) as final "
                    + "where developerusername =?");

            pstmt.setInt(1, year);
            pstmt.setInt(2, year);
            pstmt.setString(3, devusername);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn = rs.getDouble("schedulefactor");
            }
        } catch (SQLException ex) {
            //Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }

    public static double getTimelinessScoreRW(int year) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Double toReturn = 0.0;
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select format(avg(schedulefactor),2) as score from( "
                    + "select developerusername, "
                    + "1-(select pvalue from ztable where zvalue= "
                    + "(if(((avg(datediff(actualend,actualstart)/datediff(planend,planstart))) - meanscheduleperformance)/sdscheduleperformance>3.5,3.5,format(((avg(datediff(actualend,actualstart)/datediff(planend,planstart))) - meanscheduleperformance)/sdscheduleperformance,2))) "
                    + ") as schedulefactor, "
                    + "avg(datediff(actualend,actualstart)/datediff(planend,planstart)) as scheduleperformance "
                    + "from projectallocation pa inner join project p "
                    + "on pa.projectname=p.projectname "
                    + "cross join "
                    + "(select avg(scheduleperformance) as meanscheduleperformance, std(scheduleperformance) as sdscheduleperformance "
                    + "from ( "
                    + "select avg(datediff(actualend,actualstart)/datediff(planend,planstart)) as scheduleperformance "
                    + "from projectallocation pa, project p "
                    + "where pa.projectname=p.projectname "
                    + "and year(actualstart)=?  "
                    + "and actualend is not null  "
                    + "group by developerusername ) as meanperformance) as sdmeantable "
                    + "where actualstart is not null and actualend is not null and planstart is not null and planend is not null  "
                    + "and year(actualstart)=?  "
                    + "group by developerusername) as final");

            pstmt.setInt(1, year);
            pstmt.setInt(2, year);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn = rs.getDouble("score");
            }
        } catch (SQLException ex) {
            //Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }
    
    
    // retrive loadfactor score for average accross ripplewerkz
    public static HashMap<String, Double> getLoadRW(int year) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        HashMap<String, Double> toReturn = new HashMap<String, Double>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement(
                    "select month, format(avg(count),2) as count from ( "
                    + "select MONTHNAME(actualstart) as month, count(distinct pa.projectname) as count "
                    + "from project p, projectallocation pa "
                    + "where p.projectname=pa.projectname "
                    + "and actualstart is not null "
                    + "and year(actualstart) = ? "
                    + "group by developerusername, month) as temp "
                    + "group by month;"
            );
            pstmt.setInt(1, year);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn.put(rs.getString("month"), rs.getDouble("count"));
            }
        } catch (SQLException ex) {
            //Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }

    // retrive Load factor score based on developer name
    public static HashMap<String, Double> getLoadDev(String devname, int year) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        HashMap<String, Double> toReturn = new HashMap<String, Double>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select MONTHNAME(actualstart) as month,  count(distinct pa.projectname) as count "
                    + "from project p, projectallocation pa "
                    + "where p.projectname=pa.projectname "
                    + "and actualstart is not null "
                    + "and developerusername = ? "
                    + "and year(actualstart) = ? "
                    + "group by developerusername, month;");

            pstmt.setString(1, devname);
            pstmt.setInt(2, year);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn.put(rs.getString("month"), rs.getDouble("count"));
            }
        } catch (SQLException ex) {
            //Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }

   
    // retrive timeliness score based on developer name
    public static HashMap<String, Double> getTimelinessDev(String devname, int year) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        HashMap<String, Double> toReturn = new HashMap<String, Double>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select MONTHNAME(actualend) as month, "
                    + "format(avg(datediff(actualend,actualstart)/datediff(planend,planstart)),2) as timeliness "
                    + "from projectallocation "
                    + "where actualend is not null "
                    + "and iscomplete=1 "
                    + "and year(actualend) = ? "
                    + "and developerusername=? "
                    + "group by developerusername, month;");
            
            
            pstmt.setInt(1,year);
            pstmt.setString(2, devname);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn.put(rs.getString("month"), rs.getDouble("timeliness"));
            }
        } catch (SQLException ex) {
            //Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }

    // retrive timeliness score for average accross ripplewerkz
    public static HashMap<String, Double> getTimelinessRW(int year) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        HashMap<String, Double> toReturn = new HashMap<String, Double>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select month, avg(timeliness) as timeliness from ( "
                    + "select MONTHNAME(actualend) as month, "
                    + "format(avg(datediff(actualend,actualstart)/datediff(planend,planstart)),2) as timeliness "
                    + "from projectallocation "
                    + "where actualend is not null "
                    + "and iscomplete=1 "
                    + "and year(actualend) =? "
                    + "group by developerusername, month) as temp "
                    + "group by month;");
            
            pstmt.setInt(1,year);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn.put(rs.getString("month"), rs.getDouble("timeliness"));
            }
        } catch (SQLException ex) {
            //Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }    
    
    // retrive project experice and count by type based developer name
    public static HashMap<String, Integer> getProjectExp(String username) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        HashMap<String, Integer> toReturn = new HashMap<String, Integer>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select p.type as type,count(p.projectname) as count "
                    + "from projectallocation pa, project p "
                    + "where pa.projectname = p.projectname and pa.iscomplete=1 and developerusername=? "
                    + "group by developerusername, p.type;");
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                toReturn.put(rs.getString("type"), rs.getInt("count"));
            }
        } catch (SQLException ex) {
            //Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }
        return toReturn;
    }



    public static double getAvgSkillPerDevRW() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Double toReturn = 0.0;
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select format(avg(count),2) as count "
                    + "from ( "
                    + "select count(distinct skill) as count from developerskill group by username) temp;");

            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn = rs.getDouble("count");
            }
        } catch (SQLException ex) {
            //Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }

    //[ Timeliness, Experience, Skillset,Quality Score,]
    public static Double[] getRWstats(int year) {
        return new Double[]{getTimelinessScoreRW(year), getTimelinessScoreRW(year), getAvgSkillPerDevRW(), getDefectScoreRW(year)};
    }

    //[ Timeliness, Experience, Skillset,Defect Score(Quality)]
    public static Double[] getDevStats(String devusername, int year) {
        return new Double[]{getTimelinessScore(devusername, year), getExperienceScore(devusername, year), SkillDAO.retrieveDevSkillString(devusername).size() + 0.0, getDefectScore(devusername, year)};
    }

}
