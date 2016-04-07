/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.model;

import java.sql.Timestamp;

/**
 *
 * @author calvin
 */
public class ProjectAllocation {
    
    private String project;
    private Timestamp startDate;
    private Timestamp endDate;
    private String devName;
    
    /**
     *Creates a new Project Allocation object
     * @param project the name of the project
     * @param startDate the start date of the allocation
     * @param endDate the end date of the allocation
     * @param devName the name of the developer that is assigned to the project
     */
    public ProjectAllocation(String project, Timestamp startDate, Timestamp endDate, String devName){
        this.project = project;
        this.startDate = startDate;
        this.endDate = endDate;
        this.devName = devName;
    }
    
    /**
     *Get the start date
     * @return start date
     */
    public Timestamp getStartDate(){
        return startDate;
    }

    /**
     *Get the end date
     * @return end date
     */
    public Timestamp getEndDate(){
        return endDate;
    }

    /**
     *Get the name of the project
     * @return project name
     */
    public String getProject(){
        return project;
    }

    /**
     *Get the developer's name
     * @return the name of the developer
     */
    public String getDevName(){
        return devName;
    }
}
