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
public class DefectDAO {

    /**
     * Adds a new Defect into the Database
     *
     * @param pname project name
     * @param dname defect name
     * @param desc description
     * @param reportby person who reported the defect
     * @param severity severity of the defect
     * @param duedate the dude date of the defect
     * @param devname the developer who committed the defect
     * @return true or false if the defect has been successfully added
     */
    public static boolean addDefect(String pname, String dname, String desc, String reportby, int severity, String duedate, String devname) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Date duedateDate = null;

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

        try {
            duedateDate = formatter.parse(duedate);
        } catch (Exception e) {
            System.out.println("Date object parsing error");
        }

        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("insert into defect (projectname, defectname, description, reportby, iscomplete, severity, duedate, assignto) values (?,?,?,?,?,?,?,?)");
            pstmt.setString(1, pname);
            pstmt.setString(2, dname);
            pstmt.setString(3, desc);
            pstmt.setString(4, reportby);
            pstmt.setInt(5, 0);
            pstmt.setInt(6, severity);
            pstmt.setDate(7, new java.sql.Date(duedateDate.getTime()));
            pstmt.setString(8, devname);
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
     * Update the defect into the database
     *
     * @param id id of the defect
     * @param dname name of the defect
     * @param desc description of the defect
     * @param pm person in charge of the defect
     * @param isComplete the completion status of the defect
     * @param sev the severity of the defect
     * @param duedate the due date of the defect
     * @param assignto the person in charge of solving the defect
     * @return true or false depending if the method was successful
     */
    public static boolean updateDefect(int id, String dname, String desc, String pm, int isComplete, int sev, String duedate, String assignto) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Date duedateDate = null;
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

        try {
            duedateDate = formatter.parse(duedate);
        } catch (Exception e) {
            System.out.println("Date object parsing error");
        }

        try {
            conn = ConnectionManager.getConnection();

            String sql = "UPDATE defect set defectname=?, description = ?,iscomplete=?, severity=?,duedate=?,assignto=? where defectid=? ";

            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, dname);
            pstmt.setString(2, desc);
            pstmt.setInt(3, isComplete);
            pstmt.setInt(4, sev);
            pstmt.setDate(5, new java.sql.Date(duedateDate.getTime()));

