class CycleHeritage {
    public static void main(String[] args) {
        System.out.println(new C().run());
    }
}

class C extends F{
    public int run() {
        return 0;
    }
}

class E {
    private int run() {
        return 0;
    }
}

class D extends A {
    public int run() {
        return 0;
    }
}

class B {
    private int run() {
        return 0;
    }
}

class F extends A {
    public int run() {
        return 0;
    }
}

class G extends C {
    public int run() {
        return 0;
    }
}

class A extends C{
    protected int run() {
        return 0;
    }
}
