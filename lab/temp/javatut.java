import java.util.*;
public class javatut {
    public static void main(String[] args) {
        System.out.println(new ariados().run());
    }

}

class ariados {
    private Stack<String> stack;
    public String run() {
        stack = new Stack<String>();
        stack.add("Parent");
        stack.add("Child");
        stack.add("GrandChild");
        stack.pop();
        String s = "";
        for(String str : stack) {
            s += str + "::";
        }
        return s;
    }
}