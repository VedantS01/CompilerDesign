
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
public int func(int a, boolean b){
    return 5;
}
}

class C extends B {
int z;
public int func(int a, boolean b){
    return 10;
}
}

class D extends C {
int o;
public int func(int a, boolean b){
    return 15;
}
}

class E extends D {
int y;
public int func(int a, boolean b){
    return 20;
}
}

class F extends E {
int z;
public int func(int a, boolean b){
    return 25;
}
}

class G extends D {
boolean q;
public int func(int a, boolean b){
    return 30;
}
}

class H extends G {
int z;
public int func(int a, boolean b){
    return 35;
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
        // if(obj_c != obj_d){
        //     sz = sz+2;
        // }
        System.out.println(obj_c.func(1,true));
        System.out.println(obj_d.func(1,true));
        System.out.println(obj_e.func(1,true));

//         if(obj_c != obj_e){
//             sz = sz + 1;
//         }
        return sz;
    }
}

