
//error
class BinarySearch{
    public static void main(String[] a){
	System.out.println(new BS().Start((20+0)));
    }
}
// This class contains an array of integers and
// methods to initialize, print and search the array
// using Binary Search

class A {
int x;
}

class B extends A {
boolean y;
private int func(int a, boolean b){
    return 5;
}
}

class C extends B {
int z;
private int func(int a, boolean b){
    return 5;
}
}

class D extends C {
int o;
private int func(int a, boolean b){
    return 5;
}
}

class E extends D {
int y;
protected int func(int a, boolean b){
    return 5;
}
}

class F extends E {
int z;
protected int func(int a, boolean b){
    return 5;
}
}

class G extends D {
boolean q;
protected int func(boolean a, boolean b){
    return 5;
}
}

class H extends G {
int z;
protected int func(boolean a, boolean b){
    return 5;
}
}


class BS{
    int[] number ;
    int size ;
    C obj_c;
    D obj_d;
    E obj_e;
    public int Start(int sz){
        obj_c = new C();
        obj_d = new D();
        obj_e = new E();
        if(obj_c != obj_d){
            sz = sz+2;
        }
//         if(obj_c != obj_e){
//             sz = sz + 1;
//         }
        return sz;
    }
}

