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
                + "(select username as developerusername,  "
                + "		ifnull(overlapproject,0) as overlapproject,  "
                + "		ifnull(earlieststart,?) earlieststart, "
                + "		ifnull(scheduleperformance,1.0) as scheduleperformance, "
                + "		ceiling(floor(ifnull(scheduleperformance,1.0)*?))as estimateworkingday, "
                + "        ceiling(floor(ifnull(scheduleperformance,1.0)*?/(5/7))) as estimateday, "
                + "        nationality, "
                + "		date_add(ifnull(earlieststart,?), interval ceiling(floor(ifnull(scheduleperformance,1.0)*?/(5/7))) day) as estimatecompletion, "
                + "		date_add(ifnull(earlieststart,?), interval ceiling(floor(?/(5/7))) day) as idealcompletion "
                + "		from "
                + "		(select ds.username as username, nationality   "
                + "        from developerskill ds, developer d where d.username=ds.username  "
                + "        and skill =?) as developerskill "
                + "		left outer join "
                + "			(select developerusername,  "
                + "			avg(datediff(actualend,actualstart)/datediff(planend,planstart)) as scheduleperformance "
                + "			from projectallocation pa, project p "
                + "			where pa.projectname=p.projectname "
                + "			and actualend is not null  "
                + "			group by developerusername,type "
                + "			having type=?) as timeliness "
                + "		on timeliness.developerusername=developerskill.username "
                + "		left outer join  "
                + "			(select developerusername,max(date_add(actualstart, interval planday+1 day)) as earlieststart,  "
                + "			count(developerusername) as overlapproject "
                + "				from  "
                + "				(select developerusername,datediff(planend, planstart) as planday,actualstart "
                + "				from projectallocation "
                + "				where "
                + "				actualstart is not null  "
                + "				and actualend is null "
                + "				and planend >= ? "
                + "				and planstart <= date_add(?, interval ? day)) as earliestfree "
                + "			group by developerusername) as overlap "
                + "		on overlap.developerusername = developerskill.username "
                + ") as loadbalance "
                + "inner join "
                + "(select final.developerusername, "
                + "		ifnull(scheduleperformance,1) as scheduleperformance,ifnull(schedulefactor,0) as schedulefactor, "
                + "		ifnull(experiencefactor,0) as experiencefactor, ifnull(projectcount,0) as projectcount, "
                + "		ifnull(defectlessfactor,0) defectlessfactor,ifnull(avgdefectperproject,0) as avgdefectperproject, "
                + "		format((?*ifnull(experiencefactor,0) + ?*ifnull(defectlessfactor,0) + ?*ifnull(schedulefactor,0)),4) as zainessscore "
                + "		from "
                + "			(select username as developerusername from developerskill where skill =?) as final "
                + "		left outer join "
                + "			(select developerusername,format(experiencefactor,4) as experiencefactor, projectcount from "
                + "			(select developerusername,type,points, projectcount, "
                + "			ifnull(if(points<=20,0.8*points/20,0.8 +(0.2/points*(points-20))),0) as experiencefactor  "
                + "			from "
                + "			( "
                + "			select developerusername, type, sum(points) as points, count(developerusername) as projectcount "
                + "			from  "
                + "				(select developerusername, pa.projectname,(1*priority) as points ,type "
                + "				from projectallocation pa, project p  "
                + "				where pa.projectname = p.projectname "
                + "				and actualend is not null "
                + "				and type=? "
                + "				group by developerusername,projectname,psize,priority,type) as temp "
                + "			group by developerusername, type "
                + "			) experiencetable) as finaltable) as final1 "
                + "		on final1.developerusername=final.developerusername "
                + "		left outer join "
                + "			(select developerusername, format(1-pavgdcount,4)as defectlessfactor, avgdefectperproject "
                + "			from "
                + "			( "
                + "			select username as developerusername,defectpoint, defectcount, projectcount "
                + "			avgdefectperproject,  "
                + "			meanavgdefectperproject,  "
                + "			sdavgdefectperproject,  "
                + "			format((avgdefectperproject - meanavgdefectperproject)/sdavgdefectperproject,2) as zavgdcount, "
                + "			(select pvalue from ztable where zvalue=format((avgdefectperproject - meanavgdefectperproject)/sdavgdefectperproject,2)) as pavgdcount,			 "
                + "			avgdefectpointperproject, 			 "
                + "			meanavgdefectpointsperproject,			 "
                + "			sdavgdefectpointsperproject,  "
                + "			format((avgdefectpointperproject - meanavgdefectpointsperproject)/sdavgdefectpointsperproject,2) as zavgdpoint, "
                + "			(select pvalue from ztable where zvalue=format((avgdefectpointperproject - meanavgdefectpointsperproject)/sdavgdefectpointsperproject,2)) as pavgdpoint "
                + "			from developer "
                + "			left outer join "
                + "				(select developerusername,  "
                + "					ifnull(sum(severity),0) as defectpoint,  "
                + "					ifnull(sum(numberdefect),0) as defectcount,  "
                + "					ifnull(count(developerusername),0) as projectcount, "
                + "					(ifnull(sum(numberdefect),0)/ifnull(count(developerusername),0) ) as avgdefectperproject,  "
                + "					(ifnull(sum(severity),0)/ifnull(count(developerusername),0) ) as avgdefectpointperproject		 "
                + "					from "
                + "					(select developerusername, projectname from projectallocation  "
                + "						where actualend is not null group by projectname,developerusername) as a "
                + "					left outer join "
                + "					(select projectname, sum(severity) as severity, count(severity)  "
                + "						as numberdefect from defect where updatetime >= now()-interval 3 month "
                + "						group by projectname) as b "
                + "					on a.projectname=b.projectname "
                + "					group by developerusername "
                + "				) as c "
                + "			 on developer.username=c.developerusername "
                + "			 cross join "
                + "				(select sum(defectpoint)/sum(projectcount) as meanavgdefectpointsperproject,  "
                + "					sum(defectcount)/sum(projectcount) as meanavgdefectperproject, "
                + "					STD(defectpoint/projectcount) as sdavgdefectpointsperproject,  "
                + "					STD(defectcount/projectcount) as sdavgdefectperproject "
                + "					from ( "
                + "					select developerusername,  "
                + "					ifnull(sum(severity),0) as defectpoint,  "
                + "					ifnull(sum(numberdefect),0) as defectcount,  "
                + "					ifnull(count(developerusername),0) as projectcount	 "
                + "					from "
                + "					(select developerusername, projectname from projectallocation  "
                + "						where actualend is not null group by projectname,developerusername) as a "
                + "					left outer join "
                + "					(select projectname, sum(severity) as severity, count(severity)  "
                + "						as numberdefect from defect where updatetime >= now()-interval 3 month "
                + "						group by projectname) as b "
                + "					on a.projectname=b.projectname "
                + "					group by developerusername) as d) as e "
                + "			) as finaltable) as final2 "
                + "		on final1.developerusername=final2.developerusername "
                + "		left outer join "
                + "			(select developerusername,  "
                + "			format(1-log(avg(datediff(actualend,actualstart)/datediff(planend,planstart))),4) as schedulefactor, "
                + "			avg(datediff(actualend,actualstart)/datediff(planend,planstart)) as scheduleperformance "
                + "			from projectallocation pa, project p "
                + "			where pa.projectname=p.projectname "
                + "			and actualend is not null  "
                + "			group by developerusername,type "
                + "			having type=?) as final3 "
                + "		on final2.developerusername=final3.developerusername "
                + ") as zainess "
                + "on zainess.developerusername=loadbalance.developerusername "
                + "ORDER BY  "
                + "    CASE sorting "
                + "        WHEN 1 THEN zainessscore  "
                + "        ELSE '' END "
                + "DESC, "
                + "CASE sorting "
                + "        WHEN 0 THEN estimatecompletion "
                + "        ELSE  '' END "
                + "ASC "
                + "LIMIT 10";

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
            pstmt.setDate(11, new java.sql.Date(sDate.getTime()));
            pstmt.setDate(12, new java.sql.Date(sDate.getTime()));
            pstmt.setInt(13, days);
            pstmt.setDouble(14, 0.33);
            pstmt.setDouble(15, 0.33);
            pstmt.setDouble(16, 0.33);
            pstmt.setString(17, projectType);//experience factor
            pstmt.setString(18, projectType);//defects factor
            pstmt.setString(19, projectType);//schedule factor

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
}
