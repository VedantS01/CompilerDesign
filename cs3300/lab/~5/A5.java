import syntaxtree.*;
import visitor.*;

public class A5 {
   public static void main(String [] args) {
      try {
         Node root = new MiniRAParser(System.in).Goal();
         AssemblyGen gen = new AssemblyGen();
         root.accept(gen, null);
      }
      catch (ParseException e) {
         System.err.println(e.toString());
      }
   }
}