/* simplest version of calculator */
%{
#include <stdio.h>
%}

%union {
	int	int_val;
	char* name;
}

/* declare tokens */
%token NUMBER ID
%token ADD SUB MUL DIV
%token EOL

%type<name> goal expr term factor NUMBER

%%

// calclist: /* nothing */                       
//  | calclist exp EOL { printf("= %d\n", $2); } 
//  ;

// exp: factor       /*default $$ = $1 */
//  | exp ADD factor { $$ = $1 + $3; }
//  | exp SUB factor { $$ = $1 - $3; }
//  ;

// factor: term       /*default $$ = $1 */
//  | factor MUL term { $$ = $1 * $3; }
//  | factor DIV term { $$ = $1 / $3; }
//  ;

goal :
{
	
}
  | EOL
{
	
}
  | EOL goal
{
	
}
  | expr EOL goal
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
	int len = strlen($1);
	$$ = (char*) malloc((len + 1) * sizeof(char));
	$$[0] = '\0';
	strcat($$,$1);
	printf("%s ", $1);
};

%%
main(int argc, char **argv)
{
  yyparse();
}

yyerror(char *s)
{
  fprintf(stderr, "error: %s\n", s);
}