            pstmt.setString(6, assignto);
            pstmt.setInt(7, id);
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
     * Registers the defect to be approved and completed by the Project Manager
     *
     * @param id the id of the defect
     * @return true or false depending if the method was successful
     */
    public static boolean markComplete(int id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = ConnectionManager.getConnection();

            String sql = "UPDATE defect set iscomplete = 1 where defectid = ?";

            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, id);

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
     * Marks the defect as complete after the developer assigned has
     * successfully solved the defect
     *
     * @param id the id of the defect
     * @return true or false depending if the method was successful
     */
    public static boolean devMarkComplete(int id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = ConnectionManager.getConnection();

            String sql = "UPDATE defect set iscomplete = 2 where defectid = ?";

            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, id);

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
     * Returns all defects
     *
     * @return an ArrayList of all Defect Objects in the database
     */
    public static ArrayList<Defect> retrieveAll() {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Defect> toReturn = new ArrayList<Defect>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select defectid,projectname,defectname,description,reportby,updatetime,iscomplete,severity,duedate,assignto from defect");

            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn.add(new Defect(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getDate(9), rs.getString(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }

    /**
     * Gets all the defects that is supposed to be completed in the month
     * indicated by the user
     *
     * @param month the integer representation of the month
     * @return true or false depending if the method was successful
     */
    public static ArrayList<Defect> retrieveAllIncompleteByMonth(int month) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Defect> toReturn = new ArrayList<Defect>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select defectid,projectname,defectname,description,reportby,updatetime,iscomplete,severity,duedate,assignto from defect "
                    + "where updatetime >= date_sub(now(), interval ? month);");

            pstmt.setInt(1, month);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn.add(new Defect(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getDate(9), rs.getString(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }

    /**
     * Retrieve all incomplete defects that is assigned to a particular
     * developer in the month
     *
     * @param month integer representation of the month in the year
     * @param dev the username of the developer
     * @return an ArrayList of Defect objects
     */
    public static ArrayList<Defect> retrieveAllIncompleteByMonth(int month, String dev) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Defect> toReturn = new ArrayList<Defect>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select defectid,projectname,defectname,description,reportby,updatetime,iscomplete,severity,duedate,assignto from defect "
                    + "where updatetime >= date_sub(now(), interval ? month) and assignto=?;");

            pstmt.setInt(1, month);
            pstmt.setString(2, dev);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn.add(new Defect(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getDate(9), rs.getString(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }

    /**
     * Returns all the defects that belong to a particular project
     *
     * @param projectname the name of the project
     * @return an ArrayList of defect objects
     */
    public static ArrayList<Defect> retrieveAllByProject(String projectname) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Defect> toReturn = new ArrayList<Defect>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select defectid,projectname,defectname,description,reportby,updatetime,iscomplete,severity,duedate,assignto from defect where projectname = ? and isComplete <> 1");
            pstmt.setString(1, projectname);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn.add(new Defect(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getDate(9), rs.getString(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;

    }

    /**
     * Returns all the defects that belong to a particular project
     *
     * @param projectname the name of the project
     * @return an ArrayList of defect objects
     */
    public static ArrayList<Defect> retrieveAllByProjectOne(String projectname, String devname) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Defect> toReturn = new ArrayList<Defect>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select defectid,projectname,defectname,description,reportby,updatetime,iscomplete,severity,duedate,assignto from defect where projectname = ? and iscomplete <> 1 and assignto=?;");
            
            pstmt.setString(1, projectname);
            pstmt.setString(2, devname);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn.add(new Defect(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getDate(9), rs.getString(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;

    }

    /**
     * Deletes a defect
     *
     * @param id the id of the defect
     * @return true or false depending if the method was successful
     */
    public static boolean deleteDefect(int id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = ConnectionManager.getConnection();

            String sql = "DELETE FROM defect where "
                    + "defectid=?  ";
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, id);

            pstmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            ConnectionManager.close(conn, pstmt);
        }
    }

    //select * from defect d, projectallocation a where d.projectname = a.projectname and developerusername='kianlam999';
    /**
     * Retrieves all defects that belongs to a developer
     *
     * @param username the username of the developer
     * @return an ArrayList of Defects that belong to the developer
     */
    public static ArrayList<Defect> retrieveDev(String username) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Defect> toReturn = new ArrayList<Defect>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select defectid,d.projectname,defectname,description,reportby,updatetime,iscomplete,severity,duedate,assignto "
                    + "from defect d, "
                    + "(select projectname "
                    + "from projectallocation group by "
                    + "developerusername , projectname "
                    + "having developerusername=?) as p "
                    + "where d.projectname = p.projectname;");

            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            while (rs.next()) {

                toReturn.add(new Defect(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getDate(9), rs.getString(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;

    }

    /**
     * Retrieve all defects that is allocated to a developer
     *
     * @param username the username of the developer
     * @return an ArrayList of defects that is allocated to a developer
     */
    public static ArrayList<Defect> retrieveAllocatedDev(String username) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Defect> toReturn = new ArrayList<Defect>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select defectid,d.projectname,defectname,description,reportby,updatetime,iscomplete,severity,duedate,assignto "
                    + "from defect d "
                    + "where d.assignto = ?;");

            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            while (rs.next()) {

                toReturn.add(new Defect(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getDate(9), rs.getString(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;

    }

    /**
     * Retrieves all defects that belong to a Project Manager
     *
     * @param username the username of the Project Manager
     * @return an ArrayList of Defects that belong to a Project Manager
     */
    public static ArrayList<Defect> retrievePm(String username) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Defect> toReturn = new ArrayList<Defect>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select defectid,d.projectname,defectname,description,reportby,updatetime, iscomplete,severity,duedate, assignto "
                    + "from defect d, "
                    + "(select projectname "
                    + "from project group by "
                    + "assignby , projectname "
                    + "having assignby=?) as p "
                    + "where d.projectname = p.projectname;");

            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            while (rs.next()) {

                toReturn.add(new Defect(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getDate(9), rs.getString(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;

    }

    /**
     * Retrieves all defects for the tester
     *
     * @return an ArrayList of Defects for the tester
     */
    public static ArrayList<Defect> retrieveTester() {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Defect> toReturn = new ArrayList<Defect>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select defectid,d.projectname,defectname,description,reportby,updatetime, iscomplete,severity,duedate, assignto "
                    + "from defect d, "
                    + "(select projectname "
                    + "from project group by "
                    + "assignby , projectname) as p "
                    + "where d.projectname = p.projectname;");

            rs = pstmt.executeQuery();

            while (rs.next()) {

                toReturn.add(new Defect(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getDate(9), rs.getString(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;

    }

    /**
     * Retrieves an individual defect
     *
     * @param id the id of the defect
     * @return the defect object
     */
    public static Defect retrieveDefect(int id) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Defect toReturn = null;
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select defectid,projectname,defectname,description,reportby,updatetime, iscomplete,severity,duedate, assignto from defect where defectid=?");
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            while (rs.next()) {

                toReturn = new Defect(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getDate(9), rs.getString(10));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;

    }

    /**
     * Retrieve a defect from its name
     *
     * @param defectname the name of the defect
     * @param projectname the name of the project
     * @return the defect object
     */
    public static Defect retrieveDefectByName(String defectname, String projectname) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Defect toReturn = null;
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select defectid,projectname,defectname,description,reportby,updatetime, iscomplete,severity,duedate, assignto from defect where defectname=? and projectname=? order by updatetime desc limit 1");
            pstmt.setString(1, defectname);
            pstmt.setString(2, projectname);
            rs = pstmt.executeQuery();

            while (rs.next()) {

                toReturn = new Defect(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getDate(9), rs.getString(10));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;

    }

    public static ArrayList<Defect> filterSortDefectsPm(String filterby, String filterText, String sortby, String username) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Defect> toReturn = new ArrayList<Defect>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select defectid,d.projectname,defectname,description,reportby,updatetime, iscomplete,severity,filtering, filteringvalue,sorting, duedate, assignto "
                    + "from defect d,  "
                    + "( "
                    + "select projectname, "
                    + "@filtering := ? as filtering, "
                    + "@filteringvalue := ? as filteringvalue, "
                    + "@inputdeveloperusername := ? as inputdeveloperusername, "
                    + "@sorting:= ? as sorting "
                    + "from project group by  "
                    + "assignby , projectname  "
                    + "having assignby = inputdeveloperusername "
                    + ") as p "
                    + "where d.projectname = p.projectname "
                    + "AND "
                    + " CASE filtering "
                    + "        WHEN 'projectname' THEN d.projectname "
                    + "        WHEN 'severity' THEN severity "
                    + "        WHEN 'iscomplete' THEN iscomplete "
                    + "        ELSE '' END "
                    + "=filteringvalue "
                    + "ORDER BY  "
                    + "    CASE sorting "
                    + "        WHEN 'updatetime' THEN updatetime  "
                    + "        ELSE '' END "
                    + "DESC, "
                    + "CASE sorting "
                    + "        WHEN 'defectname' THEN defectname "
                    + "        WHEN 'projectname' THEN d.projectname "
                    + "        ELSE  '' END "
                    + "ASC;");
            pstmt.setString(1, filterby);
            pstmt.setString(2, filterText);
            pstmt.setString(3, username);
            pstmt.setString(4, sortby);
            rs = pstmt.executeQuery();

            while (rs.next()) {

                toReturn.add(new Defect(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getDate(12), rs.getString(13)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;

    }

    public static ArrayList<Defect> filterSortDefectsDev(String filterby, String filterText, String sortby, String username) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Defect> toReturn = new ArrayList<Defect>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select defectid,d.projectname,defectname,description,reportby,updatetime, iscomplete,severity,filtering, filteringvalue,sorting "
                    + "from defect d,  "
                    + "( "
                    + "select projectname, "
                    + "@filtering := ? as filtering, "
                    + "@filteringvalue := ? as filteringvalue, "
                    + "@inputdeveloperusername := ? as inputdeveloperusername, "
                    + "@sorting:= ? as sorting "
                    + "from projectallocation group by  "
                    + "developerusername , projectname  "
                    + "having developerusername = inputdeveloperusername "
                    + ") as p "
                    + "where d.projectname = p.projectname "
                    + "AND "
                    + " CASE filtering "
                    + "        WHEN 'projectname' THEN d.projectname "
                    + "        WHEN 'severity' THEN severity "
                    + "        WHEN 'iscomplete' THEN iscomplete "
                    + "        ELSE '' END "
                    + "=filteringvalue "
                    + "ORDER BY  "
                    + "    CASE sorting "
                    + "        WHEN 'updatetime' THEN updatetime  "
                    + "        ELSE '' END "
                    + "DESC, "
                    + "CASE sorting "
                    + "        WHEN 'defectname' THEN defectname "
                    + "        WHEN 'projectname' THEN d.projectname "
                    + "        ELSE  '' END "
                    + "ASC;");
            pstmt.setString(1, filterby);
            pstmt.setString(2, filterText);
            pstmt.setString(3, username);
            pstmt.setString(4, sortby);
            rs = pstmt.executeQuery();

            while (rs.next()) {

                toReturn.add(new Defect(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getDate(12), rs.getString(13)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;

    }

    /**
     * Gets projects that are completed
     *
     * @return ArrayList of project names that have been completed
     */
    public static ArrayList<String> retrieveDistinctCompletedProject() {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<String> toReturn = new ArrayList<String>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select distinct projectname from defect where isComplete=1");

            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn.add(rs.getString(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }

    /**
     * Gets projects with defects that have been completed by the developer
     *
     * @param devUsername the username of the developer
     * @return ArrayList of Project names
     */
    public static ArrayList<String> retrieveDistinctCompletedProjectByDev(String devUsername) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<String> toReturn = new ArrayList<String>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select distinct projectname from defect where isComplete=1 and assignto=?");
            pstmt.setString(1, devUsername);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn.add(rs.getString(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }

    /**
     * Retrieve defects that have been completed by the developer and approved
     * by the Project Manager or Tester
     *
     * @param username the username of the developer
     * @return an ArrayLif of defects
     */
    public static ArrayList<Defect> retrieveAllocatedDevIsComplete(String username) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Defect> toReturn = new ArrayList<Defect>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select defectid,d.projectname,defectname,description,reportby,updatetime,iscomplete,severity,duedate,assignto "
                    + "from defect d "
                    + "where d.assignto = ? and isComplete=1;");

            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            while (rs.next()) {

                toReturn.add(new Defect(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getDate(9), rs.getString(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;

    }

    /**
     * Retrieve projects allocated to the developer which have not been approved
     * by the Project Manager/ Tester
     *
     * @param devUsername the username of the developer
     * @return Arraylist of project name
     */
    public static ArrayList<String> retrieveDevDistinctProject(String devUsername) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<String> toReturn = new ArrayList<String>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select distinct projectname from defect where assignto=? and (isComplete=1 or isComplete=0)");
            pstmt.setString(1, devUsername);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn.add(rs.getString(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }

    /**
     * Returns all project names that have defects not approved by the project
     * manager or tester
     *
     * @return Arraylist of string of project names
     */
    public static ArrayList<String> retrieveDistinctProject() {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<String> toReturn = new ArrayList<String>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select distinct projectname from defect where (isComplete=1 or isComplete=0)");

            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn.add(rs.getString(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }
}
