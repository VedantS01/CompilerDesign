// #define ONE() (1)
// #define TWO() (2)

class ArrayOps {
	public static void main(String[] a){
		System.out.println(new A().run());
	}
}

class A {
	public int run() {
		int[] arr;
		int rval;
		arr = new int[2];
		arr[0] = 1;
		arr[1] = 2;
		rval = (arr[0]) + (arr.length);
		return rval;
	}
}

