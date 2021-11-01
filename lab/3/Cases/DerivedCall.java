class DerivedCall {
	public static void main(String[] x) {
        System.out.println(new Test().Start());
	}
}

class A {
	int a;
}

class B extends A {
	int b;
}

class F {
	public int foo(A a) {
		return 0;
	}
}

class Test{
    public int Start()
    {
        int i;
		B b;
		F f;
		f = new F();
		b = new B();
		i = f.foo(b);
		System.out.println(i);
        return 1;
    }
}