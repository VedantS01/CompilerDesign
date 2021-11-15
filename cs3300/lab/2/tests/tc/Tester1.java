
class Tester
{
    public static void main(String[] arg)
    {
        System.out.println(new A().function(2+3,new A().function(1,(true)?4:(45*15),false || false,5),new B().function2(),(2/5)*10));
    }
}

class A
{
    int a;
    int b;
    boolean c;
    boolean d;
    int[] e;
    int[] f;
    B x;
    B y;
    public int function(int a,int b,boolean c,int d)
    {
        int e;
        int g;
        a = a + b;
        a = (a+b)*(e+g);
        f[(a+b)/(e+d)] = (c)?(a+b):(((b+g)));
        return g;
    }
    protected int funct(int a,int b,boolean c,int d)
    {
        int e;
        int g;
        a = a + b;
        a = (a+b)*(e+g);
        f[(a+b)/(e+d)] = (c)?(a+b):(((b+g)));
        return g;
    }
}

class B extends A
{
    boolean a;
    boolean b;
    public boolean function2()
    {
        return (!((a&&b)||(a||b)));
    }
    public int f()
    {
        return (this.funct(1,2,false,5));
    }
}