class Factorial{
    public static void main(String[] a){
        System.out.println(new Fac().ComputeFac((10+0)));
    }
}

class Fac {
    public int ComputeFac(int num){
        int num_aux ;
        if ((num <= 1) && (num != 0))
            num_aux = 1 ;
        else
            num_aux = 2;
        return num_aux ;
    }
}
