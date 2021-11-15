class t11 {
    public static void main(String[] args) {
        System.out.println(new t111().go());
    }    
}

class t111 {
    int x;
    private int run() {
        x = 2;
        System.out.println(x);
        return x;
    }

    public int go() {
        t111 t1;
        t112 t2;
        int d;
        t1 = new t111();
        // d = t1.run();
        d = new t111().run();
        t1 = new t112();
        // d = t1.run();
        d = new t112().run();
        t2 = new t112();
        // d = t2.run();
        return d;
    }
}

class t112 extends t111 {
    int x;
    public int run() {
        x = 9;
        System.out.println(x);
        return x;
    }
}
