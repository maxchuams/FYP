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
    
    public ProjectAllocation(String project, Timestamp startDate, Timestamp endDate, String devName){
        this.project = project;
        this.startDate = startDate;
        this.endDate = endDate;
        this.devName = devName;
    }
    
    public Timestamp getStartDate(){
        return startDate;
    }
    public Timestamp getEndDate(){
        return endDate;
    }
    public String getProject(){
        return project;
    }
    public String getDevName(){
        return devName;
    }
}
