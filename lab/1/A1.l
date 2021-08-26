/**
*		A1.l -- MacroJava to MiniJava Converter Flex file
*
*		Author -- Vedant Saboo, CS19B074
*		Version -- 1.0
**/

%{
    #include "A1.tab.h"
%}

%%
"//".*						;
"class"						{
								return CLASS;
							}
"public"					{
								return PUBLIC;
							}
"static"					{
								return STATIC;
							}
"void"						{
								return VOID;
							}
"main"						{
								return MAIN;
							}
"return"					{
								return RETURN;
							}
"System.out.println"		{
								return SYS_OUT_PRINTLN;
							}
"extends"					{
								return EXTENDS;
							}
"length"					{
								return LENGTH;
							}
"Integer"					{
								return INT;
							}
"int[]"						{
								return INT_ARRAY;
							}
"int"						{
								return INT;
							}
"boolean"					{
								return BOOLEAN;
							}
"String"					{
								return STRING;
							}
"true"						{
								return TRUE;
							}
"false"						{
								return FALSE;
							}
"this"						{
								return THIS;
							}
"new"						{
								return NEW;
							}
"if"						{
								return IF;
							}
"else"						{
								return ELSE;
							}
"while"						{
								return WHILE;
							}
"&&"						{
								return AND;
							}
"||"						{
								return OR;
							}
"<="						{
								return LTE;
							}
"!="						{
								return NOTEQ;
							}
"+"							{
								return ADD;
							}
"-"							{
								return SUB;
							}
"*"							{
								return MUL;
							}
"/"							{
								return DIV;
							}
"!"							{
								return NOT;
							}
"="							{
								return EQTO;
							}
"("							{
								return LEFT_BRAC;
							}
")"							{
								return RIGHT_BRAC;
							}
"{"							{
								return LEFT_CURL_BRAC;
							}
"}"							{
								return RIGHT_CURL_BRAC;
							}
"["							{
								return LEFT_SQR_BRAC;
							}
"]"							{
								return RIGHT_SQR_BRAC;
							}
"#defineExpr0"				{
								return DEFEXPR0;
							}
"#defineExpr1"				{
								return DEFEXPR1;
							}
"#defineExpr2"				{
								return DEFEXPR2;
							}
"#defineExpr"				{
								return DEFEXPR;
							}
"#defineStmt0"				{
								return DEFSTMT0;
							}
"#defineStmt1"				{
								return DEFSTMT1;
							}
"#defineStmt2"				{
								return DEFSTMT2;
							}
"#defineStmt"				{
								return DEFSTMT;
							}
";"							{
								return SEMICOLON;
							}
","							{
								return COMMA;
							}
"."							{
								return DOT;
							}
0|([1-9][0-9]*)		{  
						yylval.name = malloc((strlen(yytext)+1)*sizeof(char));
						strcpy(yylval.name, yytext);
						return NUMBER; 
					}

[a-zA-Z_][a-zA-Z0-9_]*	{
							yylval.name = malloc(sizeof(char)*(strlen(yytext)+1));
							strcpy(yylval.name, yytext);
						 	return ID;
						}
[ \t\n\f\v\x0d]  { /* ignore whitespace */ }
.		{yyerror("Lexical error: unrecogninized character"); exit(0);}
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