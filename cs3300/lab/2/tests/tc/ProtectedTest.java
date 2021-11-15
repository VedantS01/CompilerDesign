class ProtectedTest{
    public static void main(String[] a){
        System.out.println(new ProtectedChild().ProtectedDemo((10)));
    }
}

class ProtectedCreate {
    protected int ProtectedFun(int num){
        int num_aux ;
        num_aux = (num * num) ; 
        return num_aux ;
    }
}
class ProtectedChild extends ProtectedCreate {
    protected int ProtectedFun(int num){
        int num_aux ;
        num_aux = (num * num) ; 
        return num_aux ;
    }
    public int ProtectedDemo(int num){
        int num_aux ;
        ProtectedCreate p;
        p = new ProtectedCreate();
        num_aux = p.ProtectedFun(num) ; 
        return num_aux ;
    }
}
