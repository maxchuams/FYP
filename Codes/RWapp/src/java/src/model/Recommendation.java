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

    /**
     *
     * @param username
     * @param nationality
     * @param currentprojectcount
     * @param earlieststart
     * @param estimateworkingday
     * @param estimateday
     * @param scheduleperformance
     * @param estimatecompletion
     * @param idealcompletion
     * @param defectlessfactor
     * @param schedulefactor
     * @param avgdefectperproject
     * @param experiencefactor
     * @param projectexperiencecount
     * @param zainessscore
     * @param sorting
     */
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

    /**
     *
     * @return The developer's name.
     */
    public String getUsername() {
        return username;
    }


    /**
     *The developer's country.
     * @return 
     */
    public String getNationality() {
        return nationality;
    }


    /**
     * The number of ongoing projects that a developer is partaking for the given planned start and end date.  
     *@return 
     */
    public int getCurrentprojectcount() {
        return currentprojectcount;
    }


    /**
     *
     * 
     * The earliest date that a developer can start on a new project. This is 1 day after the end date of the last project.
     * @return 
     */
    public Date getEarlieststart() {
        return earlieststart;
    }

    /**
     *
     * The estimated working days a developer need to complete a project of a fixed size based on his timeliness score working on projects of the similar type.
     * @return 
     */
    public int getEstimateworkingday() {
        return estimateworkingday;
    }

    /**
     *
     * The working days(including weekend) a developer need to complete a project of a fixed size based on his timeliness score working on projects of the similar type. 
     * We use Estimated working day &divide (5/7). Therefore, this estimation is up to the accuracy of ~1-2 days.
     * @return 
     */
    public int getEstimateday() {
        return estimateday;
    }


    /**
     *
     * The schedule performance score is the ratio to gauge the timeliness past project assignment for the developer for a specific type of project. 
     * e.g Days taken (Actual end - Actual start) &divide Allocated Days (Plan end - Plan start). 1 is always on time, 2 is always take 2x the allocated time.
     * @return 
     */
    public double getScheduleperformance() {
        return scheduleperformance;
    }

    /**
     *
     * The estimated completion date based on developer's timeliness of past project of the same type, weekend is accounted for.
     * @return 
     */
    public Date getEstimatecompletion() {
        return estimatecompletion;
    }

    /**
     *
     * The ideal completion date for this developer to complete the project based on the number of day a PM estimated for that project based on functionalities.
     * @return 
     */
    public Date getIdealcompletion() {
        return idealcompletion;
    }


    /**
     *
     * The defect score for a developer based on the developer past defect history
     * that take into account the severity of the defects and deduct points based on: high=-3, mid=-2, low=-1. 
     * The score is normalize as the a percentile(p-value) based on a normal distribution(Z-table).
     * @return 
     */
    public double getDefectlessfactor() {
        return defectlessfactor;
    }

    /**
     *
     * A log function of the Schedule Performance to represent timeliness of developer for a specific type of project. 
     * e.g 0 is worse. 1 is best.
     * @see getScheduleperformance()
     * @return 
     */
    public double getSchedulefactor() {
        return schedulefactor;
    }

    /**
     *
     * The average defects per project for a specific developer.
     * @return 
     */
    public double getAvgdefectperproject() {
        return avgdefectperproject;
    }

    /**
     *
     * The experience score of a developer. 0 is worse. 1 is best.
     * We use a formula similar to Amdahl's law to represent developer experience score leveling off after 10 standard project(20points).
     * e.g High=3points Mid=2points Low=1points 20point = experience factor=0.8
     * @return 
     */
    public double getExperiencefactor() {
        return experiencefactor;
    }

    /**
     *
     * The number of project of the similar type that a developer have completed. 
     * @return 
     */
    public int getProjectexperiencecount() {
        return projectexperiencecount;
    }

    /**
     *
     *  A score based on 3 the weighted(33% each) average of 3 factors to get the most "Zai" developer to take on high priority project: 
     * Skillset, Timeliness,low defects, High experience. 
     * @return 
     */
    public double getZainessscore() {
        return zainessscore;
    }


    /**
     *
     * The ranking order of the list of recommendation, 1 is based on "zainess" and 0 is based on earliest estimated completion date.
     * @return 
     */
    public int getSorting() {
        return sorting;
    }


}
