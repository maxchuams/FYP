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

    // retrive loadfactor score for average accross ripplewerkz
    public static HashMap<String, Double> getLoadRW() {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        HashMap<String, Double> toReturn = new HashMap<String, Double>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select month, format(avg(count),2) as count from ( "
                    + "select MONTHNAME(actualstart) as month,  count(distinct pa.projectname) as count "
                    + "from project p, projectallocation pa "
                    + "where p.projectname=pa.projectname "
                    + "and actualstart is not null "
                    + "and actualstart >= date_sub(now(), interval 6 month) "
                    + "group by developerusername, month) as temp "
                    + "group by month;");

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
    public static HashMap<String, Double> getLoadDev(String devname) {

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
                    + "and actualstart >= date_sub(now(), interval 6 month) "
                    + "group by developerusername, month;");

            pstmt.setString(1, devname);

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
    public static HashMap<String, Double> getTimelinessDev(String devname) {

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
                    + "and actualend >= date_sub(now(), interval 6 month) "
                    + "and developerusername=? "
                    + "group by developerusername, month;");
            System.out.println("xxxxxx");
            pstmt.setString(1, devname);

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
    public static HashMap<String, Double> getTimelinessRW() {

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
                    + "and actualend >= date_sub(now(), interval 6 month) "
                    + "group by developerusername, month) as temp "
                    + "group by month;");

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

    public static double getDefectScore(String devusername) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Double toReturn = 0.0;
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select color from color where id=?");
            pstmt.setString(1, devusername);

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

    public static double getDefectScoreRW() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Double toReturn = 0.0;
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select color from color where id=?");

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

    public static double getExperienceScore(String devusername) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Double toReturn = 0.0;
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select format(ifnull(if(points<=20,0.8*points/20,0.8 +(0.2/points*(points-20))),0),2) as experiencefactor "
                    + "from( "
                    + "select developerusername, sum((1*priority)) as points "
                    + "	from projectallocation pa, project p "
                    + "	where pa.projectname = p.projectname "
                    + "	and actualend is not null "
                    + "	group by developerusername "
                    + "    having developerusername=?) as devopoints;");
            pstmt.setString(1, devusername);

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

    public static double getExperienceScoreRW() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Double toReturn = 0.0;
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select format(avg(ifnull(if(points<=20,0.8*points/20,0.8 +(0.2/points*(points-20))),0)),2) as experiencefactor "
                    + "from( "
                    + "select developerusername, sum((1*priority)) as points "
                    + "	from projectallocation pa, project p "
                    + "	where pa.projectname = p.projectname "
                    + "	and actualend is not null "
                    + "	group by developerusername "
                    + "    ) as devopoints;");

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

    public static double getTimelinessScore(String devusername) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Double toReturn = 0.0;
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select format(1-log(avg(datediff(actualend,actualstart)/datediff(planend,planstart))),2) as schedulefactor "
                    + "	from projectallocation pa, project p "
                    + "	where pa.projectname=p.projectname "
                    + "	and actualend is not null "
                    + "	group by developerusername "
                    + "	having developerusername=?;");
            pstmt.setString(1, devusername);

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

    public static double getTimelinessScoreRW() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Double toReturn = 0.0;
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select format(avg(schedulefactor),2) as schedulefactor from( "
                    + "select developerusername, 1-log(avg(datediff(actualend,actualstart)/datediff(planend,planstart))) as schedulefactor "
                    + "	from projectallocation pa, project p "
                    + "	where pa.projectname=p.projectname "
                    + "	and actualend is not null "
                    + "	group by developerusername) as timelinesstemp;");

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
    public static Double[] getRWstats() {
        return new Double[]{getTimelinessScoreRW(), getTimelinessScoreRW(), getAvgSkillPerDevRW(), getDefectScoreRW()};
    }

    //[ Timeliness, Experience, Skillset,Defect Score(Quality)]
    public static Double[] getDevStats(String devusername) {
        return new Double[]{getTimelinessScore(devusername), getExperienceScore(devusername), SkillDAO.retrieveDevSkillString(devusername).size() + 0.0, getDefectScore(devusername)};
    }

}
