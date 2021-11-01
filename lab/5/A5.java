import syntaxtree.*;
import visitor.*;

public class A5 {
   public static void main(String [] args) {
      try {
         Node root = new MiniRAParser(System.in).Goal();
         System.err.println("PROGRAM PARSED SUCCESSFULLY");
      }
      catch (ParseException e) {
         System.err.println(e.toString());
      }
   }
}