/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.model;
/**
 *
 * @author KIANLAM
 */
public class Recommendation {
    private String username;
    private double loadFactor;
    private double defectScore;
    private double scheduleScore;
    private double experienceScore;
    
    public Recommendation(String username, double loadFactor, double defectScore, double scheduleScore, double experienceScore) {
        this.username = username;
        this.loadFactor = loadFactor;
        this.defectScore = defectScore;
        this.scheduleScore = scheduleScore;
        this.experienceScore = experienceScore;
    }

    public String getUsername() {
        return username;
    }

    public double getLoadFactor() {
        return loadFactor;
    }

    public double getDefectScore() {
        return defectScore;
    }


    public double getScheduleScore() {
        return scheduleScore;
    }

    public double getExperienceScore() {
        return experienceScore;
    }  
}
