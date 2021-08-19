/* BISON FILE adder.y */

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <assert.h>
extern int yylex();
extern void yyerror(char *);

char* ids[100];
char* vals[100];
char* params[100];
void store(char*,char*,char*);
char* getval(char*);
char* getparams(char*);
char* str_replace(char*,char*,char*);
char** str_split(char*, const char);

%}

%union {
	//int	int_val;
	char* char_val;
	//bool bool_val;
}

%token <char_val>  INTEGER_LITERAL EQ DIV MUL PLUS MINUS SEMICOLON LEFTCURLBRAC RIGHTCURLBRAC LEFTBRAC RIGHTBRAC LEFTSQBRAC RIGHTSQBRAC COMMA QUES NOT AND OR NEQ LEQ DOT IDENTIFIER CLASS PUBLIC STATIC VOID MAIN STRING SOP EXTENDS RETURN INTTYPE BOOL IF ELSE WHILE THIS NEW HDEF DLEN TR FL
//%token <bool_val>  TR FL



%type <char_val> Goal
%type <char_val> MainClass
%type <char_val> TypeDeclaration
%type <char_val> MethodDeclaration
%type <char_val> Type
%type <char_val> Statement
%type <char_val> Expression
%type <char_val> PrimaryExpression
%type <char_val> MacroDefinition
%type <char_val> MacroDefStatement
%type <char_val> MacroDefExpression
%type <char_val> Identifier
%type <char_val> Integer
%type <char_val> STARONE
%type <char_val> STARTWO
%type <char_val> STARTHREE
%type <char_val> STARFOUR
%type <char_val> STARFIVE
%type <char_val> STARSIX
%type <char_val> STARSEVEN
%type <char_val> STAREIGHT

%start Goal

%%

Goal: MainClass	{sprintf($$,"%s\n",$1); printf("%s\n",$$);}	
	|	STARSEVEN MainClass {sprintf($$,"%s\n",$2); printf("%s\n",$$);}	
	|	MainClass STAREIGHT {sprintf($$,"%s %s\n",$1,$2); printf("%s\n",$$);}
	|	STARSEVEN MainClass STAREIGHT 	{sprintf($$,"%s %s\n",$2,$3); printf("%s\n",$$);};

MainClass: CLASS Identifier LEFTCURLBRAC PUBLIC STATIC VOID MAIN LEFTBRAC STRING LEFTSQBRAC RIGHTSQBRAC Identifier RIGHTBRAC LEFTCURLBRAC SOP LEFTBRAC Expression RIGHTBRAC SEMICOLON RIGHTCURLBRAC RIGHTCURLBRAC		{sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21);};

