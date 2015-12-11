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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author maxchua
 */
public class DefectDAO {
    public static boolean addDefect(Defect d) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        

        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("insert into defect (projectname, defectname, description, reportby, iscomplete, severity) values (?,?,?,?,?,?)");
            pstmt.setString(1, d.getProjectName());
            pstmt.setString(2, d.getDefectName());
            pstmt.setString(3, d.getDesc());
            pstmt.setString(4, d.getReportedBy());
            pstmt.setInt(5, d.getIsComplete());
            pstmt.setInt(6, d.getSeverity());
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

            String sql = "UPDATE defect set description = ?, severity=? where projectname=? ";

            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, toUpdate.getDesc());
            pstmt.setInt(2, toUpdate.getSeverity());
            pstmt.setString(3, toUpdate.getProjectName());
            

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

}
