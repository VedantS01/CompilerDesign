class t13
{
	public static void main (String[] args) 
	{
	    System.out.println((new E()).prnt());
	}
}

class E{
	A obja;
	A obja2;
	B objb;
	D objd;
	int x;
	int y;
	int z;
	int k;
    public int prnt(){
	obja = new B();
	x=obja.fna();
		
	objb = new B();
	y=objb.fna();
	
	obja2 = new D();
	z = obja2.fna();


	return 1;
    }
}


class A{
	int z;
	int k;
	public int fna(){
		System.out.println(2);
		z = this.fnb();
		k = this.fnc();
		return 1;
	}
	
	private int fnc(){
		System.out.println(2999);
		z = this.fnb();
		return 1;
	}
	
	public int fnb(){
		System.out.println(666);
		return 2;
	}
}

class B extends A{

	public int fnb(){
		System.out.println(888);
		return 3;
	}
}

class D extends B{
	int x;
	private int fnc(){
		System.out.println(3434);
		x = this.fnb();
		return 4;
	}
	
	public int fnd(){
		return this.fnc();
	}
}
