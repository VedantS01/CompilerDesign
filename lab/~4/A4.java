import syntaxtree.*;
import visitor.*;

public class A4 {
   public static void main(String [] args) {
      try {
         Node root = new microIRParser(System.in).Goal();
         RAllocator allocator = new RAllocator();
         root.accept(allocator, null); 
         // allocator.printallcfgs();
         RAGenerator generator = new RAGenerator();
         generator.procs = allocator.procs;
         root.accept(generator, null);
         // for (Proc p : allocator.procs) {
         //    p.out();
         // }
      }
      catch (ParseException e) {
         System.out.println(e.toString());
      }
   }
}