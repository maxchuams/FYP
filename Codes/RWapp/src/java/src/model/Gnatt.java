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
public class Gnatt {
    
    private String projectName;
    private String developerName;
    private Timestamp planstart;
    private Timestamp planend;

    public Gnatt(String projectName, String developerName, Timestamp planstart, Timestamp planend) {
        this.projectName = projectName;
        this.developerName = developerName;
        this.planstart = planstart;
        this.planend = planend;
    }
    
    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getDeveloperName() {
        return developerName;
    }

    public void setDeveloperName(String developerName) {
        this.developerName = developerName;
    }

    public Timestamp getPlanstart() {
        return planstart;
    }

    public void setPlanstart(Timestamp planstart) {
        this.planstart = planstart;
    }

    public Timestamp getPlanend() {
        return planend;
    }

    public void setPlanend(Timestamp planend) {
        this.planend = planend;
    }
    
    
}
