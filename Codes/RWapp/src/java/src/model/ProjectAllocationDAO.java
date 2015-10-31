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
public class ProjectAllocationDAO {
     public static boolean addAllocation(String projName, String dev, String dateAllocated) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("insert into projectallocation (projectname, developerusername, dateallocated) values (?, ?, ?)");
            pstmt.setString(1, projName);
            pstmt.setString(2, dev);
            pstmt.setString(3, dateAllocated);
      
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
