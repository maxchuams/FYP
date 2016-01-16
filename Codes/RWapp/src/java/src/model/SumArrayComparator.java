/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.model;
import java.util.*; 

/**
 *
 * @author KIANLAM
 */
public class SumArrayComparator implements Comparator {
     
    @Override
    public int compare(Object o1,Object o2){  
       ArrayList<Integer> l1 =(ArrayList<Integer>)o1;  
       ArrayList<Integer> l2 =(ArrayList<Integer>)o2;  
  
       if(sumArray(l1)==sumArray(l2))  
            return 0;  
        else if(sumArray(l1)>sumArray(l2))  
            return 1;  
        else  
            return -1;  
        }  
    
    public static int sumArray(ArrayList<Integer> arr){
        int sum = 0;
        for(Integer i: arr){sum+=i;}
        return sum;
    }
    
    
}