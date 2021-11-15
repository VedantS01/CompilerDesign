class PrivateTest{
    public static void main(String[] a){
        System.out.println(new PrivateCreate().PrivateFun((10)));
    }
}

class PrivateCreate {
    private int PrivateFun(int num){
        int num_aux ;
        num_aux = (num * num) ; 
        return num_aux ;
    }
}
