class Temp {
    public static void main(String[] args) {
        System.out.println(new A().run(3,30));
    }
}

class A {
    int x;
    boolean x1;
    boolean x2;
    public int run(int x, int y) {
        int res;
        res = 0;
        if(x <= y) {
            res = x;
        } else {
            res = y;
        }
        x1 = (((true && true)||(true && false))) && false;
        if((((true && true)||(true && false))) && false) {
            x2 = x1;
        }
        return res;
    }
    public int one() {
        return 1;
    }
    public int set(int a) {
        x = a;
        return 0;
    }
}
