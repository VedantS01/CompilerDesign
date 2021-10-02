import syntaxtree.*;
import visitor.*;

public class A2 {
    public static void main(String [] args) {
        try {
            Node root = new MiniJavaParser(System.in).Goal();
            MiniJavaTypeChecker checker = new MiniJavaTypeChecker();
            root.accept(checker); // Your assignment part is invoked here.
            // checker.printSymbolTable();
            checker.typecheck = true;
            root.accept(checker);
            System.out.println("Program type checked successfully");
        }
        catch (ParseException e) {
            // System.out.println(e.toString());
            System.out.println("Type error");
        }
    }
} 