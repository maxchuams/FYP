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
    
    /**
     *Creates a new Skill object
     * @param d developer's username
     * @param name name of the skill
     */
    public Skill(String d, String name){
        this.name= name;
        this.d = d;
    }
    
    /**
     *
     * @return the skill name
     */
    public String getSkill(){
        return name;
    }

    /**
     *
     * @return the developer's username
     */
    public String getDeveloper(){
        return d;
    }
  
}
