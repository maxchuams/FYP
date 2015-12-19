/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.model;

import java.util.Date;

/**
 *
 * @author KIANLAM
 */
public class Recommendation {

    /**
    developer,
    nationality,
    currentproject,
    earlieststart, 
    estimateworkingday,
    estimateday,
    scheduleperformance,
    estimatecompletion,
    idealcompletion, 
    defectlessfactor,
    schedulefactor,
    avgdefectperproject,
    experiencefactor,
    projectcount,
    zainessscore,
    sorting
     **/

    private String username;
    private String nationality; 
    private int currentprojectcount; 
    private Date earlieststart;
    private int estimateworkingday;
    private int estimateday; 
    private double scheduleperformance; 
    private Date estimatecompletion;
    private Date idealcompletion; 
    private double defectlessfactor;
    private double schedulefactor;
    private double avgdefectperproject;
    private double experiencefactor;
    private int projectexperiencecount;
    private double zainessscore;
    private int sorting;

    public Recommendation(String username, String nationality, int currentprojectcount, 
            Date earlieststart, int estimateworkingday, int estimateday, double scheduleperformance, 
            Date estimatecompletion, Date idealcompletion, double defectlessfactor, 
            double schedulefactor, double avgdefectperproject, double experiencefactor, 
            int projectexperiencecount, double zainessscore, int sorting) {
        this.username = username;
        this.nationality = nationality;
        this.currentprojectcount = currentprojectcount;
        this.earlieststart = earlieststart;
        this.estimateworkingday = estimateworkingday;
        this.estimateday = estimateday;
        this.scheduleperformance = scheduleperformance;
        this.estimatecompletion = estimatecompletion;
        this.idealcompletion = idealcompletion;
        this.defectlessfactor = defectlessfactor;
        this.schedulefactor = schedulefactor;
        this.avgdefectperproject = avgdefectperproject;
        this.experiencefactor = experiencefactor;
        this.projectexperiencecount = projectexperiencecount;
        this.zainessscore = zainessscore;
        this.sorting = sorting;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public int getCurrentprojectcount() {
        return currentprojectcount;
    }

    public void setCurrentprojectcount(int currentprojectcount) {
        this.currentprojectcount = currentprojectcount;
    }

    public Date getEarlieststart() {
        return earlieststart;
    }

    public void setEarlieststart(Date earlieststart) {
        this.earlieststart = earlieststart;
    }

    public int getEstimateworkingday() {
        return estimateworkingday;
    }

    public void setEstimateworkingday(int estimateworkingday) {
        this.estimateworkingday = estimateworkingday;
    }

    public int getEstimateday() {
        return estimateday;
    }

    public void setEstimateday(int estimateday) {
        this.estimateday = estimateday;
    }

    public double getScheduleperformance() {
        return scheduleperformance;
    }

    public void setScheduleperformance(double scheduleperformance) {
        this.scheduleperformance = scheduleperformance;
    }

    public Date getEstimatecompletion() {
        return estimatecompletion;
    }

    public void setEstimatecompletion(Date estimatecompletion) {
        this.estimatecompletion = estimatecompletion;
    }

    public Date getIdealcompletion() {
        return idealcompletion;
    }

    public void setIdealcompletion(Date idealcompletion) {
        this.idealcompletion = idealcompletion;
    }

    public double getDefectlessfactor() {
        return defectlessfactor;
    }

    public void setDefectlessfactor(double defectlessfactor) {
        this.defectlessfactor = defectlessfactor;
    }

    public double getSchedulefactor() {
        return schedulefactor;
    }

    public void setSchedulefactor(double schedulefactor) {
        this.schedulefactor = schedulefactor;
    }

    public double getAvgdefectperproject() {
        return avgdefectperproject;
    }

    public void setAvgdefectperproject(double avgdefectperproject) {
        this.avgdefectperproject = avgdefectperproject;
    }

    public double getExperiencefactor() {
        return experiencefactor;
    }

    public void setExperiencefactor(double experiencefactor) {
        this.experiencefactor = experiencefactor;
    }

    public int getProjectexperiencecount() {
        return projectexperiencecount;
    }

    public void setProjectexperiencecount(int projectexperiencecount) {
        this.projectexperiencecount = projectexperiencecount;
    }

    public double getZainessscore() {
        return zainessscore;
    }

    public void setZainessscore(double zainessscore) {
        this.zainessscore = zainessscore;
    }

    public int getSorting() {
        return sorting;
    }

    public void setSorting(int sorting) {
        this.sorting = sorting;
    }
    

    
    

}
