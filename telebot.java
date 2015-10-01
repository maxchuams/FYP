package aa.streams;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Stream;
import java.util.*;
import java.nio.file.Paths;
import java.nio.file.Files;

/**
 * Created by kevinsteppe on 29/9/15.
 */
public class StreamExamples1
{
    public static void main(String[] args) throws Exception
    {

     Stream<String> lines = Files.lines(Paths.get("", "fish0.dat"));
     long count1 = lines
     			.map(x -> x.split(",")[4])
     			.mapToInt(Integer::parseInt)
     			.filter(x -> x > 10000)
     			.count();
   	System.out.println("Number of orders for more costing more than 10K cents: "+count1);
     
    
    
    Stream<String> lines2 = Files.lines(Paths.get("", "fish0.dat"));
    long count2 = lines2
    			.filter(x -> x.split(",")[3].equals("mackerel"))
    			.map(x -> x.split(",")[4])
     			.mapToInt(Integer::parseInt)
     			.filter(x -> x > 10000)
     			.count();
     	System.out.println("Number of mackerel orders for more than 10K fish: " +count2);
     	
     			Stream<String> lines3 = Files.lines(Paths.get("", "fish0.dat"));
				 OptionalDouble count3 = lines3
					 .filter(x -> x.split(",")[3].equals("mackerel"))
				 .map(x -> x.split(",")[5])
				 .mapToInt(Integer::parseInt)
				 .filter(x -> x > 20)
				 .average();
 
 				System.out.println("Average price of mackerel paid in orders of > 20 fish: " + count3.orElse(0));

   				 Stream<String> lines4 = Files.lines(Paths.get("", "fish0.dat"));
    			lines4
    			.map(x -> 999-Integer.parseInt(x.split(",")[5])+","+x.split(",")[0]+","+ x.split(",")[1]+","+ x.split(",")[2]+","+ x.split(",")[3]+","+ x.split(",")[4]+","+x.split(",")[5])
    			.sorted()
    			.limit(10)
    			.map(x -> x.split(",")[1]+","+ x.split(",")[2]+","+ x.split(",")[3]+","+ x.split(",")[4]+","+x.split(",")[5]+","+x.split(",")[6])
     			.forEach(x -> System.out.println(x));
    }
    

}

