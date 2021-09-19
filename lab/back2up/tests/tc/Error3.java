class Error3
{
    public static void main(String[] str)
    {
        System.out.println(10);
    }    
}


class A
{
    int y ; 
    public int computeA(int a, int b)
    {
        int x ; 
        int y ; 
        B obj1 ; 
        A obj2 ; 
        int c ; 
        int d ; 
        
        obj1 = new B() ;

        x= 1 ;
        y= 1 ;

        x = y ; 
        x = x*y ; 
        return x ; 
    }

    public int temp(boolean arg1)
    {
        int x ;
        int y ; 

        return 25 ; 
    }
}

class check extends A
{
    public int temp(int a)
    {
        A obj1 ; 
        boolean arg1 ;
        int x ; 

        x = obj1.temp(true) ; 
        return 10 ; 
    }
}


class B extends A
{
    public int access()
    {
        int arg1 ; 
        A obj1 ;     
    
        return arg1 ; 
    }
}



class C extends B
{

    public int funC()
    {
        int a ; 
        int b ;

        return a ; 
    }
}


class D extends C
{
    public int funD()
    {
        int a ; 
        C obj1 ; 


        a = obj1.temp(true) ;
        return a ; 
        
    }
    public boolean funD1()
    {
        int x ; 
        int y ;

        return true ;
    }
}


class E 
{
    public int tester()
    {
        int a ;
        int b ;  
        D obj1 ;

        a = obj1.funD() ; 
        a = obj1.funC() ; 
        b = obj1.access() ; 
        b = obj1.computeA(a,b) ; 
        b= b+ b ; 

        


        return a  ;
    }
}