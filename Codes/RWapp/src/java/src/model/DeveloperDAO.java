/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.model;

import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author maxchua
 */
public class DeveloperDAO {
    public static boolean addDeveloper(Developer p) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Person user = null;

        
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("insert into developer (username, employmentdate, nationality) values (?,?,?)");
            pstmt.setString(1, p.getUsername());
            pstmt.setString(2, p.getEmploymentDate());
            pstmt.setString(3, p.getNationality());
            pstmt.executeUpdate();

           return true;
        } catch (SQLException ex) {
            Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }finally{
            
            ConnectionManager.close(conn,pstmt,rs);
            
            
        }
        

    }
}
