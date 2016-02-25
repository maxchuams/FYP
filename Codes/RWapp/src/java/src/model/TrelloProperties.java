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

    public TrelloProperties(String mainboard, String developmentList, String postdevlist, String admin) {
        this.mainboard = mainboard;
        this.developmentList = developmentList;
        this.postdevlist = postdevlist;
        this.admin = admin;
    }

    public String getMainboard() {
        return mainboard;
    }

    public void setMainboard(String mainboard) {
        this.mainboard = mainboard;
    }

    public String getDevelopmentList() {
        return developmentList;
    }

    public void setDevelopmentList(String developmentList) {
        this.developmentList = developmentList;
    }

    public String getPostdevlist() {
        return postdevlist;
    }

    public void setPostdevlist(String postdevlist) {
        this.postdevlist = postdevlist;
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }
           
    
}
