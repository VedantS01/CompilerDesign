%{
#include "intopost.tab.h"
#include <string.h>
%}

%%

"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }
[0-9]+ { 
	yylval.d = atoi(yytext);
	// int len = strlen(yytext); //number of digits in the interger 
	// yylval.text = (char*) malloc((len + 1) * sizeof(char));
	// yylval.text[0] = '\0';
	// strcat(yylval.text,yytext);
	return NUMBER;
}
\n { return EOL; }
[ \t] { }
. { printf("Mystery character %s\n", yytext); }

%%


// int yyerror() {
// 	printf("Lexical error. Stopping.\n");
// }