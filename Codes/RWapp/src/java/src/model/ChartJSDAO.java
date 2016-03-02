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
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author KIANLAM
 */
public class ChartJSDAO {

    public static HashMap<String, Integer> getProjectExp(String username) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        HashMap<String, Integer> toReturn = new HashMap<String, Integer>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select p.type as type,count(p.projectname) as count "
                    + "from projectallocation pa, project p "
                    + "where pa.projectname = p.projectname and pa.iscomplete=0 and developerusername=? "
                    + "group by developerusername, p.type;");
            pstmt.setString(1, username);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn.put(rs.getString("type"),rs.getInt("count"));
            }
        } catch (SQLException ex) {
            //Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }

    public static String getColor(int id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String toReturn = "";
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select color from color where id=?");
            pstmt.setInt(1, id);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn = rs.getString("color");
            }
        } catch (SQLException ex) {
            //Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }
}
