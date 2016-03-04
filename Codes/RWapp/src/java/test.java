
import java.util.ArrayList;
import java.util.HashMap;
import src.model.ChartJSDAO;

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

    public static void main(String[] args) {
        //ArrayList<ArrayList<Recommendation>> recommendations = RecommedationDAO.getRecommendation("wordpress", "2016-12-12", 10, 3, 2, 0.33, 0.33, 0.33, 5);

        //Gson gson = new GsonBuilder().setPrettyPrinting().create();
        //Gson gson = new Gson();
        // int choice = 1;
        //String generated = gson.toJson(recommendations);
        //String selected = gson.toJson(recommendations.get(choice));
        //RecommedationDAO.logRecommendation(recommendations,recommendations.get(choice),choice);
//        int[] arr = RecommedationDAO.retrievexfs();
//        for (int i : arr) {
//            System.out.println(i);
//        }
//        
//        ArrayList<String> arr2 = ProjectAllocationDAO.retrieveDevInProgress("debe2");
//        
//       for (String s : arr2) {
//            System.out.println(s);
//        }
         HashMap<String, Double> devmap = ChartJSDAO.getLoadRW();
        ArrayList<String> al = ChartJSDAO.getSixMonth();
        //System.out.println(ChartJSDAO.getSixMonth().toString());
        
        
        for(String i: al){
            Double timeliness = devmap.get(i);
            if(timeliness == null) timeliness=0.0;
            System.out.println(i + " : " + timeliness );
        }
        
        
     
        
    }

}
