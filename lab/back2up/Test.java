class TesterI
{
    public static void main(String[] arg)
    {
        // System.out.println(new AI().function(2+3,new AI().function(1,(true)?4:(45*15),false || false,5),new BI().function2(),(2/5)*10));
        System.out.println(new AI().function(new AI().function(1,2,true,4),new AI().function(1,2,true,4),true,4));
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

// class Test {
//     public static void main(String[] args) {
//         System.out.println(new A().run(new A().run(new A().run(10))));
//     }
// }

// class A {
//     public int run(int r) {
//         return r;
//     }
// }

// class Par {
//     public int fun(B b) {
//         return b.get();
//     }
// }

// class Chi {
//     public int fun(C c) {
//         return c.get();
//     }
// }

// class B {
//     int b;
//     public int get() {
//         return b;
//     }
// }

// class C extends B{
//     int c;
//     public int get() {
//         return b;
//     }
// }

// class A {
//     int a;
//     public int run(int a2) {
//         parent par;
//         child chi;
//         P p;
//         C1 c;
//         par = new parent();
//         chi = new child();
//         c = new C1();
//         p = new P();
//         p = this.t();
//         return p.get();
//     }  
    
//     public P t() {
//         P p;
//         C1 c1;
//         C2 c2;
//         GC1 gc1;
//         p = new C1();
//         c1 = new C1();
//         c2 = new C2();
//         gc1 = new GC1();
//         p = (1 <= 2) ? c2 : gc1;
//         return p;
//     }

//     public int ifelse(int num) {
//         int n;
//         if(((num != 1)))
//             n = 1;
//         else
//             n = 0;
//         return n;
//     }
// }

// class P {
//     int a;
//     public int get() {
//         return a;
//     }
// }

// class C1 extends P {

// }

// class C2 extends P {

// }

// class GC1 extends C1 {

// }

// class child extends parent {

//     public C2 get(){
//         C2 p;
//         p = new C2();
//         return p;
//     }
// }

// class parent {

//     public P get(){
//         C2 p;
//         p = new C2();
//         return p;
//     }
// }
