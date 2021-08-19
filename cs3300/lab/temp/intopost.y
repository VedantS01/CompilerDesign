%{
#include<stdio.h>
%}

%union {
	char *text;
	int d;
}

/*declare all the tokens here*/
%token  ADD DIV MUL SUB EOL NUMBER
%type<text> goal expr term factor NUMBER 

%% 

goal : expr EOL
{

};

expr : expr ADD term 
{	
	printf(" + ");
} 
	| expr SUB term 
{
	printf(" - ");
}
	| term 
{

};

term : term MUL factor
{	
	printf(" * ");
}
	| term DIV factor 
{
	printf(" / ");
}
	| factor
{
	
};

factor : NUMBER 
{
	// int len = strlen($1);
	// $$ = (char*) malloc((len + 1) * sizeof(char));
	// $$[0] = '\0';
	// strcat($$,$1);
	printf("%s ", $1);
};

%% 

int yyerror(char *s)
{
	printf("error: %s\n", s);
	printf("// Failed to parse the infix expression\n");
	return 0;
}


int main(int argc, char **argv)
{
	yyparse();
	printf("\n");
	return 0;
}