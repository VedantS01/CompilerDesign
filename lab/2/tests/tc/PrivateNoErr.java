class PrivateNoErr{
    public static void main(String[] a){
        System.out.println(new PrivateCreate().PrivateFun((10)));
    }
}

class PrivateCreate {
    private int PrivateFunAccess(int num){
        int num_aux ;
        num_aux = (num * num) ; 
        return num_aux ;
    }
    public int PrivateFun(int num){
        int num_aux ;
        num_aux = this.PrivateFunAccess(num);
        return num_aux ;
    }
}

