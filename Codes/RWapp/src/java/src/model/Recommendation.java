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
    private int workloadScore;
    private int defectScore;
    private int experienceScore;
    private int pointSystemScore;

    public Recommendation(String username, int workloadScore, int defectScore, int experienceScore, int pointSystemScore) {
        this.username = username;
        this.workloadScore = workloadScore;
        this.defectScore = defectScore;
        this.experienceScore = experienceScore;
        this.pointSystemScore = pointSystemScore;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getWorkloadScore() {
        return workloadScore;
    }

    public void setWorkloadScore(int workloadScore) {
        this.workloadScore = workloadScore;
    }

    public int getDefectScore() {
        return defectScore;
    }

    public void setDefectScore(int defectScore) {
        this.defectScore = defectScore;
    }

    public int getExperienceScore() {
        return experienceScore;
    }

    public void setExperienceScore(int experienceScore) {
        this.experienceScore = experienceScore;
    }

    public int getPointSystemScore() {
        return pointSystemScore;
    }

    public void setPointSystemScore(int pointSystemScore) {
        this.pointSystemScore = pointSystemScore;
    }
    
    
            
}
