class t01 {
    public static void main(String[] args) {
        System.out.println(new t012().run());
    }
}

class t011 {
    int x;
    int y;
    int z;
    int[] pq;
    public int run() {
        x = 2;
        y = 3;
        z = 4;
        return ((x+y)*z);
    }
}

class t012 extends t011{
    int x;
    int y;
    int z;
    public int run() {
        return (new t011().run()) + 5;
    }
}