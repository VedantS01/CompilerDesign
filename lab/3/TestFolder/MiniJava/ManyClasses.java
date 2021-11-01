class ManyClasses {
    public static void main(String[] x) {
        System.out.println(new Caller().Start());
    }
}

class A {
    boolean data;

    public int get(){
        int rv;
        rv = 0;
        if(data!=false){
            rv = 1;
        }
        else{
            rv = 0;
        }
        return rv;
    }
}

class B extends A {
    public boolean set() {
        data = true;
        return data;
    }
}

class C extends B {
    public boolean reset() {
        data = false;
        return data;
    }
}

class Caller {
    public int Start()
    {
        boolean rv;
        A a;
        B b;
        C c;
        a = new A();
        b = new B();
        c = new C();
        rv = b.set();
        rv = c.reset();
        System.out.println(b.get());
        System.out.println(c.get());
        return 1;
    }
}    