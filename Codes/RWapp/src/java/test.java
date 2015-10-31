
import java.util.ArrayList;
import src.model.RecommedationDAO;
import src.model.Recommendation;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author KIANLAM
 */
public class test {
    public static void main(String[] args){
        System.out.println("hello world");
        ArrayList<Recommendation> rs = RecommedationDAO.getRecommendation("ecommerce","2015-09-29","2015-10-30",3);
        for(Recommendation r: rs){
            System.out.println( r.getUsername());
            System.out.println( r.getDefectScore());
            System.out.println( r.getExperienceScore());
            System.out.println( r.getPointSystemScore());
            System.out.println( r.getWorkloadScore());
        }
            
    }
}
