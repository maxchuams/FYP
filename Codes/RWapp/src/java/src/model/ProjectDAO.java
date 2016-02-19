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
public class ProjectDAO {

    public static ArrayList<Project> retrieveAll() {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Project> toReturn = new ArrayList<Project>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select projectname, trellokey, description, assignby, duedate, priority, iscomplete, type, psize from project");

            rs = pstmt.executeQuery();

            while (rs.next()) {

                toReturn.add(new Project(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8), rs.getInt(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;

    }

    public static ArrayList<Project> retrieveInProgress() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Project> toReturn = new ArrayList<Project>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select projectname, trellokey, description, assignby, duedate, priority, iscomplete, type, psize from project where iscomplete = 0");

            rs = pstmt.executeQuery();

            while (rs.next()) {

                toReturn.add(new Project(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8), rs.getInt(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }

    public static ArrayList<String> retrieveAllTypes() {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<String> toReturn = new ArrayList<String>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select distinct type from project");

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

    public static boolean add(Project p) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            if (retrieveProjectByProjectName(p.getName()) == null) {
                conn = ConnectionManager.getConnection();
                pstmt = conn.prepareStatement("insert into project (projectname, trellokey, description, assignby, duedate, priority, iscomplete, type, psize) values (?,?,?,?,?,?,?,?,?)");
                pstmt.setString(1, p.getName());
                pstmt.setString(2, p.getTrelloKey());
                pstmt.setString(3, p.getDesc());
                pstmt.setString(4, p.getAssignedBy());
                pstmt.setString(5, p.getDuedate());
                pstmt.setInt(6, p.getPriortiy());
                pstmt.setInt(7, p.getIsComplete());
                pstmt.setString(8, p.getType());
                pstmt.setInt(9, p.getPsize());
                pstmt.executeUpdate();
            }
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {

            ConnectionManager.close(conn, pstmt, rs);

        }
    }

    public static ArrayList<Project> retrieveByUser(String role, String username) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Project> toReturn = new ArrayList<Project>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select @sortingtype:= ? as sortingtype, @sortingname:= ? as sortingname,developerusername, p.projectname, trellokey, description, assignby, duedate, priority, p.iscomplete, type, psize "
                    + "from project p, projectallocation pa "
                    + "where p.projectname=pa.projectname "
                    + "group by p.projectname , "
                    + "CASE sortingtype "
                    + "        WHEN 'dev' THEN developerusername "
                    + "        ELSE  assignby "
                    + "END "
                    + "having "
                    + "CASE sortingtype "
                    + "        WHEN 'dev' THEN developerusername "
                    + "        ELSE  assignby "
                    + "END "
                    + "= sortingname;");
            pstmt.setString(1, role);
            pstmt.setString(2, username);
            rs = pstmt.executeQuery();

            while (rs.next()) {

                toReturn.add(new Project(rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getInt(10), rs.getString(11), rs.getInt(12)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;

    }

    public static Project retrieveProjectById(String id) {
        Project toReturn = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select projectname, trellokey, description, assignby, duedate, priority, iscomplete, type, psize from project where trellokey = ?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            while (rs.next()) {

                toReturn = new Project(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8), rs.getInt(9));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }

    public static Project retrieveProjectByProjectName(String name) {
        Project toReturn = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select projectname, trellokey, description, assignby, duedate, priority, iscomplete, type, psize from project where projectname = ?");
            pstmt.setString(1, name);
            rs = pstmt.executeQuery();

            while (rs.next()) {

                toReturn = new Project(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8), rs.getInt(9));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }

    //replaceType
    public static boolean replaceType(String toChange, String replaceWith) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("UPDATE project SET type=? WHERE type=?");
            pstmt.setString(1, replaceWith);
            pstmt.setString(2, toChange);

            pstmt.executeUpdate();

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {

            ConnectionManager.close(conn, pstmt, rs);

        }

    }

    public static ArrayList<String> retrieveAllProjectNames() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<String> toReturn = new ArrayList<String>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select projectname from project");

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

    public static boolean addCardFromTrello(String name, String assignby, String cardId, String desc, String due, int priority, String type, int days) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = ConnectionManager.getConnection();

            pstmt = conn.prepareStatement("insert into project (projectname, trellokey, description, assignby, duedate, priority,type,psize) values (?,?,?,?,?,?,?,?)");
            pstmt.setString(1, name);
            pstmt.setString(2, cardId);
            pstmt.setString(3, desc);
            pstmt.setString(4, assignby);
            pstmt.setString(5, due);
            pstmt.setInt(6, priority);
            pstmt.setString(7, type);
            pstmt.setInt(8, days);

            pstmt.executeUpdate();

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {

            ConnectionManager.close(conn, pstmt);

        }

    }

    public static boolean updateProject(String assignby, String due, int priority, int complete, int days, String type, String pname) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("UPDATE project SET assignby=?,duedate=?,priority=?,iscomplete=?,type=?,psize=? WHERE projectname=?");
            pstmt.setString(1, assignby);
            pstmt.setString(2, due);
            pstmt.setInt(3, priority);
            pstmt.setInt(4, complete);
            pstmt.setString(5, type);
            pstmt.setInt(6, days);
            pstmt.setString(7, pname);

            pstmt.executeUpdate();

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {

            ConnectionManager.close(conn, pstmt, rs);

        }
    }

    public static boolean addURL(String projname, String url) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("UPDATE project SET trellophoto=? WHERE projectname=?");
            pstmt.setString(1, url);
            pstmt.setString(2, projname);

            pstmt.executeUpdate();

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {

            ConnectionManager.close(conn, pstmt, rs);

        }

    }

    public static String retrieveTrelloPhoto(String pname) {
        String toReturn = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select trellophoto from project where projectname = ?");
            pstmt.setString(1, pname);
            rs = pstmt.executeQuery();

            while (rs.next()) {

                toReturn = rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }
    
    //Warning: If project name is invalid, this method will return null
    public static ArrayList<String> retrievePlanActualEnd(String pname) {
        ArrayList<String> toReturn = new ArrayList<String>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select min(planstart) as planstart,max(planend) as planend from projectallocation where projectname=? group by projectname;");
            pstmt.setString(1, pname);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn.add(rs.getString("planstart"));
                toReturn.add(rs.getString("planend"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        if(toReturn.size()==2) return toReturn;
        return null;
    }

}
