class Ternary {
	public static void main(String[] a) {
		System.out.println(new Test().func());
	}
}

class Test {
	public int func() {
		int a;
		int d;
		boolean b;
		boolean c;

		b = true;
		c = false;
        d = 5;
		a = (b && c) ? d : (d-1);

		return a;
	}
}