TypeDeclaration: CLASS Identifier LEFTCURLBRAC RIGHTCURLBRAC {sprintf($$,"%s %s %s %s",$1,$2,$3,$4);}
		|	CLASS Identifier LEFTCURLBRAC STARTWO RIGHTCURLBRAC  {sprintf($$,"%s %s %s %s %s",$1,$2,$3,$4,$5);}
		| 	CLASS Identifier LEFTCURLBRAC STARONE RIGHTCURLBRAC   {sprintf($$,"%s %s %s %s %s",$1,$2,$3,$4,$5);}
		|	CLASS Identifier LEFTCURLBRAC STARONE STARTWO RIGHTCURLBRAC	{sprintf($$,"%s %s %s %s %s %s",$1,$2,$3,$4,$5,$6);}
		|	CLASS Identifier EXTENDS Identifier LEFTCURLBRAC RIGHTCURLBRAC	{sprintf($$,"%s %s %s %s %s %s",$1,$2,$3,$4,$5,$6);}
		|	CLASS Identifier EXTENDS Identifier LEFTCURLBRAC STARTWO RIGHTCURLBRAC	{sprintf($$,"%s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7);}
		|	CLASS Identifier EXTENDS Identifier LEFTCURLBRAC STARONE RIGHTCURLBRAC	{sprintf($$,"%s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7);}
		|	CLASS Identifier EXTENDS Identifier LEFTCURLBRAC STARONE STARTWO RIGHTCURLBRAC	{sprintf($$,"%s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8);}	;

MethodDeclaration: PUBLIC Type Identifier LEFTBRAC RIGHTBRAC LEFTCURLBRAC RETURN Expression SEMICOLON RIGHTCURLBRAC	{sprintf($$,"%s %s %s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10);}
//		|	PUBLIC Type Identifier LEFTBRAC RIGHTBRAC LEFTCURLBRAC STARONE RETURN Expression SEMICOLON RIGHTCURLBRAC	{sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11);}
		|	PUBLIC Type Identifier LEFTBRAC RIGHTBRAC LEFTCURLBRAC STARTHREE RETURN Expression SEMICOLON RIGHTCURLBRAC	{sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11);}
//		|	PUBLIC Type Identifier LEFTBRAC RIGHTBRAC LEFTCURLBRAC STARONE STARTHREE RETURN Expression SEMICOLON RIGHTCURLBRAC {sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12);}	
		|	PUBLIC Type Identifier LEFTBRAC Type Identifier RIGHTBRAC LEFTCURLBRAC RETURN Expression SEMICOLON RIGHTCURLBRAC  {sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12);}	
//		|	PUBLIC Type Identifier LEFTBRAC Type Identifier RIGHTBRAC LEFTCURLBRAC STARONE RETURN Expression SEMICOLON RIGHTCURLBRAC  {sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13);}	
		|	PUBLIC Type Identifier LEFTBRAC Type Identifier RIGHTBRAC LEFTCURLBRAC STARTHREE RETURN Expression SEMICOLON RIGHTCURLBRAC  {sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13);}		
//		|	PUBLIC Type Identifier LEFTBRAC Type Identifier RIGHTBRAC LEFTCURLBRAC STARONE STARTHREE RETURN Expression SEMICOLON RIGHTCURLBRAC    {sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14);}	
		|	PUBLIC Type Identifier LEFTBRAC Type Identifier STARFOUR RIGHTBRAC LEFTCURLBRAC RETURN Expression SEMICOLON RIGHTCURLBRAC    {sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13);}
//		|	PUBLIC Type Identifier LEFTBRAC Type Identifier STARFOUR RIGHTBRAC LEFTCURLBRAC STARONE RETURN Expression SEMICOLON RIGHTCURLBRAC   {sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14);}	
		|	PUBLIC Type Identifier LEFTBRAC Type Identifier STARFOUR RIGHTBRAC LEFTCURLBRAC STARTHREE RETURN Expression SEMICOLON RIGHTCURLBRAC	{sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14);}		
//		|	PUBLIC Type Identifier LEFTBRAC Type Identifier STARFOUR RIGHTBRAC LEFTCURLBRAC STARONE STARTHREE RETURN Expression SEMICOLON RIGHTCURLBRAC	{sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15);}		;

Type: INTTYPE   {sprintf($$,"%s",$1);}
	|	BOOL	{sprintf($$,"%s",$1);}
	|	INTTYPE LEFTSQBRAC RIGHTSQBRAC	{sprintf($$,"%s %s %s",$1,$2,$3);}
	|	Identifier	{sprintf($$,"%s",$1);}	;

Statement: LEFTCURLBRAC RIGHTCURLBRAC	{sprintf($$,"%s %s",$1,$2);}
	|	LEFTCURLBRAC STARTHREE RIGHTCURLBRAC	{sprintf($$,"%s %s %s",$1,$2,$3);}
	|	SOP LEFTBRAC Expression RIGHTBRAC SEMICOLON	{sprintf($$,"%s %s %s %s %s",$1,$2,$3,$4,$5);}
	|	Identifier EQ Expression SEMICOLON	{sprintf($$,"%s %s %s %s",$1,$2,$3,$4);}
	|	Identifier LEFTSQBRAC Expression RIGHTSQBRAC EQ Expression SEMICOLON	{sprintf($$,"%s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7);}
	|	IF LEFTBRAC Expression RIGHTBRAC Statement	{sprintf($$,"%s %s %s %s %s",$1,$2,$3,$4,$5);}
	|	IF LEFTBRAC Expression RIGHTBRAC Statement ELSE Statement	{sprintf($$,"%s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7);}
	|	WHILE LEFTBRAC Expression RIGHTBRAC Statement	{sprintf($$,"%s %s %s %s %s",$1,$2,$3,$4,$5);}
	|	Identifier LEFTBRAC RIGHTBRAC SEMICOLON		{if(strcmp(getval($1),"err")!=0){sprintf($$,"%s",getval($1));} else{sprintf($$,"%s %s %s %s",$1,$2,$3,$4);}}
	|	Identifier LEFTBRAC Expression RIGHTBRAC SEMICOLON	{if(strcmp(getval($1),"err")!=0){sprintf($$,"%s",str_replace(getval($1),getparams($1),$3));}else{sprintf($$,"%s %s %s %s %s",$1,$2,$3,$4,$5);}}
	|	Identifier LEFTBRAC Expression STARFIVE RIGHTBRAC SEMICOLON	{
		if(strcmp(getval($1),"err")!=0){
			char* temp=(char*)malloc(strlen($3)+strlen($4)+1);strcpy(temp,$3);strcat(temp,$4);
			char** temptokens;
			temptokens = str_split(temp,',');
			char* param =(char*)malloc(1000);strcpy(param,getparams($1));
			char** paramtokens;
			paramtokens = str_split(param,',');
			char* stmt = (char*)malloc(1000);
			strcpy(stmt,getval($1));
			if (paramtokens)
			    {
				int i;
				for (i = 0; *(paramtokens + i); i++)
				{
				    strcpy(stmt,str_replace(stmt,*(paramtokens + i),*(temptokens + i)));
				    free(*(paramtokens + i));
				    free(*(temptokens + i));
				}
				printf("\n");
				free(paramtokens);
				free(temptokens);
			    }
			sprintf($$,"%s",stmt);
		}
		else{sprintf($$,"%s %s %s %s %s %s",$1,$2,$3,$4,$5,$6);}}
	| 	Type Identifier SEMICOLON	{sprintf($$,"%s %s %s",$1,$2,$3);};

Expression: PrimaryExpression AND PrimaryExpression	{sprintf($$,"%s %s %s",$1,$2,$3);}
	|	PrimaryExpression OR PrimaryExpression	{sprintf($$,"%s %s %s",$1,$2,$3);}
	|	PrimaryExpression NEQ PrimaryExpression	{sprintf($$,"%s %s %s",$1,$2,$3);}
	|	PrimaryExpression LEQ PrimaryExpression	{sprintf($$,"%s %s %s",$1,$2,$3);}
	|	PrimaryExpression PLUS PrimaryExpression	{sprintf($$,"%s %s %s",$1,$2,$3);}
	|	PrimaryExpression MINUS PrimaryExpression	{sprintf($$,"%s %s %s",$1,$2,$3);}
	|	PrimaryExpression MUL PrimaryExpression		{sprintf($$,"%s %s %s",$1,$2,$3);}
	|	PrimaryExpression DIV PrimaryExpression		{sprintf($$,"%s %s %s",$1,$2,$3);}
	|	PrimaryExpression LEFTSQBRAC PrimaryExpression RIGHTSQBRAC	{sprintf($$,"%s %s %s %s",$1,$2,$3,$4);}
	|	PrimaryExpression DLEN		{sprintf($$,"%s %s",$1,$2);}
	|	PrimaryExpression		{sprintf($$,"%s",$1);}
	|	PrimaryExpression DOT Identifier LEFTBRAC RIGHTBRAC	{if(strcmp(getval($3),"err")!=0){sprintf($$,"%s %s %s %s %s",$1,$2,$4,getval($3),$5);}else{sprintf($$,"%s %s %s %s %s",$1,$2,$3,$4,$5);}}
	|	PrimaryExpression DOT Identifier LEFTBRAC Expression RIGHTBRAC	{if(strcmp(getval($3),"err")!=0){sprintf($$,"%s %s %s %s %s",$1,$2,$4,str_replace(getval($3),getparams($3),$5),$6);}else{sprintf($$,"%s %s %s %s %s %s",$1,$2,$3,$4,$5,$6);}}
	|	PrimaryExpression DOT Identifier LEFTBRAC Expression STARFIVE RIGHTBRAC	  {
		if(strcmp(getval($3),"err")!=0){
			char* temp=(char*)malloc(strlen($5)+strlen($6)+1);strcpy(temp,$5);strcat(temp,$6);
			char** temptokens;
			temptokens = str_split(temp,',');
			char* param =(char*)malloc(1000);strcpy(param,getparams($3));
			char** paramtokens;
			paramtokens = str_split(param,',');
			char* stmt = (char*)malloc(1000);
			strcpy(stmt,getval($3));
			if (paramtokens)
			    {
				int i;
				for (i = 0; *(paramtokens + i); i++)
				{
				    strcpy(stmt,str_replace(stmt,*(paramtokens + i),*(temptokens + i)));
				    free(*(paramtokens + i));
				    free(*(temptokens + i));
				}
				printf("\n");
				free(paramtokens);
				free(temptokens);
			    }
			sprintf($$,"%s %s %s %s %s",$1,$2,$4,stmt,$7);
		}
		else{sprintf($$,"%s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7);}}
	|	Identifier LEFTBRAC RIGHTBRAC	{if(strcmp(getval($1),"err")!=0){sprintf($$,"%s %s %s",$2,getval($1),$3);}else{sprintf($$,"%s %s %s",$1,$2,$3);}}
	|	Identifier LEFTBRAC Expression RIGHTBRAC	{if(strcmp(getval($1),"err")!=0){sprintf($$,"%s %s %s",$2,str_replace(getval($1),getparams($1),$3),$4);}else{sprintf($$,"%s %s %s %s",$1,$2,$3,$4);}}
	|	Identifier LEFTBRAC Expression STARFIVE RIGHTBRAC  {
		if(strcmp(getval($1),"err")!=0){
			char* temp=(char*)malloc(strlen($3)+strlen($4)+1);strcpy(temp,$3);strcat(temp,$4);
			char** temptokens;
			temptokens = str_split(temp,',');
			char* param =(char*)malloc(1000);strcpy(param,getparams($1));
			char** paramtokens;
			paramtokens = str_split(param,',');
			char* stmt = (char*)malloc(1000);
			strcpy(stmt,getval($1));
			if (paramtokens)
			    {
				int i;
				for (i = 0; *(paramtokens + i); i++)
				{
				    strcpy(stmt,str_replace(stmt,*(paramtokens + i),*(temptokens + i)));
				    free(*(paramtokens + i));
				    free(*(temptokens + i));
				}
				printf("\n");
				free(paramtokens);
				free(temptokens);
			    }
			sprintf($$,"%s %s %s",$2,stmt,$5);
		}
		else{sprintf($$,"%s %s %s %s %s",$1,$2,$3,$4,$5);}}	;

PrimaryExpression: Integer	{sprintf($$,"%s",$1);}
		|	TR	{sprintf($$,"%s",$1);}
		|	FL	{sprintf($$,"%s",$1);}
		|	Identifier	{sprintf($$,"%s",$1);}
		|	THIS	{sprintf($$,"%s",$1);}
		|	NEW INTTYPE LEFTSQBRAC Expression RIGHTSQBRAC	 {sprintf($$,"%s %s %s %s %s",$1,$2,$3,$4,$5);}
		|	NEW Identifier LEFTBRAC RIGHTBRAC	 {sprintf($$,"%s %s %s %s",$1,$2,$3,$4);}
		|	NOT Expression		 {sprintf($$,"%s %s",$1,$2);}
		|	LEFTBRAC Expression RIGHTBRAC	 {sprintf($$,"%s %s %s",$1,$2,$3);}	;

MacroDefinition: MacroDefExpression	{sprintf($$,"%s",$1);}
		|	MacroDefStatement	{sprintf($$,"%s",$1);}	;

MacroDefStatement: HDEF Identifier LEFTBRAC RIGHTBRAC LEFTCURLBRAC RIGHTCURLBRAC	{store($2,"",""); sprintf($$,"%s %s %s %s %s %s",$1,$2,$3,$4,$5,$6);}
		|	HDEF Identifier LEFTBRAC RIGHTBRAC LEFTCURLBRAC STARTHREE RIGHTCURLBRAC	{store($2,$6,""); sprintf($$,"%s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7);}
		|	HDEF Identifier LEFTBRAC Identifier RIGHTBRAC LEFTCURLBRAC RIGHTCURLBRAC	{store($2,"",$4); sprintf($$,"%s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7);}
		|	HDEF Identifier LEFTBRAC Identifier STARSIX RIGHTBRAC LEFTCURLBRAC RIGHTCURLBRAC	{char* temp=(char*)malloc(strlen($4)+strlen($5)+1);strcpy(temp,$4);strcat(temp,$5);store($2,"",temp);free(temp);sprintf($$,"%s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8);}
		|	HDEF Identifier LEFTBRAC Identifier RIGHTBRAC LEFTCURLBRAC STARTHREE RIGHTCURLBRAC	{store($2,$7,$4); sprintf($$,"%s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8);}
		|	HDEF Identifier LEFTBRAC Identifier STARSIX RIGHTBRAC LEFTCURLBRAC STARTHREE RIGHTCURLBRAC	{char* temp=(char*)malloc(strlen($4)+strlen($5)+1);strcpy(temp,$4);strcat(temp,$5);store($2,$8,temp);free(temp);sprintf($$,"%s %s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8,$9);}	;

MacroDefExpression: HDEF Identifier LEFTBRAC RIGHTBRAC LEFTBRAC Expression RIGHTBRAC	{store($2,$6,""); sprintf($$,"%s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7);}
		|	HDEF Identifier LEFTBRAC Identifier RIGHTBRAC LEFTBRAC Expression RIGHTBRAC	{store($2,$7,$4); sprintf($$,"%s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8);}
		|	HDEF Identifier LEFTBRAC Identifier STARSIX RIGHTBRAC LEFTBRAC Expression RIGHTBRAC	{char* temp=(char*)malloc(strlen($4)+strlen($5)+1);strcpy(temp,$4);strcat(temp,$5);store($2,$8,temp);free(temp);sprintf($$,"%s %s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8,$9);}	;

Identifier: IDENTIFIER		{sprintf($$,"%s",$1);}	;

Integer: INTEGER_LITERAL	{sprintf($$,"%s",$1);}	;

STARONE: Type Identifier SEMICOLON 	{sprintf($$,"%s %s %s",$1,$2,$3);}
	|	Type Identifier SEMICOLON STARONE	{sprintf($$,"%s %s %s %s",$1,$2,$3,$4);}
//	|	Statement	{sprintf($$,"%s",$1);}			;
STARTWO: MethodDeclaration 	{sprintf($$,"%s",$1);}
	|	MethodDeclaration STARTWO	{sprintf($$,"%s %s",$1,$2);}		;
STARTHREE: Statement	{sprintf($$,"%s",$1);}
	|	Statement STARTHREE	{sprintf($$,"%s %s",$1,$2);}	;
STARFOUR: COMMA Type Identifier		{sprintf($$,"%s %s %s",$1,$2,$3);}
	|	COMMA Type Identifier STARFOUR	{sprintf($$,"%s %s %s %s",$1,$2,$3,$4);}	;
STARFIVE: COMMA Expression	{sprintf($$,"%s %s",$1,$2);}
	|	COMMA Expression STARFIVE	{sprintf($$,"%s %s %s",$1,$2,$3);}	;
STARSIX : COMMA Identifier	{sprintf($$,"%s %s",$1,$2);}
	|	COMMA Identifier STARSIX	{sprintf($$,"%s %s %s",$1,$2,$3);}	;
STARSEVEN: MacroDefinition STARSEVEN	{sprintf($$,"%s %s",$1,$2);}
	|	MacroDefinition		{sprintf($$,"%s",$1);}		;
STAREIGHT: TypeDeclaration STAREIGHT	{sprintf($$,"%s %s",$1,$2);}
	|	TypeDeclaration		{sprintf($$,"%s",$1);}		;
 
%%

char *str_replace(char *orig, char *rep, char *with) {
    char *result; // the return string
    char *ins;    // the next insert point
    char *tmp;    // varies
    int len_rep;  // length of rep
    int len_with; // length of with
    int len_front; // distance between rep and end of last rep
    int count;    // number of replacements

    if (!orig)
        return NULL;
    if (!rep)
        rep = "";
    len_rep = strlen(rep);
    if (!with)
        with = "";
    len_with = strlen(with);

    ins = orig;
    for (count = 0; tmp = strstr(ins, rep); ++count) {
        ins = tmp + len_rep;
    }

    // first time through the loop, all the variable are set correctly
    // from here on,
    //    tmp points to the end of the result string
    //    ins points to the next occurrence of rep in orig
    //    orig points to the remainder of orig after "end of rep"
    tmp = result = malloc(strlen(orig) + (len_with - len_rep) * count + 1);

    if (!result)
        return NULL;

    while (count--) {
        ins = strstr(orig, rep);
        len_front = ins - orig;
        tmp = strncpy(tmp, orig, len_front) + len_front;
        tmp = strcpy(tmp, with) + len_with;
        orig += len_front + len_rep; // move to next "end of rep"
    }
    strcpy(tmp, orig);
    return result;
}


char** str_split(char* a_str, const char a_delim)
{
    char** result    = 0;
    size_t count     = 0;
    char* tmp        = a_str;
    char* last_comma = 0;
    char delim[2];
    delim[0] = a_delim;
    delim[1] = 0;

    /* Count how many elements will be extracted. */
    while (*tmp)
    {
        if (a_delim == *tmp)
        {
            count++;
            last_comma = tmp;
        }
        tmp++;
    }

    /* Add space for trailing token. */
    count += last_comma < (a_str + strlen(a_str) - 1);

    /* Add space for terminating null string so caller
       knows where the list of returned strings ends. */
    count++;

    result = malloc(sizeof(char*) * count);

    if (result)
    {
        size_t idx  = 0;
        char* token = strtok(a_str, delim);

        while (token)
        {
            assert(idx < count);
            *(result + idx++) = strdup(token);
            token = strtok(0, delim);
        }
        assert(idx == count - 1);
        *(result + idx) = 0;
    }

    return result;
}


void store(char* id,char* val,char* param){
	//check for duplicates of id
	//printf("entered store\n");
	int index = 0;
	while(ids[index]!=NULL){
		index++;	
	}
	int nid = strlen(id);
	ids[index] = (char*)malloc(nid+1);
	strcpy(ids[index],id);
	int vid = strlen(val);
	vals[index] = (char*)malloc(vid+1);
	strcpy(vals[index],val);
	int pid = strlen(param);
	params[index] = (char*)malloc(pid+1);
	strcpy(params[index],param);
	//printf("index: %d, id: %s, val: %s, param: %s, stored\n",index,ids[index],vals[index],params[index]);
	return;
	
}

char* getval(char* id){
	//printf("entered getval\n");
	int index = 0;
	while(ids[index]!=NULL){
		if(strcmp(ids[index],id)==0){
			//printf("%s id, %s val returning\n",ids[index],vals[index]);
			return vals[index];		
		}
		else{
			index++;		
		}
	}
	char* err = (char*)malloc(4);
	strcpy(err,"err");
	//printf("returning err\n");
	return err;
}

char* getparams(char* id){
	//printf("entered getval\n");
	int index = 0;
	while(ids[index]!=NULL){
		if(strcmp(ids[index],id)==0){
			//printf("%s id, %s val returning\n",ids[index],vals[index]);
			return params[index];		
		}
		else{
			index++;		
		}
	}
	char* err = (char*)malloc(4);
	strcpy(err,"err");
	//printf("returning err\n");
	return err;
}

void yyerror(char* str) { printf("// Failed to parse macrojava code."); }

int yywrap(void) { return 1; }

int main(void) {
	yyparse();	
}