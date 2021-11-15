class t05 {
    public static void main(String[] args) {
        System.out.println(new t051().run());
    }
}

class t051 {
    public int run() {
        int a;
        a = 2;
        if(true ? true : false) {
            a = 4;
        }
        return a;
    }
}