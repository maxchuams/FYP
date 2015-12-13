/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.model;

import java.util.Date;

/**
 *
 * @author maxchua
 */
public class Project {
    private String name;
    private String trelloKey;
    private String desc;
    private String assignedBy;
    private Date duedate;
    private int priortiy;
    private int isComplete;
    private String type;
    private int psize;

    public Project(String name, String trelloKey, String desc, String assignedBy, Date duedate, int priortiy, int isComplete, String type, int psize) {
        this.name = name;
        this.trelloKey = trelloKey;
        this.desc = desc;
        this.assignedBy = assignedBy;
        this.duedate = duedate;
        this.priortiy = priortiy;
        this.isComplete = isComplete;
        this.type = type;
        this.psize = psize;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTrelloKey() {
        return trelloKey;
    }

    public void setTrelloKey(String trelloKey) {
        this.trelloKey = trelloKey;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Date getDuedate() {
        return duedate;
    }

    public void setDuedate(Date duedate) {
        this.duedate = duedate;
    }

    public int getPriortiy() {
        return priortiy;
    }

    public void setPriortiy(int priortiy) {
        this.priortiy = priortiy;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAssignedBy() {
        return assignedBy;
    }

    public void setAssignedBy(String assignedBy) {
        this.assignedBy = assignedBy;
    }

    public int getPsize() {
        return psize;
    }

    public void setPsize(int psize) {
        this.psize = psize;
    }

    public int getIsComplete() {
        return isComplete;
    }

    public void setIsComplete(int isComplete) {
        this.isComplete = isComplete;
    }

    @Override
    public String toString() {
        return "Project{" + "name=" + name + ", trelloKey=" + trelloKey + ", desc=" + desc + ", assignedBy=" + assignedBy + ", duedate=" + duedate + ", priortiy=" + priortiy + ", isComplete=" + isComplete + ", type=" + type + ", psize=" + psize + '}';
    }
    
    
   
}
