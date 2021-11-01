class ArrayTest {
    public static void main(String[] a){
        System.out.println(new Test().start(10));
    }
}

class Test {

	public int start(int sz){
		int[] b; 
		int l;
		int i;
		b = new int[sz];
		l = b.length;
		i = 0;
		while(i <= (l-1)){
			b[i] = i;
			System.out.println(b[i]);
			i = i + 1;
		}
		return 1;
	}

}