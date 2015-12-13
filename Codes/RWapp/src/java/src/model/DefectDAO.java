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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author maxchua
 */
public class DefectDAO {

    public static boolean addDefect(String pname, String dname, String desc, String reportby, int severity) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("insert into defect (projectname, defectname, description, reportby, iscomplete, severity) values (?,?,?,?,?,?)");
            pstmt.setString(1, pname);
            pstmt.setString(2, dname);
            pstmt.setString(3, desc);
            pstmt.setString(4, reportby);
            pstmt.setInt(5, 0);
            pstmt.setInt(6, severity);
            pstmt.executeUpdate();

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {

            ConnectionManager.close(conn, pstmt, rs);

        }

    }

    public static boolean updateDefect(Defect toUpdate) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = ConnectionManager.getConnection();

            String sql = "UPDATE defect set description = ?, severity=? where defectid=? ";

            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, toUpdate.getDesc());
            pstmt.setInt(2, toUpdate.getSeverity());
            pstmt.setInt(3, toUpdate.getId());

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
            pstmt = conn.prepareStatement("select defectid,projectname,defectname,description,reportby,iscomplete,severity from defect");

            rs = pstmt.executeQuery();

            while (rs.next()) {

                toReturn.add(new Defect(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7)));
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
            pstmt = conn.prepareStatement("select defectid,d.projectname,defectname,description,reportby,iscomplete,severity "
                    + "from defect d, "
                    + "(select projectname "
                    + "from projectallocation group by "
                    + "developerusername , projectname "
                    + "having developerusername=?) as p "
                    + "where d.projectname = p.projectname;");

            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            while (rs.next()) {

                toReturn.add(new Defect(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7)));
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
            pstmt = conn.prepareStatement("select defectid,d.projectname,defectname,description,reportby,iscomplete,severity "
                    + "from defect d, "
                    + "(select projectname "
                    + "from project group by "
                    + "assignby , projectname "
                    + "having assignby=?) as p "
                    + "where d.projectname = p.projectname;");

            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            while (rs.next()) {

                toReturn.add(new Defect(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;

    }
}
