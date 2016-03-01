/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author maxchua
 */
public class TrelloPropertiesDAO {

    private static final String PROPS_FILENAME = "/trello.properties";
    private static String mainboard;
    private static String devList;
    private static String adminUsername;
    private static String postdevlist;

    public static TrelloProperties retrieveProperty() {
        try {
            InputStream is4 = ConnectionManager.class.getResourceAsStream(PROPS_FILENAME);
            Properties props = new Properties();
            props.load(is4);

            mainboard = props.getProperty("trello.mainboard").trim();
            devList = props.getProperty("trello.developmentList").trim();
            adminUsername = props.getProperty("trello.admin").trim();
            postdevlist = props.getProperty("trello.postdevlist").trim();
            return new TrelloProperties(mainboard, devList, postdevlist, adminUsername);
        } catch (Exception ex) {
            // unable to load properties file
            String message = "Unable to load '" + PROPS_FILENAME + "'.";
            // System.out.println(message);
            Logger.getLogger(ConnectionManager.class.getName()).log(Level.SEVERE, message, ex);
            throw new RuntimeException(message, ex);
        }

    }

    public static void updateProperty(TrelloProperties tp) {
        Properties props = new Properties();
        OutputStream output = null;

        try {
            InputStream is4 = ConnectionManager.class.getResourceAsStream(PROPS_FILENAME);
            
            props.load(is4);
            is4.close();
            output = new FileOutputStream(new File("../" + PROPS_FILENAME));
            System.out.println(tp);
            // set the properties value
            props.setProperty("trello.mainboard", tp.getMainboard());
            props.setProperty("trello.developmentList", tp.getDevelopmentList());
            props.setProperty("trello.postdevlist", tp.getPostdevlist());
            props.setProperty("trello.admin", tp.getAdmin());

            // save properties to project root folder
            props.store(output, null);
            System.out.println("THIS IS A FUCKING JOKE");

        } catch (IOException io) {
            System.out.println(io.getMessage());
            System.out.println("HOW THE FUCK DOES JAVA WORK");
        } finally {
            if (output != null) {
                try {
                    output.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

        }
//        try {
////            FileOutputStream out = new FileOutputStream(PROPS_FILENAME);
////            FileInputStream in = new FileInputStream(PROPS_FILENAME);
////            InputStream is4 = ConnectionManager.class.getResourceAsStream(PROPS_FILENAME);
////            
////            Properties props = new Properties();
////            props.load(is4);
////
////            in.close();
//            Properties props = new Properties();
//
//            File f = new File("trello.properties");
//            OutputStream out = new FileOutputStream(f);
//
//            props.setProperty("trello.mainboard", tp.getMainboard());
//            props.setProperty("trello.developmentList", tp.getDevelopmentList());
//            props.setProperty("trello.admin", tp.getAdmin());
//            props.setProperty("trello.postdevlist", tp.getPostdevlist());
//            props.store(out, null);
//            out.close();
//
//        } catch (Exception ex) {
//            String message = "Unable to load '" + PROPS_FILENAME + "'.";
//            // System.out.println(message);
//            Logger.getLogger(ConnectionManager.class.getName()).log(Level.SEVERE, message, ex);
//            throw new RuntimeException(message, ex);
//        }
    }
}
