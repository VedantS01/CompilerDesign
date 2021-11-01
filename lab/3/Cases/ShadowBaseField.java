class ShadowBaseField {

    public static void main(String[] args){
        System.out.println(new Caller().Start());
    }

}


class A {

    int x;

    public int getX(){
        x=2;
        return x;
    }

}


class B extends A {

    int x;

    public int getX(){
        x = 1;
        return x;
    }

}

class Caller {
    public int Start()
    {
        A a;
        a = new A();
        System.out.println(a.getX());
        a = new B();
        System.out.println(a.getX());
        return 1;
    }
}