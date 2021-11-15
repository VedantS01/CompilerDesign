
class TesterI
{
    public static void main(String[] arg)
    {
        System.out.println(new AI().function(2+3,new AI().function(1,(true)?4:(45*15),false || false,5),new BI().function2(),(2/5)*10));
        // System.out.println(1);
    }
}

class AI
{
    int a;
    int b;
    boolean c;
    boolean d;
    int[] e;
    int[] f;
    BI x;
    BI y;
    public int function(int a,int b,boolean c,int d)
    {
        int e;
        int g;
        e = 0;
        g = 0;
        a = a + b;
        a = (a+b)*(e+g);
        f[(a+b)/(e+d)] = (c)?(a+b):(((b+g)));
        return g;
    }
}

class BI
{
    boolean a;
    boolean b;
    public boolean function2()
    {
        return (!((a&&b)||(a||b)));
    }
}