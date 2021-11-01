class Test{
    public static void main(String[] args) {
        System.out.println(new A().one(true,false));
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
    public int one(boolean u, boolean v) {
        x1 = u;
        x2 = v;
        if(x1 && x2) {
            System.out.println(999);
        }

        if(!(x1 || x2)) {
            System.out.println(888);
        } else {
            System.out.println(333);
        }

        if((!(x1 && x2)) || (x2 || x1)) {
            x = 1;
        }

        if(x1 && (x1 && x2)) {
            x = 1;
        }
        return x + 11;
    }
    public int set(int a) {
        x = a;
        return 0;
    }
}