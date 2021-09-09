class Test {
    public static void main(String[] args) {
        System.out.println(new b().a(10,true));
    }
}

class A {
    int a;
    public int a(int x, boolean y) {
        if(y) a = x;
        return a;
    }
}

class b extends A {
    int _b;
}