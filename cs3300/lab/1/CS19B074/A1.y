/**
*		A1.y -- MacroJava to MiniJava Converter Bison file
*
*		Author -- Vedant Saboo, CS19B074
*		Version -- 1.0
**/


%{
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <assert.h>
#include <stdio.h>

void yyerror(char*);
int yylex();

typedef struct Token {
	// int tokenId;
	char* val;
	struct Token* next;
} Token;

Token* insert(Token* head, char s[]) {
	Token* t = (Token*) malloc(sizeof(Token));
	t->val = (char*) malloc(sizeof(char)*(strlen(s)+1));
	t->val[0] = '\0';
	strcat(t->val, s);
	t->next = NULL;

	if(head == NULL) return t;
	else {
		Token* t1 = head;
		while(t1->next != NULL) {
			t1 = t1->next;
		}
		t1->next = t;
		return head;
	}
}

Token* insertRecursive(Token* head, Token* t1) {
	Token* t = t1;
	// if(head == NULL) {
	// 	head = insert(head, t1->val);
	// 	return head;
	// }
	// while(t->next != NULL) {
	// 	t = t->next;
	// }
	while(t != NULL) {
		head = insert(head,t->val);
		t = t->next;
	}
	return head;
}

void printall(Token* head) {
	Token* t = head;
	while(t!=NULL) {
		printf("%s ", t->val);
		t  = t->next;
	}
}

Token* cat(Token* t1, Token* t2) {
	if(t1 == NULL) return t2;
	if(t2 == NULL) return t1;

	Token* t = t1;
	while(t->next != NULL) t = t->next;

	t->next = t2;
	return t1;
}

typedef struct Macro {
	char* name;
	int nArgs;
	Token* tokenStream;
	struct Macro* next;
} Macro;

Macro* macros = NULL;

int validateMacro(Macro* macro) {

	Macro* m = macros;
	while(m != NULL) {
		if(strcmp(m->name,macro->name)==0 && m->nArgs == macro->nArgs) {
			return 0;
		}
		m=m->next;
	}
	return 1;
}

void registerMacro(char* nameT, /*int nArgsT,*/ Token* argList, Token* tokenStreamT) {
	//TODO: validate argList, to eliminate/report duplication

	Macro* m = (Macro*) malloc(sizeof(Macro));
	m->name = nameT;
	m->nArgs = 0;
	m->tokenStream = tokenStreamT;

	// char* s = (char*) malloc(3*sizeof(char));
	// strcat(s, "$");

	Token* args = argList;
	while(args != NULL) {
		m->nArgs++;
		args = args->next;
	}

	//TODO: validate macro
	if(validateMacro(m) == 0) {
		yyerror("Illegal macro: Redefined macro");
		exit(0);
	}

	//this will reform tokenstream of the macro to include placeholders
	Token* t = m->tokenStream;
	while(t != NULL) {
		Token* a = argList;
		int argpos = 1;
		while(a != NULL) {
			if(strcmp(a->val,t->val)==0) {
				//match!
				free(t->val);
				t->val = (char*) malloc(3*sizeof(char));
				t->val[0] = '@';
				t->val[1] = '0'+argpos;
				t->val[2] = '\0';
				break;
			}
			//no match, check next
			a = a->next;
			argpos++;
		}
		t = t->next;
	}


	//tokenstream of the macro is modified and now contains appropriate placeholders
	//add it to overall macro collection

	if(macros == NULL) {
		macros = m;
		macros->next = NULL;
		return;
	}

	//else, add macro m to the second position
	m->next = macros->next;
	macros->next = m;
}

/* for debug reasons only */
void printmacros() {
	Macro* m = macros;
	while(m != NULL) {
		printf("MACRO: %s\t%d\n\t", m->name, m->nArgs);
		printall(m->tokenStream);
		printf("\nENDMACRO\n");
		m = m->next;
	}
}


Macro* matchMacro(char* name, int args) {
	Macro* m = macros;
	while(m != NULL) {
		if(strcmp(m->name, name)==0 && m->nArgs == args) {
			return m;
		}
		m=m->next;
	}
	return NULL;
}

Token* expandMacro(char* nameT, Token* argList) {
	//count arguments
	Token* t1 = argList;
	int count = 0;
	int tokencount = 0;
	while(t1 != NULL) {
		if(strcmp(t1->val,",")==0) {
			count++;
		}
		tokencount++;
		t1 = t1->next;
	}
	if(tokencount > 0) {
		//case with arguments
		count++;
	}

	//finding macthing macro definition
	Macro* m1 = matchMacro(nameT, count);
	if(m1 == NULL) {
		yyerror("Macro error: unmatched macro");
		exit(0);
	}

	//store argument list (expressions) for enabling random access
	// char** args = (char**) malloc((count)*(sizeof(char*)));
	// for(int j = 0; j < count; j++) {
	// 	args[j] = (char*) malloc(100*sizeof(char));
	// 	args[j][0] = '\0';
	// }
	Token** args = (Token**) malloc((count)*(sizeof(Token*)));
	for(int j = 0; j < count; j++) {
		args[j] = NULL;
	}
	t1 = argList;
	Token* t2;
	int i = 0;

	while(t1 != NULL) {
		if(strcmp(t1->val,",")==0) {
			i++;
		} else {
			// if(strlen(args[i])+strlen(t1->val) > 100) {
			// 	yyerror("Macro error: Argument too large");
			// 	exit(0);
			// }
			args[i] = insert(args[i],t1->val);
		}
		t2 = t1;
		t1 = t1->next;
		free(t2);
	}

	//generate token stream t2 by replacing placeholders
	Token* t = NULL;
	t1 = m1->tokenStream;
	while(t1 != NULL) {
		if(t1->val[0] == '@') {
			//operand match!
			i = atoi(t1->val+1);
			t = insertRecursive(t, args[i-1]);
		} else {
			t = insert(t, t1->val);
		}
		t1 = t1->next;
	}

	//free the allocated memory for arguments list
	for(int i = 0; i < count; i++) {
		Token* tm = args[i];
		Token* rm;
		while(tm != NULL) {
			rm = tm;
			tm = tm->next;
			free(rm);
		}
	}

	return t;
}

%}

