class Test {
    public static void main(String[] args) {
        System.out.println(new A().run(10));
    }
}

class A {
    int a;
    public int run(int a) {
        P p;
        p = this.t();
        return p.get();
    }  
    
    public P t() {
        P p;
        C1 c1;
        C2 c2;
        GC1 gc1;
        p = new C1();
        c1 = new C1();
        c2 = new C2();
        gc1 = new GC1();
        p = (c1 != gc1) ? c2 : gc1;
        return p;
    }
}

class P {
    int a;
    public int get() {
        return a;
    }
}

class C1 extends P {

}

class C2 extends P {

}

class GC1 extends C1 {

}
