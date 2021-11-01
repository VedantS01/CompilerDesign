class t06 {
    public static void main(String[] args) {
        System.out.println(new t061().run(new t061()));
    }
}

class t061 {
    public boolean mark() {
        boolean x;
        boolean y;
        boolean z;
        x = true;
        y = false;
        z = ((x && y) || (((x && y) && (x || y)) && x)) || y;
        return (z || false) ? (z && x) : (y || x);
    }

    public int run(t061 s) {
        int a;
        a = 2;
        if((s.mark()) ? (this.mark()) : (s.mark())) {
            a = 4;
        }
        return a;
    }
}