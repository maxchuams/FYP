/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.model;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author KIANLAM
 */
public class RecommedationDAO {

    public static ArrayList<ArrayList<Recommendation>> getRecommendation(String projectType,
            String projectStartDate, int days, int priority, int developerCount, double experienceFactor, double defectsFactor, double scheduleFactor, int k) {
        if (developerCount == 1) {
            ArrayList<ArrayList<Recommendation>> recommendationsList = new ArrayList<ArrayList<Recommendation>>();
            ArrayList<Recommendation> recommendations = getSingleRecommendation(projectType, projectStartDate, days, priority, experienceFactor, defectsFactor, scheduleFactor);
            for (int i = 0; i < recommendations.size(); i++) {
                if (i == k) {
                    break;
                }
                Recommendation re = recommendations.get(i);
                ArrayList<Recommendation> devList = new ArrayList<Recommendation>();
                devList.add(re);
                recommendationsList.add(devList);
            }
            return recommendationsList;
        }
        return getMultiRecommendation(projectType, projectStartDate, days, priority, developerCount, experienceFactor, defectsFactor, scheduleFactor, k);
    }

    /**
     *
     * Returning an arraylist of recommendation objects based on ProjectType,
     * ProjectStartDate, Days and Priority.
     *
     * @param projectType The project type "eCommence", "wordpress" or "custom"
     * project. Any other value will result in empty resultset.
     * @param projectStartDate Planned start date of the project. Must be in
     * "yyyy-MM-dd" format. e.g "2016-03-04"
     * @param days Project Managers' estimation of the expected number of days
     * that a project will take to completion based on functionalities.
     * @param priority 1 high priority and 0 for standard project . Any other
     * value will result in default/random sorting order. "High Priority"(1)
     * projects will be sorted based on the "zainessscore" to get the best
     * developer, which is based on the skillset, timeliness,low defects and
     * experience score. "Standard"(0) projects will be sorted based on matching
     * skillset developers who can complete the project on the earliest date to
     * archieve overall load balancing e.g reduce slack time between projects.
     * @return A collection of recommendation objects.
     */
    public static ArrayList<Recommendation> getSingleRecommendation(String projectType,
            String projectStartDate, int days, int priority, double experienceFactor, double defectsFactor, double scheduleFactor) {
        ArrayList<Recommendation> recommendations = new ArrayList<Recommendation>();
        //ArrayList<ArrayList<Recommendation>> recommendationsList = new ArrayList<ArrayList<Recommendation>>();
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
        } catch (Exception e) {
            System.out.println("error1");
        }

