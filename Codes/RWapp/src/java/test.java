
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
        ArrayList<Recommendation> rs = RecommedationDAO.getRecommendation("ecommerce","2015-06-29","2015-07-30",3);
        System.out.println(rs);
    }
}
