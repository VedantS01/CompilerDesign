/* recognize tokens for the calculator and print them out */
%{
//    enum yytokentype {
//      NUMBER = 258,
//      ADD = 259,
//      SUB = 260,
//      MUL = 261,
//      DIV = 262,
//      ABS = 263,
//      EOL = 264
//    };
    #include "infixtopostfix.tab.h"
//    int yylval;
%}

%%
"+"    { return ADD; }
"-"    { return SUB; }
"*"    { return MUL; }
"/"    { return DIV; }
0|([1-9][0-9]*)		{  
                        yylval.int_val = atoi(yytext);
						yylval.name = malloc(strlen(yytext)+1);
						strcpy(yylval.name, yytext);
						return NUMBER; 
					}

[a-zA-Z_][a-zA-Z0-9_]*	{
							yylval.name = malloc(sizeof(char)*(strlen(yytext)+1));
							strcpy(yylval.name, yytext);
						 	return ID;
						}
\n     { return EOL; }
[ \t]  { /* ignore whitespace */ }
.      { printf("Mystery character %c\n", *yytext); }
%%
// main(int argc, char **argv)
// {
//   int tok;

//   while(tok = yylex()) {
//     printf("%d", tok);
//     if(tok == NUMBER) printf(" = %d\n", yylval);
//     else printf("\n");
//   }
// }