%union {
	int	int_val;
	char* name;
	struct Token* genList;
}

/* declare tokens */
%token CLASS PUBLIC STATIC VOID MAIN RETURN SYS_OUT_PRINTLN EXTENDS INT_ARRAY INT BOOLEAN STRING TRUE FALSE THIS NEW IF ELSE WHILE NOT EQTO LEFT_BRAC RIGHT_BRAC LEFT_CURL_BRAC RIGHT_CURL_BRAC LEFT_SQR_BRAC RIGHT_SQR_BRAC DEFEXPR0 DEFEXPR1 DEFEXPR2 DEFEXPR DEFSTMT0 DEFSTMT1 DEFSTMT2 DEFSTMT SEMICOLON
%token<name> NUMBER ID
%token COMMA
%token LENGTH
%precedence NO_PE
%precedence AND OR LTE NOTEQ ADD SUB MUL DIV DOT LEFT_SQR_BRAC
%precedence NO_ELSE
%precedence ELSE

// %type<name> goal expr term factor NUMBER
%type<name> Identifier Type Number
%type<genList> MainClass 
%type<genList> TypeIdStar
%type<genList> goal
%type<genList> TypeDec
%type<genList> TypeDecStar
%type<genList> MacroDefStar
%type<genList> MethodStar
%type<genList> Expr
%type<genList> ExprList
%type<genList> ExprListT
%type<genList> ArgList
%type<genList> ArgListT
%type<genList> PE
%type<genList> PES
%type<genList> MethodDec
%type<genList> Stmt
%type<genList> IfStmt
%type<genList> StmtStar
%type<genList> MacroDef
%type<genList> MacroDefExpr
%type<genList> MacroDefStmt
%type<genList> CommaIdStar

%%

