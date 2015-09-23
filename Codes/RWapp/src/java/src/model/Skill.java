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
public class Skill {
    String name;
    String d;
    
    public Skill(String d, String name){
        this.name= name;
        this.d = d;
    }
    
    public String getSkill(){
        return name;
    }
    public String getDeveloper(){
        return d;
    }
  
}
