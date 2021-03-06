/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.model;

import java.util.ArrayList;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class TrelloCard {
    private String id;
    private String name;
    private String due;
    private String desc;
    private ArrayList<Person> members;
    private int priority;
    private String type;

    public TrelloCard(String id, String name, String due, String desc, ArrayList<Person> members, int priority, String type) {
        this.id = id;
        this.name = name;
        this.due = due;
        this.desc = desc;
        this.members = members;
        this.priority=priority;
        this.type=type;

    }

    public TrelloCard(String name, String id, String desc,String due, int priority, String type) {
        this.id = id;
        this.name = name;
        this.due = due;
        this.desc = desc;
        this.priority = priority;
        this.members = new ArrayList<Person>();
        this.type = type;
    }
    
    

    public TrelloCard(String id, String name, String due, String desc) {
        this.id = id;
        this.name = name;
        this.due = due;
        this.desc = desc;
        this.members = new ArrayList<Person>();
        this.priority = -1;
    }

    public String getType() {
        return type;
    }

    public void setType(String Type) {
        this.type = Type;
    }

    public int getPriority() {
        return priority;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }
    
    
    
    public void addMember(Person p){
        members.add(p);
    }

    public ArrayList<Person> getMembers() {
        return members;
    }

    public void setMembers(ArrayList<Person> members) {
        this.members = members;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDue() {
        return due;
    }

    public void setDue(String due) {
        this.due = due;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    @Override
    public String toString() {
        return "TrelloCard{" + "id=" + id + ", name=" + name + ", due=" + due + ", desc=" + desc + '}';
    }

    
    
}
