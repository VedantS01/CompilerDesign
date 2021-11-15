class ShadowField{

    public static void main(String[] args) { 
        System.out.println(new Test().start());
    }

}


class A {

    int x;

    public A foo(){
        A x;
        x = new A();
        return x;
    }

    public int get(){
        return x;
    }
    
    public int set(){
        x = 1;
        return 1;
    }

}

class Test {
    public int start(){
        A a;
        a = new A();
        a = a.foo();
        System.out.println(a.set());
        System.out.println(a.get());
        return 1;
    }
}