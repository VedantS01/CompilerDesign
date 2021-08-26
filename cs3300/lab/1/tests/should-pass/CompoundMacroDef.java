#defineExpr1 SQUARE(a) (a*a)
#defineExpr2 SUM(a, b) (a+b)
#defineExpr2 SUMSQUARES(a, b) (SUM(SQUARE(a), SQUARE(b)))

class CompoundMacroDef {
	public static void main(String[] a){
		System.out.println(new A().run());
	}
}

class A {
	public int run(){
		return SUMSQUARES(3, 4);
	}
} 
