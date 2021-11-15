class t07 {
    public static void main(String[] args) {
        System.out.println(new t071().run());
    }    
}

class t071 {
    public boolean mark() {
        boolean x;
        boolean y;
        boolean z;
        x = true;
        y = false;
        z = ((x && y) || (((x && y) && (x || y)) && x)) || y;
        return (z || false) ? (z && x) : (y || x);
    }

    public int run() {
        int a;
        int b;
        int c;
        a = 3;
        b = 9;
        c = 10;
        if(this.mark()) {
            c = a + b;
        }
        return c;
    }
}