        queryStr = "select loadbalance.developerusername as developer, "
                + "nationality,  "
                + "overlapproject as currentproject,  "
                + "earlieststart,  "
                + "estimateworkingday, "
                + "estimateday,  "
                + "loadbalance.scheduleperformance,  "
                + "estimatecompletion,  "
                + "idealcompletion,  "
                + "defectlessfactor, "
                + "schedulefactor, "
                + "avgdefectperproject, "
                + "experiencefactor, "
                + "projectcount, "
                + "zainessscore, "
                + "@sorting:=? as sorting "
                + "from "
                + "(select developerusername,overlapproject,earlieststart, scheduleperformance, nationality,estimateworkingday, estimateday, "
                + "CASE WEEKDAY(estimatecompletion) when 1 then date_add(estimatecompletion, interval 1 day) when 7 then date_add(estimatecompletion, interval 2 day) else estimatecompletion END as estimatecompletion, "
                + "CASE WEEKDAY(idealcompletion) when 1 then date_add(idealcompletion, interval 1 day) when 7 then date_add(idealcompletion, interval 2 day) else idealcompletion END as idealcompletion "
                + "from( "
                + "select username as developerusername,  "
                + "ifnull(overlapproject,0) as overlapproject,  "
                + "ifnull(earlieststart,?) as earlieststart, "
                + "ifnull(pertscheduleperformance,1.0) as scheduleperformance, "
                + "ceiling(floor(ifnull(pertscheduleperformance,1.0)*?)) as estimateworkingday, "
                + "ceiling(floor(ifnull(pertscheduleperformance,1.0)*?/(5/7))) as estimateday, "
                + "nationality, "
                + "date_add(ifnull(earlieststart,?), interval ceiling(floor(ifnull(pertscheduleperformance,1.0)*?/(5/7))) day) as estimatecompletion, "
                + "date_add(ifnull(earlieststart,?), interval ceiling(floor(?/(5/7))) day) as idealcompletion "
                + "from(select ds.username as username, nationality   "
                + "from developerskill ds, developer d where d.username=ds.username  "
                + "and skill =? "
                + ") as developerskill "
                + "left outer join "
                + "(select developerusername,  "
                + "min(datediff(actualend,actualstart)/datediff(planend,planstart)) as bestscheduleperformance, "
                + "avg(datediff(actualend,actualstart)/datediff(planend,planstart)) as likelyscheduleperformance, "
                + "max(datediff(actualend,actualstart)/datediff(planend,planstart)) as worstscheduleperformance, "
                + "(min(datediff(actualend,actualstart)/datediff(planend,planstart)) "
                + "+4*avg(datediff(actualend,actualstart)/datediff(planend,planstart)) "
                + "+max(datediff(actualend,actualstart)/datediff(planend,planstart)))/6 as pertscheduleperformance, "
                + "POW(max(datediff(actualend,actualstart)/datediff(planend,planstart)) "
                + "+min(datediff(actualend,actualstart)/datediff(planend,planstart)),2)/POW(6,2) as variancescheduleperformance "
                + "from projectallocation pa, project p "
                + "where pa.projectname=p.projectname "
                + "and type=? "
                + "and actualstart is not null and actualend is not null and planstart is not null and planend is not null "
                + "group by developerusername "
                + ") as timeliness "
                + "on timeliness.developerusername=developerskill.username "
                + "left outer join  "
                + "(select developerusername,  "
                + "CASE WEEKDAY(earlieststart) when 1 then date_add(earlieststart, interval 1 day) when 7 then date_add(earlieststart, interval 2 day) else earlieststart END "
                + "as earlieststart, overlapproject "
                + "from ( "
                + "select developerusername, "
                + "max(date_add(actualstart, interval  "
                + "(SELECT 5 * (DATEDIFF(planend, planstart) DIV 7)  "
                + "+ MID('0123444401233334012222340111123400001234000123440',  "
                + "7 * WEEKDAY(planstart) + WEEKDAY(planend) + 1, 1)) +  "
                + "(SELECT 2 * (DATEDIFF(planend, planstart) DIV 7)  "
                + "+ MID('0123444401233334012222340111123400001234000123440',  "
                + "7 * WEEKDAY(planstart) + WEEKDAY(planend) + 1, 1)) "
                + "+1 day)) as earlieststart, "
                + "count(developerusername) as overlapproject "
                + "from developerskill ds, developer d, projectallocation pa "
                + "where d.username=ds.username  "
                + "and d.username = pa.developerusername "
                + "and ds.skill =? "
                + "and actualstart is not null  "
                + "and actualend is null "
                + "and planend >= ? "
                + "and planstart <= date_add(?, interval (?)/5*7 day) "
                + "group by  developerusername) as earlieststarttable "
                + ") as overlap "
                + "on overlap.developerusername = developerskill.username) as loadbalancing "
                + ") as loadbalance "
                + "left outer join "
                + "(select final.developerusername, "
                + "ifnull(scheduleperformance,1) as scheduleperformance,ifnull(schedulefactor,0) as schedulefactor, "
                + "ifnull(experiencefactor,0) as experiencefactor, ifnull(projectcount,0) as projectcount, "
                + "ifnull(defectlessfactor,0) defectlessfactor,ifnull(avgdefectperproject,0) as avgdefectperproject, "
                + "format((?*ifnull(experiencefactor,0) + ?*ifnull(defectlessfactor,0) + ?*ifnull(schedulefactor,0)),4) as zainessscore "
                + "from "
                + "(select username as developerusername from developerskill where skill =?) as final "
                + "left outer join "
                + "(select developerusername,format(experiencefactor,4) as experiencefactor, projectcount from "
                + "(select developerusername, points, projectcount, "
                + "ifnull(if(points<=20,0.8*points/20,0.8 +(0.2/points*(points-20))),0) as experiencefactor  "
                + "from (select developerusername, sum((priority+1)) as points, count(pa.projectname) as projectcount  "
                + "		from projectallocation pa, project p  "
                + "		where pa.projectname = p.projectname "
                + "		and actualend is not null "
                + "		and type=? "
                + "	group by developerusername) "
                + "as experiencetable) as finaltable "
                + ") as final1 "
                + "on final.developerusername=final1.developerusername "
                + "left outer join "
                + "(select developerusername, ifnull(format(1-pavgdpoint,4),1) as defectlessfactor, ifnull(avgdefectperproject,0) as avgdefectperproject "
                + "from(select username as developerusername,defectpoint, defectcount, projectcount, "
                + "avgdefectperproject,  "
                + "meanavgdefectperproject,  "
                + "sdavgdefectperproject,  "
                + "format((avgdefectperproject - meanavgdefectperproject)/sdavgdefectperproject,2) as zavgdcount, "
                + "(select pvalue from ztable where zvalue= "
                + "(if((avgdefectperproject - meanavgdefectperproject)/sdavgdefectperproject>3.5,3.5,format((avgdefectperproject - meanavgdefectperproject)/sdavgdefectperproject,2))) "
                + ") as pavgdcount,		 "
                + "avgdefectpointperproject, 			 "
                + "meanavgdefectpointsperproject,			 "
                + "sdavgdefectpointsperproject,  "
                + "format((avgdefectpointperproject - meanavgdefectpointsperproject)/sdavgdefectpointsperproject,2) as zavgdpoint, "
                + "(select pvalue from ztable where  "
                + "zvalue =(if((avgdefectpointperproject - meanavgdefectpointsperproject)/sdavgdefectpointsperproject>3.5,3.5,format((avgdefectpointperproject - meanavgdefectpointsperproject)/sdavgdefectpointsperproject,2))) "
                + ") as pavgdpoint "
                + "from developer "
                + "left outer join "
                + "(select developerusername, sum(totaldefectpoints) as defectpoint, sum(totaldefects) as defectcount, "
                + "avg(totaldefectpoints) as avgdefectpointperproject, avg(totaldefects) as avgdefectperproject, count(projectname) as projectcount "
                + "from	 "
                + "	(select pd.developerusername as developerusername, pd.projectname as projectname, ifnull(sum(severity),0) as totaldefectpoints, count(severity) as totaldefects "
                + "	from "
                + "	(select developerusername, projectname from projectallocation where actualstart >= now()-interval 3 month group by projectname, developerusername) as pd  "
                + "	left outer join "
                + "	(select projectname, committedby as developerusername,severity from defectcommitby dc left outer join defect d on dc.defectid = d.defectid where updatetime >= now()-interval 3 month) as dc "
                + "	on pd.developerusername = dc.developerusername and pd.projectname = dc.projectname "
                + "	group by pd.developerusername, pd.projectname) as defectbyallocation "
                + "	group by developerusername "
                + "	) as c "
                + "on developer.username=c.developerusername "
                + "cross join "
                + "(select avg(avgdefectpoint) as meanavgdefectpointsperproject, "
                + "avg(avgdefectcount) as meanavgdefectperproject, "
                + "STD(avgdefectpoint/projectcount) as sdavgdefectpointsperproject,  "
                + "STD(avgdefectcount/projectcount) as sdavgdefectperproject "
                + "from ( "
                + "select developerusername, avg(totaldefectpoints) as avgdefectpoint, avg(totaldefects) as avgdefectcount, count(projectname) as projectcount "
                + "from	 "
                + "(select pd.developerusername as developerusername, pd.projectname as projectname, ifnull(sum(severity),0) as totaldefectpoints, count(severity) as totaldefects "
                + "from "
                + "(select developerusername, projectname from projectallocation where actualstart >= now()-interval 3 month group by projectname, developerusername) as pd  "
                + "left outer join "
                + "(select projectname, committedby as developerusername,severity from defectcommitby dc left outer join defect d on dc.defectid = d.defectid where updatetime >= now()-interval 3 month) as dc "
                + "on pd.developerusername = dc.developerusername and pd.projectname = dc.projectname "
                + "group by pd.developerusername, pd.projectname) as defectbyallocation "
                + "group by developerusername) as d) as e) as finaltable) as final2	 "
                + "on final.developerusername=final2.developerusername "
                + "left outer join "
                + "(select developerusername, "
                + "1-(select pvalue from ztable where zvalue= "
                + "		(if(((avg(datediff(actualend,actualstart)/datediff(planend,planstart))) - meanscheduleperformance)/sdscheduleperformance>3.5,3.5,format(((avg(datediff(actualend,actualstart)/datediff(planend,planstart))) - meanscheduleperformance)/sdscheduleperformance,2))) "
                + "		) as schedulefactor, "
                + "avg(datediff(actualend,actualstart)/datediff(planend,planstart)) as scheduleperformance "
                + "from projectallocation pa inner join project p "
                + "on pa.projectname=p.projectname "
                + "cross join "
                + "(select avg(scheduleperformance) as meanscheduleperformance, std(scheduleperformance) as sdscheduleperformance "
                + "from ( "
                + "	select avg(datediff(actualend,actualstart)/datediff(planend,planstart)) as scheduleperformance "
                + "	from projectallocation pa, project p "
                + "	where pa.projectname=p.projectname "
                + "	and type=? "
                + "	and actualend is not null  "
                + "	group by developerusername ) as meanperformance) as sdmeantable "
                + "where type=? "
                + "and actualstart is not null and actualend is not null and planstart is not null and planend is not null  "
                + "group by developerusername "
                + ") as final3 "
                + "on final.developerusername=final3.developerusername "
                + ") as zainess "
                + "on zainess.developerusername=loadbalance.developerusername "
                + "ORDER BY  "
                + "CASE sorting "
                + "WHEN 1 THEN zainessscore  "
                + "ELSE '' END "
                + "DESC, "
                + "CASE sorting "
                + "WHEN 0 THEN estimatecompletion "
                + "ELSE  '' END "
                + "ASC, "
                + "CASE sorting "
                + "WHEN 1 THEN estimatecompletion "
                + "ELSE '' END "
                + "DESC, "
                + "CASE sorting "
                + "WHEN 0 THEN zainessscore  "
                + "ELSE  '' END "
                + "ASC;";

        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement(queryStr);

