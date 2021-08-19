fbl-1: fbl-1.l
	flex fbl-1.l
	cc lex.yy.c -lfl -o fbl-1
	./fbl-1

clean-1:
	rm fbl-1 lex.yy.c

fbl-3: fbl-3.l
	flex fbl-3.l
	cc lex.yy.c -lfl -o fbl-3
	./fbl-3

clean-3:
	rm fbl-3 lex.yy.c

fbl-4: fbl-4.l
	flex fbl-4.l
	cc lex.yy.c -lfl -o fbl-4
	./fbl-4

clean-4:
	rm fbl-4 lex.yy.c

fbl-5: fbl-5.l fbl-5.y
	bison -d fbl-5.y
	flex fbl-5.l
	cc -o fbl-5 fbl-5.tab.c lex.yy.c -lfl

clean-5:
	rm fbl-5 lex.yy.c fbl-5.tab*

intopost:  intopost.l intopost.y
	bison -d intopost.y
	flex intopost.l
	cc -o $@ lex.yy.c intopost.tab.c -lfl

clean: 
	rm intopost intopost.tab.h intopost.tab.c lex.yy.c