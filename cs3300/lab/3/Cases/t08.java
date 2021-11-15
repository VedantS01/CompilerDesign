class t08 {
    public static void main(String[] args) {
        System.out.println(new t081().go());
    }    
}

class t081 {
    int x;
    public int run() {
        x = 2;
        System.out.println(x);
        return x;
    }

    public int go() {
        t081 t1;
        t082 t2;
        int d;
        t1 = new t081();
        d = t1.run();
        t1 = new t082();
        d = t1.run();
        t2 = new t082();
        d = t2.run();
        return d;
    }
}

class t082 extends t081 {
    int x;
    public int run() {
        x = 8;
        System.out.println(x);
        return x;
    }
}
