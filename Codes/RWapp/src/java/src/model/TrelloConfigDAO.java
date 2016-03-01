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
public class TrelloConfigDAO {

    public static TrelloProperties retrieveConfig() {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        TrelloProperties toReturn = null;
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select mainboard, developmentlist,postdevlist, admin from trelloconfig");

            rs = pstmt.executeQuery();

            while (rs.next()) {

                toReturn = new TrelloProperties(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }
        return toReturn;

    }

    public static boolean updateConfig(TrelloProperties tp) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = ConnectionManager.getConnection();

            pstmt = conn.prepareStatement("UPDATE trelloconfig  set mainboard=?, developmentlist=?, postdevlist=?, admin=?");

            pstmt.setString(1, tp.getMainboard());
            pstmt.setString(2, tp.getDevelopmentList());
            pstmt.setString(3, tp.getPostdevlist());
            pstmt.setString(4, tp.getAdmin());

            pstmt.executeUpdate();

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {

            ConnectionManager.close(conn, pstmt);

        }

    }

}
