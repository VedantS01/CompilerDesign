#defineExpr0 ONE() (1)

class SimpleMacroExpr {
    public static void main(String[] a){
        System.out.println(new A().run());
    }
}

class A {
    public int run(){
        return ONE();
    }
} 
