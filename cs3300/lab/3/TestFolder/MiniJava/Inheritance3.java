class Inheritance3 {
	public static void main(String[] a) {
        System.out.println(new Test().Start());
	}
}

class Base {
	int data;
	public int set(int x) {
		data = x;
		return data;
	}
	public int get() {
		return data;
	}
}

class Derived extends Base {
    int data1;
	public int set(int x) {
		data = x * 2;
		return data;
	}
}

class Test {
    public int Start()
    {
        Base b;
		Derived d;
  		b = new Base();
 		d = new Derived();
		b = d;
		System.out.println(b.set(1));
		System.out.println(b.set(3));
        System.out.println(d.set(1));
		System.out.println(d.set(3));
        return 1;
    }
}