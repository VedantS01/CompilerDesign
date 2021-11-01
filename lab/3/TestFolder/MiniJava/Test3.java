class Test3 {
    public static void main(String[] a){
	System.out.println(new Test().start());
    }
}

class Test {

    Test test;
    boolean b;

    public int start(){
    b = true;
	test = this;
	b = test.next();
	
	return 0;
    }

    public boolean next(){
	
	boolean b2;
    b2 = !b;
	b2 = ((true && (7<=7)) && !b);
	return b2; 
    }

}