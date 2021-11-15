class t02 {
    public static void main(String[] args) {
        System.out.println(new t021().run());
    }
}

class t021 {
    boolean x;
    boolean y;
    public boolean mark() {
        x = true;
        y = false;
        return (x || y) ? x : y;
    }

    public int run() {
        int a;
        int b;
        a = 4;
        b = 5;
        return ((this.mark()) ? a : b);
    }
}