            pstmt.setInt(1, priority);
            pstmt.setDate(2, new java.sql.Date(sDate.getTime()));
            pstmt.setInt(3, days);
            pstmt.setInt(4, days);
            pstmt.setDate(5, new java.sql.Date(sDate.getTime()));
            pstmt.setInt(6, days);
            pstmt.setDate(7, new java.sql.Date(sDate.getTime()));
            pstmt.setInt(8, days);
            pstmt.setString(9, projectType);
            pstmt.setString(10, projectType);
             pstmt.setString(11, projectType);
            pstmt.setDate(12, new java.sql.Date(sDate.getTime()));
            pstmt.setDate(13, new java.sql.Date(sDate.getTime()));
            pstmt.setInt(14, days);
            pstmt.setDouble(15, experienceFactor);
            pstmt.setDouble(16, defectsFactor);
            pstmt.setDouble(17, scheduleFactor);
            pstmt.setString(18, projectType);
            pstmt.setString(19, projectType);
            pstmt.setString(20, projectType);
            pstmt.setString(21, projectType);

            rs = pstmt.executeQuery();

            // System.out.println("executed");
            while (rs.next()) {
                Recommendation toAdd = new Recommendation(rs.getString("developer"),
                        rs.getString("nationality"), rs.getInt("currentproject"),
                        rs.getDate("earlieststart"), rs.getInt("estimateworkingday"),
                        rs.getInt("estimateday"), rs.getDouble("scheduleperformance"),
                        rs.getDate("estimatecompletion"), rs.getDate("idealcompletion"),
                        rs.getDouble("defectlessfactor"), rs.getDouble("schedulefactor"),
                        rs.getDouble("avgdefectperproject"), rs.getDouble("experiencefactor"),
                        rs.getInt("projectcount"), rs.getDouble("zainessscore"), rs.getInt("sorting"));

                recommendations.add(toAdd);
            }

