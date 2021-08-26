all: A1.l A1.y
	bison -d A1.y -Wnone
	flex A1.l
	cc -o A1 A1.tab.c lex.yy.c -lfl -w

clean:
	rm A1.tab* A1 lex.yy.c

debug: A1.l A1.y
	bison -d -v A1.y -Wall
	flex A1.l
	cc -o A1 A1.tab.c lex.yy.c -lfl -Wall

clean-debug:
	rm A1.tab* A1 lex.yy.c A1.output