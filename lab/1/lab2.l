
	//FLEX FILE adder.l 

%{
#include <stdio.h>
#include <stdlib.h>
#include<string.h>
#include<stdbool.h>
#include <assert.h>
#include "lab2.tab.h" // the output of bison on adder.y
void yyerror(char*); 
int yyparse(void); 
%}

%%

"//".*		;


"class"				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return CLASS;
				}
"{"				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return LEFTCURLBRAC;
				}
"}"				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return RIGHTCURLBRAC;
				}
"public"			{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return PUBLIC;
				}
"static"			{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return STATIC;
				}
"void"				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return VOID;
				}
"main"				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return MAIN;
				}
"("				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return LEFTBRAC;
				}
")"				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return RIGHTBRAC;
				}
"String"			{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return STRING;
				}
"["				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return LEFTSQBRAC;
				}
"]"				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return RIGHTSQBRAC;
				}
"System.out.println"		{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return SOP;
				}
"="				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return EQ;
				}
"/"				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return DIV; 
				}
"*"				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return MUL;  
				}
"+"				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return PLUS;
				}
"-"				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return MINUS;
				}
";"				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return SEMICOLON;
				}
","				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return COMMA;
				}
"?"				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return QUES;
				}
"!"				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return NOT;
				}
"."				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return DOT;
				}
"extends"			{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return EXTENDS;
				}
"return"			{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return RETURN;
				}
"int"				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return INTTYPE;
				}
"boolean"			{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return BOOL;
				}
"if"				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return IF;
				}
"else"				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return ELSE;
				}
"while"				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return WHILE;
				}
"&&"				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return AND;
				}
"||"				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return OR;
				}
"!="				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return NEQ;
				}
"<="				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return LEQ;
				}
".length"			{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return DLEN;
				}
"true"				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return TR;
				}
"false"				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return FL;
				}
"this"				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return THIS;
				}
"new"				{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return NEW;
				}
"#define"			{	yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					return HDEF;
				}
[ \t\n\r\f]+		;		//do nothing on whitespace
<<EOF>>				 {return 0;}


[A-Z|a-z]([A-Z|a-z]|[0-9]|[_])*	{

					yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					//printf("%s %s\n",yytext, "flex id");
					return IDENTIFIER;
					}

[0-9]+			{ 
					//printf("Saw an integer %s\n",yytext); 
					yylval.char_val = (char*)malloc(strlen(yytext)+1);
					strcpy(yylval.char_val,yytext);
					//printf("%s %s\n",yytext, "flex int");
					return INTEGER_LITERAL; 
				}

.				{printf("error\n");return 1;}

%%

