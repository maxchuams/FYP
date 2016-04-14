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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author maxchua
 */
public class ProjectAllocationDAO {

    /**
     *All a new allocation into the database
     * @param projName the name of the project
     * @param dev the name of the developer
     * @param planStart the start date of the developer
     * @param planEnd the plan end of the developer 
     * @param actualStart the day the developer actually starts
     * @return
     */
    public static boolean addAllocation(String projName, String dev, String planStart, String planEnd, String actualStart) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("insert into projectallocation (projectname, developerusername, planstart, planend, actualstart) values (?,?,?,?,?)");
            pstmt.setString(1, projName);
            pstmt.setString(2, dev);
            pstmt.setString(3, planStart);
            pstmt.setString(4, planEnd);
            pstmt.setString(5, actualStart);

            pstmt.executeUpdate();

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {

            ConnectionManager.close(conn, pstmt, rs);

        }
    }

    /**
     *Gets all project allocation objects
     * @return an ArrayList of Project Allocation objects
     */
    public static ArrayList<ProjectAllocation> returnProject() {

        ArrayList<ProjectAllocation> pAllocate = new ArrayList<ProjectAllocation>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ProjectAllocation pA = null;
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select projectname,planstart,planend,developerusername from projectallocation order by developerusername");
            //pstmt.setString(1, projName);
            //pstmt.setString(2, dev);
            //pstmt.setString(3, dateAllocated);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                pA = new ProjectAllocation(rs.getString(1), rs.getTimestamp(2), rs.getTimestamp(3), rs.getString(4));
                pAllocate.add(pA);
            }

            //return true;
        } catch (SQLException ex) {
            Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            //return false;
        } finally {

            ConnectionManager.close(conn, pstmt, rs);

        }

        return pAllocate;
    }

    //SELECT distinct developerusername FROM projectallocation WHERE projectname = "candy"

    /**
     *Get the developers that are assigned to the project
     * @param projectname the name of the project
     * @return the developers that are assigned to the project
     */ 
        public static ArrayList<String> retrieveDev(String projectname) {
        ArrayList<String> toReturn = new ArrayList<String>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ProjectAllocation pA = null;
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("Select developerusername "
                    + "from projectallocation "
                    + "where projectname=? "
                    + "group by projectname, developerusername "
                    + "having max(dateallocated);");
            pstmt.setString(1, projectname);

            rs = pstmt.executeQuery();

            while (rs.next()) {

                toReturn.add(rs.getString(1));
            }

            //return true;
        } catch (SQLException ex) {
            Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            //return false;
        } finally {

            ConnectionManager.close(conn, pstmt, rs);

        }

        return toReturn;
    }

    /**
     *Get all project names that are still in progress
     * @return arraylist of project names that are still in progress
     */
    public static ArrayList<String> retrieveInProgress() {
        ArrayList<String> toReturn = new ArrayList<String>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ProjectAllocation pA = null;
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select distinct projectname as name from projectallocation where iscomplete=0;");

            rs = pstmt.executeQuery();

            while (rs.next()) {

                toReturn.add(rs.getString("name"));
            }

            //return true;
        } catch (SQLException ex) {
            //Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            //return false;
        } finally {

            ConnectionManager.close(conn, pstmt, rs);

        }

        return toReturn;
    }

    /**
     *Retrieve project names that are still in progress for a particular developer
     * @param dev the developer's username
     * @return arraylist of project names
     */
    public static ArrayList<String> retrieveDevInProgress(String dev) {
        ArrayList<String> toReturn = new ArrayList<String>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ProjectAllocation pA = null;
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select distinct projectname as name from projectallocation where iscomplete=0 and developerusername=?;");
            pstmt.setString(1, dev);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn.add(rs.getString("name"));
            }

            //return true;
        } catch (SQLException ex) {
            //Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            //return false;
        } finally {
            ConnectionManager.close(conn, pstmt, rs);

        }

        return toReturn;
    }
    
    /**
     *Get project allocations for a particular user in a particular year
     * @param year the numerical year 
     * @param dev the username of the developer
     * @return the arraylist of project names
     */
    public static ArrayList<String> retrieveByAllocattionByYear(int year, String dev) {
        ArrayList<String> toReturn = new ArrayList<String>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ProjectAllocation pA = null;
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select projectname as name from projectallocation where developerusername=? and year(dateallocated) =? group by developerusername, projectname;");
            
            
            pstmt.setString(1, dev);
            pstmt.setInt(2, year);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn.add(rs.getString("name"));
            }

            //return true;
        } catch (SQLException ex) {
            //Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            //return false;
        } finally {
            ConnectionManager.close(conn, pstmt, rs);

        }

        return toReturn;
    }
    
    /**
     *Remove a project allocation from the data base
     * @param username username of the developer
     * @param projname name of the project
     * @return true or false depending if the method was successful
     */
    public static boolean delete(String username, String projname) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = ConnectionManager.getConnection();

            String sql = "DELETE FROM projectallocation where projectname = ?"
                    + "username=?  ";
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, projname);
            pstmt.setString(2, username);

            pstmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            ConnectionManager.close(conn, pstmt);
        }
    }

    //setIsComplete

    /**
     *Set the completion status
     * @param projectname the name of the project
     * @param username the name of the developer
     * @param isComplete the completion status
     * @return true or false depending if the method was successful
     */
        public static boolean setIsComplete(String projectname, String username, int isComplete) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Date actualEndDate = new Date();
        try {
            conn = ConnectionManager.getConnection();

            String sql = "UPDATE projectallocation set iscomplete=?, actualend=? where projectname=? and developerusername=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, isComplete);
            pstmt.setDate(2, new java.sql.Date(actualEndDate.getTime()));
            pstmt.setString(3, projectname);
            pstmt.setString(4, username);

            //System.out.println("SKILLS SENT TO DB : " + toUpdate.getSkills());
            pstmt.executeUpdate();

        } catch (SQLException e) {

            e.printStackTrace();
            return false;
        } finally {
            ConnectionManager.close(conn, pstmt);
        }
        return true;
    }

    /**
     *Add a new allocation to the database without start and end date
     * @param projName the name of the project
     * @param dev the username of the developer
     * @return true or false depending if the method was successful
     */
    public static boolean addBasicAllocation(String projName, String dev) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("insert into projectallocation (projectname, developerusername) values (?,?)");
            pstmt.setString(1, projName);
            pstmt.setString(2, dev);

            pstmt.executeUpdate();

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {

            ConnectionManager.close(conn, pstmt, rs);

        }
    }

    /**
     *Checks if the project has already been allocated
     * @param projName the name of the project
     * @return true if exist or false if it doesn't
     */
    public static boolean checkIfExist(String projName) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<String> toReturn = new ArrayList<String>();

        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select projectname from projectallocation where projectname =?;");
            pstmt.setString(1, projName);

            while (rs.next()) {

                toReturn.add(rs.getString(1));
            }
            pstmt.executeQuery();

            if (toReturn.size() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {

            ConnectionManager.close(conn, pstmt, rs);

        }
    }

}
