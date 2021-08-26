#defineExpr SQUARE(a,b,c,d) (a*a)
#defineExpr SUM(a,b,c,d) (a+b)

class CompoundMacroCall {
	public static void main(String[] a){
		System.out.println(new A().run());
	}
}

class A {
	public int run(){
		return SUM(SQUARE(3,4,5,6), SQUARE(4,3,1,2),0,0);
	}
} 
