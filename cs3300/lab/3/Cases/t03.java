class t03 {
    public static void main(String[] args) {
        System.out.println(new t031().run());
    }
}

class t031 {
    public int run() {
        int a;
        a = 2;
        if(true ? false : true) {
            a = 4;
        }
        return a;
    }
}