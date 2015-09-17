/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.model;

/**
 *
 * @author admin
 */
public class Person {

    private String type;
    private String username;
    private String password;
    private String dateStarted;
    private String skills;

    public Person(String username, String password, String type, String dateStarted,String skills) {
        this.username = username;
        this.password = password;
        this.type = type;
        this.dateStarted = dateStarted;
        this.skills = skills;
    }
    
    public void setPassword(String password){
        this.password = password;
    }
    
    public void setSkills(String skills){
        this.skills = skills;
    }
    
    public String getSkills(){
        return skills;
    }

    public String getDateStarted() {
        return dateStarted;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getType() {
        return type;
    }

}
