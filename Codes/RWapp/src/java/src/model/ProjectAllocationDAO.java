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
public class ProjectAllocationDAO {
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
     
    public static ArrayList<ProjectAllocation> returnProject(){
        
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
            
            while(rs.next()){
                pA = new ProjectAllocation(rs.getString(1),rs.getTimestamp(2),rs.getTimestamp(3),rs.getString(4));
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
    public static ArrayList<String> retrieveDev(String projectname){
        ArrayList<String> toReturn = new ArrayList<String>();
                
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ProjectAllocation pA = null;
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select distinct developerusername from projectallocation where projectname = ?");
            pstmt.setString(1, projectname);
            
            rs = pstmt.executeQuery();
            
            while(rs.next()){
                
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
}