goal : MacroDefStar MainClass TypeDecStar
{
	$$ = NULL;
	$$ = cat($$, $1);
	$$ = cat($$, $2);
	$$ = cat($$, $3);
	printall($$);
	printf("\n");
};
MainClass : CLASS Identifier LEFT_CURL_BRAC TypeIdStar PUBLIC STATIC VOID MAIN LEFT_BRAC STRING LEFT_SQR_BRAC RIGHT_SQR_BRAC Identifier RIGHT_BRAC LEFT_CURL_BRAC SYS_OUT_PRINTLN LEFT_BRAC Expr RIGHT_BRAC SEMICOLON RIGHT_CURL_BRAC RIGHT_CURL_BRAC
{
	$$ = NULL;
	$$ = insert($$, "class");
	$$ = insert($$, $2);
	$$ = insert($$, "{");
	$$ = cat($$, $4);
	$$ = insert($$, "public");
	$$ = insert($$, "static");
	$$ = insert($$, "void"); 
	$$ = insert($$, "main");
	$$ = insert($$, "(");
	$$ = insert($$, "String");
	$$ = insert($$, "[");
	$$ = insert($$, "]");
	$$ = insert($$, $13);
	$$ = insert($$, ")");
	$$ = insert($$, "{");
	$$ = insert($$, "System.out.println");
	$$ = insert($$, "(");
	$$ = cat($$, $18);
	$$ = insert($$, ")");
	$$ = insert($$, ";");
	$$ = insert($$, "}");
	$$ = insert($$, "}");	
};
TypeDecStar : 
 %empty {
	$$ = NULL;
}
  | TypeDec TypeDecStar
{
	$$ = NULL;
	$$ = cat($$, $1);
	$$ = cat($$, $2);
};
TypeDec : CLASS Identifier LEFT_CURL_BRAC TypeIdStar MethodStar RIGHT_CURL_BRAC
{
	$$ = NULL;
	$$ = insert($$, "class");
	$$ = insert($$, $2);
	$$ = insert($$, "{");
	$$ = cat($$, $4);
	$$ = cat($$, $5);
	$$ = insert($$, "}");
}
  | CLASS Identifier EXTENDS Identifier LEFT_CURL_BRAC TypeIdStar MethodStar RIGHT_CURL_BRAC
{
	$$ = NULL;
	$$ = insert($$, "class");
	$$ = insert($$, $2);
	$$ = insert($$, "extends");
	$$ = insert($$, $4);
	$$ = insert($$, "{");
	$$ = cat($$, $6);
	$$ = cat($$, $7);
	$$ = insert($$, "}");
}
MethodStar : 
 %empty {
	$$ = NULL;
}
  | MethodDec MethodStar
{
	$$ = NULL;
	$$ = cat($$, $1);
	$$ = cat($$, $2);
};
MethodDec : PUBLIC Type Identifier LEFT_BRAC ArgList RIGHT_BRAC LEFT_CURL_BRAC TypeIdStar StmtStar RETURN Expr SEMICOLON RIGHT_CURL_BRAC
{
	$$ = NULL;
	$$ = insert($$, "public");
	$$ = insert($$, $2);
	$$ = insert($$, $3);
	$$ = insert($$, "(");
	$$ = cat($$, $5);
	$$ = insert($$, ")");
	$$ = insert($$, "{");
	$$ = cat($$, $8);
	$$ = cat($$, $9);
	$$ = insert($$, "return");
	$$ = cat($$, $11);
	$$ = insert($$, ";");
	$$ = insert($$, "}");
};
TypeIdStar : 
 %empty {
	$$ = NULL;
}
  | TypeIdStar Type Identifier SEMICOLON
{
	$$ = NULL;
	$$ = cat($$, $1);
	$$ = insert($$, $2);
	$$ = insert($$, $3);
	$$ = insert($$, ";");
};
Type : INT
{
	int len = strlen("int");
	$$ = (char*) malloc((len + 1) * sizeof(char));
	$$[0] = '\0';
	strcat($$,"int");
}
  |  INT_ARRAY
{
	int len = strlen("int[]");
	$$ = (char*) malloc((len + 1) * sizeof(char));
	$$[0] = '\0';
	strcat($$,"int[]");
}
  |  INT LEFT_SQR_BRAC RIGHT_SQR_BRAC
{
	int len = strlen("int[]");
	$$ = (char*) malloc((len + 1) * sizeof(char));
	$$[0] = '\0';
	strcat($$,"int[]");
}
  |  BOOLEAN
{
	int len = strlen("boolean");
	$$ = (char*) malloc((len + 1) * sizeof(char));
	$$[0] = '\0';
	strcat($$,"boolean");
}
  | Identifier
{
	int len = strlen($1);
	$$ = (char*) malloc((len + 1) * sizeof(char));
	$$[0] = '\0';
	strcat($$,$1);
};
ArgList : 
 %empty {
	$$ = NULL;
}
  | ArgListT
{
	$$ = NULL;
	$$ = cat($$, $1);
};
ArgListT : Type Identifier
{
	$$ = NULL;
	$$ = insert($$, $1);
	$$ = insert($$, $2);
}
  | Type Identifier COMMA ArgListT
{
	$$ = NULL;
	$$ = insert($$, $1);
	$$ = insert($$, $2);
	$$ = insert($$, ",");
	$$ = cat($$, $4);
};
StmtStar :
 %empty {
	$$ = NULL;
}
  | Stmt StmtStar
{
	$$ = NULL;
	$$ = cat($$, $1);
	$$ = cat($$, $2);
};
Stmt : LEFT_CURL_BRAC StmtStar RIGHT_CURL_BRAC
{
	$$ = NULL;
	$$ = insert($$, "{");
	$$ = cat($$, $2);
	$$ = insert($$, "}");
}
  | SYS_OUT_PRINTLN LEFT_BRAC Expr RIGHT_BRAC SEMICOLON
{
	$$ = NULL;
	$$ = insert($$, "System.out.println");
	$$ = insert($$, "(");
	$$ = cat($$, $3);
	$$ = insert($$, ")");
	$$ = insert($$, ";");
}
  | Identifier EQTO Expr SEMICOLON
{
	$$ = NULL;
	$$ = insert($$, $1);
	$$ = insert($$, "=");
	$$ = cat($$, $3);
	$$ = insert($$, ";");
}
  | Identifier LEFT_SQR_BRAC Expr RIGHT_SQR_BRAC EQTO Expr SEMICOLON
{
	$$ = NULL;
	$$ = insert($$, $1);
	$$ = insert($$, "[");
	$$ = cat($$, $3);
	$$ = insert($$, "]");
	$$ = insert($$, "=");
	$$ = cat($$, $6);
	$$ = insert($$, ";");
}
  | IfStmt 
{
	$$ = $1;
}
  | WHILE LEFT_BRAC Expr RIGHT_BRAC Stmt
{
	$$ = NULL;
	$$ = insert($$, "while");
	$$ = insert($$, "(");
	$$ = cat($$, $3);
	$$ = insert($$, ")");
	$$ = cat($$, $5);
}
  | Identifier LEFT_BRAC ExprList RIGHT_BRAC SEMICOLON
{
	$$ = expandMacro($1, $3);
	// $$ = insert($$, $1);
	// $$ = insert($$, "(");
	// $$ = cat($$, $3);
	// $$ = insert($$, ")");
	// $$ = insert($$, ";");

};
IfStmt : IF LEFT_BRAC Expr RIGHT_BRAC Stmt %prec NO_ELSE
{
	$$ = NULL;
	$$ = insert($$, "if");
	$$ = insert($$, "(");
	$$ = cat($$, $3);
	$$ = insert($$, ")");
	$$ = cat($$, $5);
}
  | IF LEFT_BRAC Expr RIGHT_BRAC Stmt ELSE Stmt
{
	$$ = NULL;
	$$ = insert($$, "if");
	$$ = insert($$, "(");
	$$ = cat($$, $3);
	$$ = insert($$, ")");
	$$ = cat($$, $5);
	$$ = insert($$, "else");
	$$ = cat($$, $7);
};
ExprList : 
 %empty {
	$$ = NULL;
}
  | ExprListT
{
	$$ = NULL;
	$$ = cat($$, $1);
};
ExprListT : Expr
{
	$$ = NULL;
	$$ = cat($$, $1);
}
  | Expr COMMA ExprListT
{
	$$ = NULL;
	$$ = cat($$, $1);
	$$ = insert($$, ",");
	$$ = cat($$, $3);
};
// MacroExprList : 
//  %empty {
// 	$$ = NULL;
// }
//   | ExprListT
// {
// 	$$ = NULL;
// 	$$ = cat($$, $1);
// };
// ExprListT : Expr
// {
// 	$$ = NULL;
// 	$$ = cat($$, $1);
// }
//   | Expr COMMA ExprListT
// {
// 	$$ = NULL;
// 	$$ = cat($$, $1);
// 	$$ = insert($$, ",");
// 	$$ = cat($$, $3);
// };
Expr : PE AND PE
{
	$$ = NULL;
	$$ = cat($$, $1);
	$$ = insert($$, "&&");
	$$ = cat($$, $3);
}
  | PE OR PE
{
	$$ = NULL;
	$$ = cat($$, $1);
	$$ = insert($$, "||");
	$$ = cat($$, $3);
}
  | PE NOTEQ PE
{
	$$ = NULL;
	$$ = cat($$, $1);
	$$ = insert($$, "!=");
	$$ = cat($$, $3);
}
  | PE LTE PE
{
	$$ = NULL;
	$$ = cat($$, $1);
	$$ = insert($$, "<=");
	$$ = cat($$, $3);
}
  | PE ADD PE
{
	$$ = NULL;
	$$ = cat($$, $1);
	$$ = insert($$, "+");
	$$ = cat($$, $3);
}
  | PE SUB PE
{
	$$ = NULL;
	$$ = cat($$, $1);
	$$ = insert($$, "-");
	$$ = cat($$, $3);
}
  | PE MUL PE
{
	$$ = NULL;
	$$ = cat($$, $1);
	$$ = insert($$, "*");
	$$ = cat($$, $3);
}
  | PE DIV PE
{
	$$ = NULL;
	$$ = cat($$, $1);
	$$ = insert($$, "/");
	$$ = cat($$, $3);
}
  | PE LEFT_SQR_BRAC PE RIGHT_SQR_BRAC
{
	$$ = NULL;
	$$ = cat($$, $1);
	$$ = insert($$, "[");
	$$ = cat($$, $3);
	$$ = insert($$, "]");
}
  | PE DOT LENGTH
{
	$$ = NULL;
	$$ = cat($$, $1);
	$$ = insert($$, ".");
	$$ = insert($$, "length");
}
  | PE %prec NO_PE
{
	$$ = NULL;
	$$ = cat($$, $1);
}
  | PE DOT Identifier LEFT_BRAC ExprList RIGHT_BRAC
{
	$$ = NULL;
	$$ = cat($$, $1);
	$$ = insert($$, ".");
	$$ = insert($$, $3);
	$$ = insert($$, "(");
	$$ = cat($$, $5);
	$$ = insert($$, ")");
}
  | Identifier LEFT_BRAC ExprList RIGHT_BRAC
{
	$$ = expandMacro($1, $3);
	// $$ = NULL;
	// $$ = insert($$, $1);
	// $$ = insert($$, "(");
	// $$ = cat($$, $3);
	// $$ = insert($$, ")");
};
PE : PES
{
	$$ = $1;
}
  | NEW INT LEFT_SQR_BRAC Expr RIGHT_SQR_BRAC
{
	$$ = NULL;
	$$ = insert($$, "new");
	$$ = insert($$, "int");
	$$ = insert($$, "[");
	$$ = cat($$, $4);
	$$ = insert($$, "]");
}
  | NEW Identifier LEFT_BRAC RIGHT_BRAC
{
	$$ = NULL;
	$$ = insert($$, "new");
	$$ = insert($$, $2);
	$$ = insert($$, "(");
	$$ = insert($$, ")");
}
  | NOT Expr
{
	$$ = NULL;
	$$ = insert($$, "!");
	$$ = cat($$, $2);
}
  | LEFT_BRAC Expr RIGHT_BRAC
{
	$$ = NULL;
	$$ = insert($$, "(");
	$$ = cat($$, $2);
	$$ = insert($$, ")");
};
PES : Number
{
	$$ = NULL;
	$$ = insert($$, $1);
}
  | TRUE
{
	$$ = NULL;
	$$ = insert($$, "true");
}
  | FALSE
{
	$$ = NULL;
	$$ = insert($$, "false");
}
  | Identifier
{
	$$ = NULL;
	$$ = insert($$, $1);
}
  | THIS
{
	$$ = NULL;
	$$ = insert($$, "this");
};
MacroDefStar : 
 %empty {
	$$ = NULL;
}
  | MacroDef MacroDefStar
{
	$$ = NULL;
	$$ = cat($$, $1);
	$$ = cat($$, $2);
};
MacroDef : MacroDefExpr
{
	$$ = $1;
}
  | MacroDefStmt
{
	$$ = $1;
};
MacroDefStmt : DEFSTMT Identifier LEFT_BRAC Identifier COMMA Identifier COMMA Identifier CommaIdStar RIGHT_BRAC LEFT_CURL_BRAC StmtStar RIGHT_CURL_BRAC
{
	$$ = NULL;
	Token* argList = NULL;
	argList = insert(argList, $4);
	argList = insert(argList, $6);
	argList = insert(argList, $8);
	argList = cat(argList, $9);
	Token* tokenStream = NULL;
	tokenStream = insert(tokenStream, "{");
	tokenStream = cat(tokenStream, $12);
	tokenStream = insert(tokenStream, "}");
	registerMacro($2, argList, tokenStream);
}
  | DEFSTMT0 Identifier LEFT_BRAC RIGHT_BRAC LEFT_CURL_BRAC StmtStar RIGHT_CURL_BRAC
{
	$$ = NULL;
	Token* argList = NULL;
	Token* tokenStream = NULL;
	tokenStream = insert(tokenStream, "{");
	tokenStream = cat(tokenStream, $6);
	tokenStream = insert(tokenStream, "}");
	registerMacro($2, argList, tokenStream);
}
  | DEFSTMT1 Identifier LEFT_BRAC Identifier RIGHT_BRAC LEFT_CURL_BRAC StmtStar RIGHT_CURL_BRAC
{
	$$ = NULL;
	Token* argList = NULL;
	argList = insert(argList, $4);
	Token* tokenStream = NULL;
	tokenStream = insert(tokenStream, "{");
	tokenStream = cat(tokenStream, $7);
	tokenStream = insert(tokenStream, "}");
	registerMacro($2, argList, tokenStream);
}
  | DEFSTMT2 Identifier LEFT_BRAC Identifier COMMA Identifier RIGHT_BRAC LEFT_CURL_BRAC StmtStar RIGHT_CURL_BRAC
{
	$$ = NULL;
	Token* argList = NULL;
	argList = insert(argList, $4);
	argList = insert(argList, $6);
	Token* tokenStream = NULL;
	tokenStream = insert(tokenStream, "{");
	tokenStream = cat(tokenStream, $9);
	tokenStream = insert(tokenStream, "}");
	registerMacro($2, argList, tokenStream);
};
MacroDefExpr : DEFEXPR Identifier LEFT_BRAC Identifier COMMA Identifier COMMA Identifier CommaIdStar RIGHT_BRAC LEFT_BRAC Expr RIGHT_BRAC
{
	$$ = NULL;
	Token* argList = NULL;
	argList = insert(argList, $4);
	argList = insert(argList, $6);
	argList = insert(argList, $8);
	argList = cat(argList, $9);
	Token* tokenStream = NULL;
	tokenStream = insert(tokenStream, "(");
	tokenStream = cat(tokenStream, $12);
	tokenStream = insert(tokenStream, ")");
	registerMacro($2, argList, tokenStream);
}
  | DEFEXPR0 Identifier LEFT_BRAC RIGHT_BRAC LEFT_BRAC Expr RIGHT_BRAC
{
	$$ = NULL;
	Token* argList = NULL;
	Token* tokenStream = NULL;
	tokenStream = insert(tokenStream, "(");
	tokenStream = cat(tokenStream, $6);
	tokenStream = insert(tokenStream, ")");
	registerMacro($2, argList, tokenStream);
}
  | DEFEXPR1 Identifier LEFT_BRAC Identifier RIGHT_BRAC LEFT_BRAC Expr RIGHT_BRAC
{
	$$ = NULL;
	Token* argList = NULL;
	argList = insert(argList, $4);
	Token* tokenStream = NULL;
	tokenStream = insert(tokenStream, "(");
	tokenStream = cat(tokenStream, $7);
	tokenStream = insert(tokenStream, ")");
	registerMacro($2, argList, tokenStream);
}
  | DEFEXPR2 Identifier LEFT_BRAC Identifier COMMA Identifier RIGHT_BRAC LEFT_BRAC Expr RIGHT_BRAC
{
	$$ = NULL;
	Token* argList = NULL;
	argList = insert(argList, $4);
	argList = insert(argList, $6);
	Token* tokenStream = NULL;
	tokenStream = insert(tokenStream, "(");
	tokenStream = cat(tokenStream, $9);
	tokenStream = insert(tokenStream, ")");
	registerMacro($2, argList, tokenStream);
};
CommaIdStar : 
 %empty {
	$$ = NULL;
}
  | COMMA Identifier CommaIdStar
{
	$$ = NULL;
	$$ = insert($$, $2);
	$$ = cat($$, $3);
} 
Number : NUMBER
{
	int len = strlen($1);
	$$ = (char*) malloc((len + 1) * sizeof(char));
	$$[0] = '\0';
	strcat($$,$1);
};
Identifier : ID
{
	int len = strlen($1);
	$$ = (char*) malloc((len + 1) * sizeof(char));
	$$[0] = '\0';
	strcat($$,$1);
};



%%
int main(int argc, char **argv)
{
  yyparse();
  return 0;
}

void yyerror(char *s)
{
  fprintf(stderr, "Error: %s\n", s);
  printf("//Failed to parse macrojava code\n");
}