class t09 {
    public static void main(String[] args) {
        System.out.println(new t091().go());
    }    
}

class t091 {
    int x;
    private int run() {
        x = 2;
        System.out.println(x);
        return x;
    }

    public int go() {
        t091 t1;
        t092 t2;
        int d;
        t1 = new t091();
        d = t1.run();
        t1 = new t092();
        d = t1.run();
        t2 = new t092();
        d = t2.run();
        return d;
    }
}

class t092 extends t091 {
    int x;
    public int run() {
        x = 9;
        System.out.println(x);
        return x;
    }
}
