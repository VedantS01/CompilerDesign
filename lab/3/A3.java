import syntaxtree.*;
import visitor.*;

public class A3 {
   public static void main(String [] args) {
      try {
         Node root = new MiniJavaParser(System.in).Goal();

         STGenerator stGenerator = new STGenerator();

         root.accept(stGenerator);

         SymbolTable table = stGenerator.table;

         //Table is ready.
         // table.print();

         IRGenerator generator = new IRGenerator();

         generator.table = table;

         // AttrSynthesized a = root.accept(generator, null);
         root.accept(generator, null);
         // generator.printsyntaxtable();
         //Print now, or whatever man!
        //  System.out.println("Program parsed successfully");
      }
      catch (ParseException e) {
         System.out.println(e.toString());
      }
   }
} 
