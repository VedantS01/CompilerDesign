class Temp {
    public static void main(String[] args) {
        System.out.println(new A().run(1,2));
    }
}

class A {
    int x;
    int x1;
    int x2;
    public int run(int x, int y) {
        x1 = x;
        x2 = y;
        return (1 + (2 * 5)) - 3;
    }
    public int one() {
        return 1;
    }
}
