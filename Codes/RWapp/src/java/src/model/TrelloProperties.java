/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.model;

/**
 *
 * @author maxchua
 */
public class TrelloProperties {
    private String mainboard;
    private String developmentList;
    private String postdevlist;
    private String admin;

    /**
     *Create a new TrelloProperties Object
     * @param mainboard the name of the main trello board
     * @param developmentList the name of the development list
     * @param postdevlist the list adjacent to the development list
     * @param admin the username of the admin
     */
    public TrelloProperties(String mainboard, String developmentList, String postdevlist, String admin) {
        this.mainboard = mainboard;
        this.developmentList = developmentList;
        this.postdevlist = postdevlist;
        this.admin = admin;
    }

    /**
     *
     * @return String of the mainboard
     */
    public String getMainboard() {
        return mainboard;
    }

    /**
     *
     * @param mainboard the name of the mainboard
     */
    public void setMainboard(String mainboard) {
        this.mainboard = mainboard;
    }

    /**
     *
     * @return String name of development list
     */
    public String getDevelopmentList() {
        return developmentList;
    }

    /**
     *
     * @param developmentList the name of the development list
     */
    public void setDevelopmentList(String developmentList) {
        this.developmentList = developmentList;
    }

    /**
     *
     * @return the name of the development list in string format
     */
    public String getPostdevlist() {
        return postdevlist;
    }

    /**
     *
     * @param postdevlist the name of the list after development
     */
    public void setPostdevlist(String postdevlist) {
        this.postdevlist = postdevlist;
    }

    /**
     *
     * @return name of the admin in String format
     */
    public String getAdmin() {
        return admin;
    }

    /**
     *
     * @param admin name of admins
     */
    public void setAdmin(String admin) {
        this.admin = admin;
    }

    @Override
    public String toString() {
        return "TrelloProperties{" + "mainboard=" + mainboard + ", developmentList=" + developmentList + ", postdevlist=" + postdevlist + ", admin=" + admin + '}';
    }
         
    
    
}
