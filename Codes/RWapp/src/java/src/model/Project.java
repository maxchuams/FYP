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
    private String duedate;
    private int priortiy;
    private int isComplete;
    private String type;
    private int psize;

    /**
     *Creates a new project object
     * @param name name of the project
     * @param trelloKey the trello id of the project
     * @param desc the description of the project
     * @param assignedBy the username of the project manager that assigned the project
     * @param duedate the due date of the project
     * @param priortiy the priority of the project
     * @param isComplete the completion status of the project
     * @param type the type of the project
     * @param psize the number of days required to finish the project
     */
    public Project(String name, String trelloKey, String desc, String assignedBy, String duedate, int priortiy, int isComplete, String type, int psize) {
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
    
    /**
     *Gets the name of the project
     * @return the name of the project
     */
    public String getName() {
        return name;
    }

    /**
     *
     * @param name the name of the project
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     *Get the trello Id of the project
     * @return the trello id of the project
     */
    public String getTrelloKey() {
        return trelloKey;
    }

    /**
     *
     * @param trelloKey the trello id of the project
     */
    public void setTrelloKey(String trelloKey) {
        this.trelloKey = trelloKey;
    }

    /**
     *Get the description of the project
     * @return the description of the project
     */
    public String getDesc() {
        return desc;
    }

    /**
     *
     * @param desc the description of the project
     */
    public void setDesc(String desc) {
        this.desc = desc;
    }

    /**
     *Get the due date of the project
     * @return the due date of the project
     */
    public String getDuedate() {
        return duedate;
    }

    /**
     *
     * @param duedate the due date of the project
     */
    public void setDuedate(String duedate) {
        this.duedate = duedate;
    }

    /**
     *Get the priority of the project
     * @return the priority of the project
     */
    public int getPriortiy() {
        return priortiy;
    }

    /**
     *
     * @param priortiy the priority of the project
     */
    public void setPriortiy(int priortiy) {
        this.priortiy = priortiy;
    }

    /**
     *Get the type of the project
     * @return the type of the project
     */
    public String getType() {
        return type;
    }

    /**
     *
     * @param type the type of the project
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     *Get the project manager who assigned the project
     * @return the project manager username
     */
    public String getAssignedBy() {
        return assignedBy;
    }

    /**
     *
     * @param assignedBy the project manager's username
     */
    public void setAssignedBy(String assignedBy) {
        this.assignedBy = assignedBy;
    }

    /**
     *Get the number of days required to complete the project
     * @return the number of days
     */
    public int getPsize() {
        return psize;
    }

    /**
     *
     * @param psize the number of days
     */
    public void setPsize(int psize) {
        this.psize = psize;
    }

    /**
     *Get the completion status of the project
     * @return the completion status of the project
     */
    public int getIsComplete() {
        return isComplete;
    }

    /**
     *
     * @param isComplete the completion status of the project
     */
    public void setIsComplete(int isComplete) {
        this.isComplete = isComplete;
    }

    @Override
    public String toString() {
        return "Project{" + "name=" + name + ", trelloKey=" + trelloKey + ", desc=" + desc + ", assignedBy=" + assignedBy + ", duedate=" + duedate + ", priortiy=" + priortiy + ", isComplete=" + isComplete + ", type=" + type + ", psize=" + psize + '}';
    }
    
    
   
}
