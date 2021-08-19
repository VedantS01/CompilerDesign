lab2: lab2.l lab2.y
	bison -d lab2.y
	flex lab2.l
	cc -o lab2 lab2.tab.c lex.yy.c -lfl

clean:
	rm lab2.tab* lab2 lex.yy.c