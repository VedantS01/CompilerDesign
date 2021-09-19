class Test {
    public static void main(String[] args) {
        System.out.println(new A().a(1,true));
    }
}

class A {
    int a;
    public int a(int x, boolean y) {
        if(y) a = x;
        return a;
    }
}