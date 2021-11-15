class Ternary1 {
	public static void main(String[] a) {
		System.out.println(new Test().func());
	}
}

class Test {
	public int func() {
		int a;
		boolean b;
		boolean c;

		b = true;
		c = false;

		a = (b || c) ? 1 : 0;

		return a;
	}
}