            return recommendations;
        } catch (SQLException ex) {
            //Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            //return recommendations
            //System.out.println("catch");
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
            return recommendations;
        }
    }

    public static ArrayList<ArrayList<Recommendation>> getMultiRecommendation(String projectType,
            String projectStartDate, int days, int priority, int developerCount, double experienceFactor, double defectsFactor, double scheduleFactor, int k) {
        //assume is size is for each developer e.g days=15 develperCount=2 means 2 developer each take 15days
        ArrayList<Recommendation> recommendations = getSingleRecommendation(projectType, projectStartDate, days, priority, experienceFactor, defectsFactor, scheduleFactor);
        ArrayList<ArrayList<Recommendation>> rList = new ArrayList<ArrayList<Recommendation>>();
        ArrayList<ArrayList<Integer>> combinations = devCombinator(recommendations.size(), developerCount);
        for (int i = 0; i < combinations.size(); i++) {
            if (i == k) {
                break;
            }
            ArrayList<Recommendation> toAdd = new ArrayList<Recommendation>();
            ArrayList<Integer> combo = combinations.get(i);
            for (Integer index : combo) {
                toAdd.add(recommendations.get(index - 1));
            }
            rList.add(toAdd);
        }
        return rList;

    }

    //Adapted from http://www.programcreek.com/2014/03/leetcode-combinations-java/
    public static ArrayList<ArrayList<Integer>> devCombinator(int n, int k) {
        ArrayList<ArrayList<Integer>> result = new ArrayList<ArrayList<Integer>>();

        if (n <= 0 || n < k) {
            return result;
        }

        ArrayList<Integer> item = new ArrayList<Integer>();
        dfs(n, k, 1, item, result); // because it need to begin from 1

        Collections.sort(result, new SumArrayComparator());

        return result;
    }

    private static void dfs(int n, int k, int start, ArrayList<Integer> item,
            ArrayList<ArrayList<Integer>> res) {
        if (item.size() == k) {
            res.add(new ArrayList<Integer>(item));
            return;
        }
        for (int i = start; i <= n; i++) {
            item.add(i);
            dfs(n, k, i + 1, item, res);
            item.remove(item.size() - 1);
        }
    }

    public static boolean logRecommendation(ArrayList<ArrayList<Recommendation>> generatedArr, ArrayList<Recommendation> selectedArr, String projectname, int choice) {
        //ArrayList<ArrayList<Recommendation>>

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        //Gson gson = new GsonBuilder().setPrettyPrinting().create();
        Gson gson = new Gson();
        String generated = gson.toJson(generatedArr);
        String selected = gson.toJson(selectedArr);

        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("insert into recommendationlog(generated,selected,projectname, choice) values (?,?,?,?)");
            pstmt.setString(1, generated);
            pstmt.setString(2, selected);
            pstmt.setString(3, projectname);
            pstmt.setInt(4, choice);
            pstmt.executeUpdate();

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }
    }

    public static int[] retrievexfs() {

        Connection conn = null;
        PreparedStatement pstmt1 = null;
        PreparedStatement pstmt2 = null;
        PreparedStatement pstmt3 = null;
        PreparedStatement pstmt4 = null;
        PreparedStatement pstmt5 = null;
        ResultSet rs1 = null;
        ResultSet rs2 = null;
        ResultSet rs3 = null;
        ResultSet rs4 = null;
        ResultSet rs5 = null;

        int[] xfs = new int[5];

        try {
            conn = ConnectionManager.getConnection();

            pstmt1 = conn.prepareStatement("select count(*) as count from user;");
            pstmt2 = conn.prepareStatement("select count(*) as count from  project;");
            pstmt3 = conn.prepareStatement("select count(*) as count from recommendationlog where choice in (1,2,3,4,5);");
            pstmt4 = conn.prepareStatement("select count(*) as count from recommendationlog where choice=1;");
            pstmt5 = conn.prepareStatement("select round((count2 /count1)*100,0) as percent from "
                    + "(select count(*) as count1 from recommendationlog where choice in (1,2,3,4,5)) as c1,"
                    + "(select count(*) as count2 from recommendationlog where choice=1) as c2;");

            rs1 = pstmt1.executeQuery();
            while (rs1.next()) {
                xfs[0] = rs1.getInt("count");
            }
            rs2 = pstmt2.executeQuery();
            while (rs2.next()) {
                xfs[1] = rs2.getInt("count");
            }
            rs3 = pstmt3.executeQuery();
            while (rs3.next()) {
                xfs[2] = rs3.getInt("count");
            }
            rs4 = pstmt4.executeQuery();
            while (rs4.next()) {
                xfs[3] = rs4.getInt("count");
            }
            rs5 = pstmt5.executeQuery();
            while (rs5.next()) {
                xfs[4] = rs5.getInt("percent");
            }

        } catch (SQLException ex) {
            System.out.println("Error on xfactor DAO method.");
        } finally {
            ConnectionManager.close(conn, pstmt1, rs1);
            ConnectionManager.close(conn, pstmt2, rs2);
            ConnectionManager.close(conn, pstmt3, rs3);
            ConnectionManager.close(conn, pstmt4, rs4);
            ConnectionManager.close(conn, pstmt5, rs5);

        }

        return xfs;

    }

}
