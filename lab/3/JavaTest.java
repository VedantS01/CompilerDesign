class JavaTest {
    public static void main(String[] args) {
        System.out.println(1);
    }
}
class T {
    int a;
    public int showA() {
        System.out.println(a);
        return a;
    }
    public int changeA(int x) {
        a = x;
        return 0;
    }

    public int run(int x, int y) {
        T t;
        int dump;
        t = new Q();
        dump = t.changeA(y);
        dump = t.showA();
        return dump;
    }
    
}

class Q extends T{
    public int showA() {
        a = a + 1;
        System.out.println(a);
        return a - 1;
    }
}