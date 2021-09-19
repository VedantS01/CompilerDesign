// error
class Error5
{
    public static void main(String[] str)
    {
        System.out.println(10);
    }    
}

class A 
{
    private int fun()
    {
        B b;
        int x;
        b = new B();
        x = b.fun();
        return 0;
    }
}

class B extends A
{
    
}