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
 * @author admin
 */
public class PersonDAO {
    static ArrayList<Person> plist;
    
        
    public static Person retrieveUser(String username){
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Person user = null;
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select * from user where username like ?");
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                
                user = new Person(rs.getString(1), rs.getString(2), rs.getString(3));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectionManager.close(conn, pstmt, rs);
            return user;
        }
        
     
    }
    
    public static void updateUser(Person toUpdate){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = ConnectionManager.getConnection();

            String sql = "UPDATE user set password = ? where username=? ";

            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, toUpdate.getPassword());
            pstmt.setString(2, toUpdate.getUsername());
            
            //System.out.println("SKILLS SENT TO DB : " + toUpdate.getSkills());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, pstmt);
        }
    }
   
}
