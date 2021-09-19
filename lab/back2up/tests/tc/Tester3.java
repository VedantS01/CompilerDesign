
class Tester3
{
    public static void main(String[] arg)
    {
        System.out.println(1);
    }
}

class A extends B
{

}

class C extends D
{

}

class D extends B 
{

}


class B extends F
{
    int a;
    public F fun()
    {
        A a;
        B b;
        C c;
        D d;
        Z z;
        boolean x;
        boolean y;
        x = true;
        y = !x;
        return x?(y?(x ? c : d):(a)):a;
    }
}

class Z 
{

}
class F
{

}