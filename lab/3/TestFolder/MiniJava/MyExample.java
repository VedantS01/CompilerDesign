class MyExample {
	public static void main(String[] a) {
        System.out.println(new Test().Start());
	}
}

class Base {
	int[] arr;
	boolean bool;
	int data;
	public int set(int x) {
		int y;
		y = x;			// assign to local
		data = x + y;	// assign to field
		x = data + 2;   // assign to parameter
		return data;	// returns x * 2 
	}
	public int get() {
        data = 0;
		return data + 30;
	}
}

class Derived extends Base {
	int[] myVar;
	public int set(int x) {
		int i;
		i = 1;

		// while statement prints 1, 2, 3
		while(i <= 3){
			System.out.println(i);
			i = i + 1;
			x = x - 1;
		}
		System.out.println(x);
		data =  x * 4;
		return data;
	}

	public boolean shortCircuit(){

		int[] a; 								// array allocation
		a = new int[20];
		a[2] = 11;      						// ArrayAssignment, parent inherited field

		// if statement
		if((false) && (!(this.printInt(99))))   // short-circuit, logical end code after && and line above should be all dead
			System.out.println(999);			
		else{	
			System.out.println(a[2]);    	 	// array lookup
			System.out.println(a.length); 	 	//array.length
		}
		return true;
	}

	public boolean printInt(int x){
		System.out.println(x);
		return true;
	}
}

class Test {
    public int Start() {
        Base b;
		Derived d;
		boolean bool;
		d = new Derived();  // AllocationExpression
		b = d;				// Liskov Substitution
		System.out.println(b.set((new Base()).get())); // Print Statement, MessageSend inside a MessageSend, Base.set has been overriden, prints 108
		bool = d.shortCircuit();
        return 1;
    }
}