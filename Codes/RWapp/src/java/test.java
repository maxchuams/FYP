
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
        ArrayList<Recommendation> rs = RecommedationDAO.getRecommendation("ecommerce","2015-09-29","2015-10-30",3);
        for(Recommendation r: rs){
            System.out.print( r.getUsername());
            System.out.print( " --> " );
            System.out.print( r.getDefectScore());
            System.out.print( r.getExperienceScore());
            System.out.print( r.getPointSystemScore());
            System.out.print( r.getWorkloadScore());
            System.out.println();
        }
            
    }
}
