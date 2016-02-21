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

    public static boolean markComplete(int id) {
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

    public static boolean devMarkComplete(int id) {
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

                toReturn.add(new Defect(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getDate(9),rs.getString(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;

    }
    
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

                toReturn.add(new Defect(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getDate(9),rs.getString(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;

    }

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

                toReturn.add(new Defect(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getDate(9),rs.getString(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;

    }
    
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

                toReturn.add(new Defect(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getDate(9),rs.getString(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;

    }
    
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

                toReturn = new Defect(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8),rs.getDate(9), rs.getString(10));
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

                toReturn.add(new Defect(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getDate(12),rs.getString(13)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;

    }
}