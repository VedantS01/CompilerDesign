class t10 {
    public static void main(String[] args) {
        System.out.println(new t101().go());
    }    
}

class t101 {
    int x;
    private int run() {
        x = 2;
        System.out.println(x);
        return x;
    }

    public int go() {
        t101 t1;
        t102 t2;
        int d;
        t1 = new t101();
        d = t1.run();
        t1 = new t102();
        d = t1.run();
        t2 = new t102();
        // d = t2.run();
        return d;
    }
}

class t102 extends t101 {
    int x;
    public int go() {
        t101 t1;
        t102 t2;
        int d;
        t2 = new t102();
        d = t2.run();
        t1 = new t101();
        return t1.go();
    }
    private int run() {
        x = 9;
        System.out.println(x);
        return x;
    }
}
