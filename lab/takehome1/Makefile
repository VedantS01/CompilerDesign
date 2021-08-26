infixtopostfix: infixtopostfix.l infixtopostfix.y
	bison -d infixtopostfix.y
	flex infixtopostfix.l
	cc -o infixtopostfix infixtopostfix.tab.c lex.yy.c -lfl

clean:
	rm infixtopostfix lex.yy.c infixtopostfix.tab*
