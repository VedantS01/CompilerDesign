
//no error
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

class B {
boolean y;
}

class C extends B{
int z;
}

class D extends C{
int k;
}

class E extends B{
int m;
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
