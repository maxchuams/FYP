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
public class DefectCommitByDAO {

    /**
     *
     * @param id the id of the defect
     * @return an Arraylist of DefectCommitBy objects
     */
    public static ArrayList<DefectCommitBy> retrieveBlameForDefect(int id) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        ArrayList<DefectCommitBy> toReturn = new ArrayList<DefectCommitBy>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select defectid, committedby from defectcommitby where defectid = ?");
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            while (rs.next()) {

                toReturn.add(new DefectCommitBy(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }
        return toReturn;

    }

    /**
     *
     * @param id of the defect
     * @return an ArrayList of strings of the developers that committed the defect
     */
    public static ArrayList<String> retrieveBlamedDevForDefect(int id) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        ArrayList<String> toReturn = new ArrayList<String>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select committedby from defectcommitby where defectid = ?");
            pstmt.setInt(1, id);
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
     *
     * @param d the DefectCommitBy object
     * @return true or false if the method is successful
     */
    public static boolean addBlame(DefectCommitBy d) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = ConnectionManager.getConnection();

            pstmt = conn.prepareStatement("INSERT into defectcommitby (`defectid`,`committedby`) VALUES (?,?)");

            pstmt.setInt(1, d.getId());
            pstmt.setString(2, d.getUsername());

            pstmt.executeUpdate();

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {

            ConnectionManager.close(conn, pstmt);

        }

    }

    /**
     *
     * @param id the id of the defect
     * @return true or false if the method is successful
     */
    public static boolean delete(int id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = ConnectionManager.getConnection();

            String sql = "DELETE FROM defectcommitby where "
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
}
