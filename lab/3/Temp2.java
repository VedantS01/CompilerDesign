class Test2
{
    public static void main(String[] arg)
    {
        System.out.println(new A1().function(2+3,new A1().function(1,4,false || false,5),new B().function2(),10));
    }
}

class A1
{
    boolean c;
    boolean d;
    int[] e;
    int[] f;
    B x;
    B y;
    public int function(int u,int v,boolean w,int x)
    {
        int g;
        int s;
        e = new int[x];
        f = new int[x];
        g = 0;
        s = 0;
        x = x-1;
        while(g<=x)
        {
            e[g] = u;
            f[g] = v;
            e[g] = (e[g]) + (f[g]);
            System.out.println(e[g]);
            s = s + (e[g]);
            g = g + 1;
        }
        return (w?s:0);
    }
}

class B
{
    boolean a;
    boolean b;
    public boolean function2()
    {
        a = true;
        b = true;
        return (!((a&&b)||(a||b)));
    }
}