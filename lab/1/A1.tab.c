/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.5.1"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 9 "A1.y"

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
	short int isExpr;
	int nArgs;
	Token* tokenStream;
	struct Macro* next;
} Macro;

Macro* macros = NULL;

int validateMacro(Macro* macro) {

	Macro* m = macros;
	while(m != NULL) {
		if(strcmp(m->name,macro->name)==0 && m->nArgs == macro->nArgs && m->isExpr == macro->isExpr) {
			return 0;
		}
		m=m->next;
	}
	return 1;
}

void registerMacro(char* nameT, /*int nArgsT,*/ Token* argList, Token* tokenStreamT, short int isExpr) {
	//TODO: validate argList, to eliminate/report duplication

	Macro* m = (Macro*) malloc(sizeof(Macro));
	m->name = nameT;
	m->nArgs = 0;
	m->isExpr = isExpr;
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
				t->val = (char*) malloc(10*sizeof(char));
				t->val[0] = '@';
				// t->val[1] = '0'+argpos;
				// t->val[2] = '\0';
				sprintf(t->val+1, "%d", argpos);
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


Macro* matchMacro(char* name, int args, short int isExpr) {
	Macro* m = macros;
	while(m != NULL) {
		if(strcmp(m->name, name)==0 && m->nArgs == args && m->isExpr == isExpr) {
			return m;
		}
		m=m->next;
	}
	return NULL;
}

Token* expandMacro(char* nameT, Token* argList, short int isExpr) {
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
	Macro* m1 = matchMacro(nameT, count, isExpr);
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


#line 329 "A1.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Use api.header.include to #include this header
   instead of duplicating it here.  */
#ifndef YY_YY_A1_TAB_H_INCLUDED
# define YY_YY_A1_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    CLASS = 258,
    PUBLIC = 259,
    STATIC = 260,
    VOID = 261,
    MAIN = 262,
    RETURN = 263,
    SYS_OUT_PRINTLN = 264,
    EXTENDS = 265,
    INT_ARRAY = 266,
    INT = 267,
    BOOLEAN = 268,
    STRING = 269,
    TRUE = 270,
    FALSE = 271,
    THIS = 272,
    NEW = 273,
    IF = 274,
    ELSE = 275,
    WHILE = 276,
    NOT = 277,
    EQTO = 278,
    LEFT_BRAC = 279,
    RIGHT_BRAC = 280,
    LEFT_CURL_BRAC = 281,
    RIGHT_CURL_BRAC = 282,
    LEFT_SQR_BRAC = 283,
    RIGHT_SQR_BRAC = 284,
    DEFEXPR0 = 285,
    DEFEXPR1 = 286,
    DEFEXPR2 = 287,
    DEFEXPR = 288,
    DEFSTMT0 = 289,
    DEFSTMT1 = 290,
    DEFSTMT2 = 291,
    DEFSTMT = 292,
    SEMICOLON = 293,
    NUMBER = 294,
    ID = 295,
    COMMA = 296,
    LENGTH = 297,
    NO_PE = 298,
    AND = 299,
    OR = 300,
    LTE = 301,
    NOTEQ = 302,
    ADD = 303,
    SUB = 304,
    MUL = 305,
    DIV = 306,
    DOT = 307,
    NO_ELSE = 308
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 268 "A1.y"

	int	int_val;
	char* name;
	struct Token* genList;

#line 441 "A1.tab.c"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_A1_TAB_H_INCLUDED  */



#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))

/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && ! defined __ICC && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                            \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  23
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   264

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  54
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  26
/* YYNRULES -- Number of rules.  */
#define YYNRULES  75
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  247

#define YYUNDEFTOK  2
#define YYMAXUTOK   308


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,   311,   311,   320,   347,   350,   356,   366,   379,   382,
     388,   406,   409,   417,   424,   431,   438,   445,   453,   456,
     461,   467,   476,   479,   485,   492,   501,   509,   520,   524,
     533,   543,   552,   564,   567,   572,   577,   605,   612,   619,
     626,   633,   640,   647,   654,   661,   669,   676,   681,   691,
     700,   704,   713,   721,   727,   734,   739,   744,   749,   754,
     760,   763,   769,   773,   777,   791,   801,   812,   824,   838,
     848,   859,   872,   875,   881,   888
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "CLASS", "PUBLIC", "STATIC", "VOID",
  "MAIN", "RETURN", "SYS_OUT_PRINTLN", "EXTENDS", "INT_ARRAY", "INT",
  "BOOLEAN", "STRING", "TRUE", "FALSE", "THIS", "NEW", "IF", "ELSE",
  "WHILE", "NOT", "EQTO", "LEFT_BRAC", "RIGHT_BRAC", "LEFT_CURL_BRAC",
  "RIGHT_CURL_BRAC", "LEFT_SQR_BRAC", "RIGHT_SQR_BRAC", "DEFEXPR0",
  "DEFEXPR1", "DEFEXPR2", "DEFEXPR", "DEFSTMT0", "DEFSTMT1", "DEFSTMT2",
  "DEFSTMT", "SEMICOLON", "NUMBER", "ID", "COMMA", "LENGTH", "NO_PE",
  "AND", "OR", "LTE", "NOTEQ", "ADD", "SUB", "MUL", "DIV", "DOT",
  "NO_ELSE", "$accept", "goal", "MainClass", "TypeDecStar", "TypeDec",
  "MethodStar", "MethodDec", "TypeIdStar", "Type", "ArgList", "ArgListT",
  "StmtStar", "Stmt", "IfStmt", "ExprList", "ExprListT", "Expr", "PE",
  "PES", "MacroDefStar", "MacroDef", "MacroDefStmt", "MacroDefExpr",
  "CommaIdStar", "Number", "Identifier", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_int16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306,   307,   308
};
# endif

#define YYPACT_NINF (-157)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-1)

#define yytable_value_is_error(Yyn) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     205,   -30,   -30,   -30,   -30,   -30,   -30,   -30,   -30,    18,
      41,   205,  -157,  -157,  -157,    35,    43,    45,    47,    52,
      58,    62,    63,  -157,   -30,    85,  -157,    23,   -30,   -30,
     -30,    25,   -30,   -30,   -30,    39,   -30,  -157,    85,    67,
      73,    51,    72,    88,    93,    78,    80,  -157,    14,  -157,
      57,    98,   -30,   -30,   111,   105,   -30,   -30,    26,   -30,
    -157,  -157,  -157,  -157,    24,    57,    57,  -157,   109,   140,
    -157,  -157,   112,    57,   113,   100,   118,   119,   121,   111,
     122,   111,  -157,    61,   111,   123,   116,   134,  -157,   124,
    -157,   -30,  -157,   120,    30,   125,   126,  -157,   130,  -157,
      57,    57,    57,    57,    57,    57,    57,    57,    57,   -25,
      57,   131,   135,   -30,    57,    57,    57,   133,  -157,  -157,
      57,    57,    57,   137,   132,   -30,   156,   136,   141,  -157,
       9,   142,   166,    57,   146,  -157,   143,  -157,  -157,  -157,
    -157,  -157,  -157,  -157,  -157,  -157,  -157,   149,   150,  -157,
     152,  -157,    57,   153,   157,   158,   170,  -157,   159,   173,
     145,  -157,   111,   153,   171,  -157,  -157,    30,   -30,  -157,
    -157,   172,  -157,  -157,    57,  -157,    57,   174,   -30,   175,
     164,   111,   111,  -157,   165,   183,   180,   185,   184,   187,
     188,  -157,   199,  -157,  -157,   153,   203,  -157,   208,  -157,
    -157,    57,  -157,   206,   215,  -157,     9,  -157,  -157,    57,
     111,   195,   111,   216,   -30,   218,  -157,   220,  -157,  -157,
     219,   221,   207,   223,  -157,  -157,   -30,     9,  -157,   222,
    -157,   114,   225,   244,    61,   245,    57,   229,   217,    57,
     230,   231,  -157,   224,   232,   233,  -157
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_int8 yydefact[] =
{
      60,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    60,    63,    62,    75,     0,     0,     0,     0,     0,
       0,     0,     0,     1,     0,     4,    61,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     4,     0,
       0,     0,     0,     0,     0,     0,     0,    11,     0,     5,
       0,     0,     0,     0,    22,     0,     0,     0,     0,     0,
      11,    56,    57,    59,     0,     0,     0,    74,     0,    47,
      50,    55,    58,     0,     0,     0,     0,     0,     0,    22,
       0,    22,    28,     0,    22,     0,     0,     0,    14,    13,
      16,     0,    17,     0,     8,     0,     0,    53,     0,    69,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      33,     0,     0,     0,     0,     0,     0,     0,    65,    23,
       0,    33,     0,     0,     0,     0,     0,     0,     0,    11,
       0,     0,     8,     0,     0,    54,     0,    58,    37,    38,
      40,    39,    41,    42,    43,    44,    46,     0,     0,    34,
      35,    70,     0,    72,     0,     0,     0,    24,     0,     0,
       0,    66,    22,    72,     0,    15,    12,     8,     0,     6,
       9,     0,    52,    45,    33,    49,     0,     0,     0,     0,
       0,     0,     0,    26,     0,     0,     0,     0,     0,     0,
       0,    51,     0,    36,    71,    72,     0,    25,    31,    29,
      30,     0,    67,     0,     0,     7,    18,    48,    73,     0,
       0,     0,    22,     0,     0,     0,    19,     0,    32,    27,
       0,     0,    20,     0,    68,    64,     0,     0,    11,     0,
      21,    22,     0,     0,    17,     0,     0,     0,     0,     0,
       0,     0,    10,     0,     0,     0,     3
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -157,  -157,  -157,   226,  -157,  -120,  -157,   -52,  -111,  -157,
      31,   -68,  -156,  -157,  -112,    87,    -5,   115,  -157,   250,
    -157,  -157,  -157,  -149,  -157,    -1
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     9,    25,    37,    38,   131,   132,    58,    91,   215,
     216,    80,    81,    82,   148,   149,   150,    69,    70,    10,
      11,    12,    13,   179,    71,    72
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_uint8 yytable[] =
{
      15,    16,    17,    18,    19,    20,    21,    22,    94,   159,
      14,   117,   170,   119,   187,    14,   123,   146,    23,   168,
      88,    89,    90,    35,    59,   198,   199,    40,    41,    42,
      87,    44,    45,    46,   130,    48,    95,    88,    89,    90,
      60,    88,    89,    90,    24,    68,   208,   189,    39,    14,
      43,    74,    75,    83,   218,    85,    86,    92,    93,    27,
      97,    98,   192,    96,    14,    47,    14,    28,   111,    29,
      14,    30,    61,    62,    63,    64,    31,   167,    83,    65,
      83,    66,    32,    83,   120,   121,    33,    34,    36,   122,
     128,    50,    52,    92,   186,   214,    67,    14,    51,   137,
     137,   137,   137,   137,   137,   137,   137,   137,   147,   154,
     155,   156,   153,    53,    54,   158,   214,   160,    55,    56,
      76,    57,    73,    76,   163,    88,    89,    90,   171,    92,
      77,    84,    78,    77,    99,    78,   110,    79,   112,   126,
      79,   113,   114,   115,   220,   116,   129,   177,   124,   118,
     134,    14,   127,   133,    14,   135,   151,   125,   162,   152,
     157,    83,   164,   233,   161,   165,    92,   190,   100,   169,
     130,   172,   173,   174,   185,   175,   231,   195,   188,   166,
      83,    83,   180,   181,   101,   102,   103,   104,   105,   106,
     107,   108,   109,   176,   178,   182,   211,   183,   184,   194,
     196,   191,   197,   200,   217,    92,   201,   202,   204,    83,
     203,    83,   206,   222,   205,   136,   138,   139,   140,   141,
     142,   143,   144,   145,   207,   229,    92,   209,   210,   213,
     234,   238,   212,   219,   241,     1,     2,     3,     4,     5,
       6,     7,     8,   223,   221,   224,   225,   232,   227,   228,
     226,   235,   236,   239,   237,   240,   243,   242,   230,   245,
     246,    26,   244,   193,    49
};

static const yytype_uint8 yycheck[] =
{
       1,     2,     3,     4,     5,     6,     7,     8,    60,   121,
      40,    79,   132,    81,   163,    40,    84,    42,     0,   130,
      11,    12,    13,    24,    10,   181,   182,    28,    29,    30,
       4,    32,    33,    34,     4,    36,    12,    11,    12,    13,
      26,    11,    12,    13,     3,    50,   195,   167,    25,    40,
      25,    52,    53,    54,   210,    56,    57,    58,    59,    24,
      65,    66,   174,    64,    40,    26,    40,    24,    73,    24,
      40,    24,    15,    16,    17,    18,    24,   129,    79,    22,
      81,    24,    24,    84,    23,    24,    24,    24,     3,    28,
      91,    24,    41,    94,   162,   206,    39,    40,    25,   100,
     101,   102,   103,   104,   105,   106,   107,   108,   109,   114,
     115,   116,   113,    41,    26,   120,   227,   122,    25,    41,
       9,    41,    24,     9,   125,    11,    12,    13,   133,   130,
      19,    26,    21,    19,    25,    21,    24,    26,    25,     5,
      26,    41,    24,    24,   212,    24,    26,   152,    25,    27,
      24,    40,    28,    28,    40,    25,    25,    41,    26,    24,
      27,   162,     6,   231,    27,    29,   167,   168,    28,    27,
       4,    25,    29,    24,    29,    25,   228,   178,     7,    38,
     181,   182,    25,    25,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    41,    41,    25,   201,    38,    25,    25,
      25,    29,    38,    38,   209,   206,    23,    27,    24,   210,
      25,   212,    24,   214,    27,   100,   101,   102,   103,   104,
     105,   106,   107,   108,    25,   226,   227,    24,    20,    14,
     231,   236,    26,    38,   239,    30,    31,    32,    33,    34,
      35,    36,    37,    25,    28,    25,    27,    25,    41,    26,
      29,    26,     8,    24,     9,    38,    25,    27,   227,    27,
      27,    11,    38,   176,    38
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,    30,    31,    32,    33,    34,    35,    36,    37,    55,
      73,    74,    75,    76,    40,    79,    79,    79,    79,    79,
      79,    79,    79,     0,     3,    56,    73,    24,    24,    24,
      24,    24,    24,    24,    24,    79,     3,    57,    58,    25,
      79,    79,    79,    25,    79,    79,    79,    26,    79,    57,
      24,    25,    41,    41,    26,    25,    41,    41,    61,    10,
      26,    15,    16,    17,    18,    22,    24,    39,    70,    71,
      72,    78,    79,    24,    79,    79,     9,    19,    21,    26,
      65,    66,    67,    79,    26,    79,    79,     4,    11,    12,
      13,    62,    79,    79,    61,    12,    79,    70,    70,    25,
      28,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      24,    70,    25,    41,    24,    24,    24,    65,    27,    65,
      23,    24,    28,    65,    25,    41,     5,    28,    79,    26,
       4,    59,    60,    28,    24,    25,    71,    79,    71,    71,
      71,    71,    71,    71,    71,    71,    42,    79,    68,    69,
      70,    25,    24,    79,    70,    70,    70,    27,    70,    68,
      70,    27,    26,    79,     6,    29,    38,    61,    62,    27,
      59,    70,    25,    29,    24,    25,    41,    70,    41,    77,
      25,    25,    25,    38,    25,    29,    65,    77,     7,    59,
      79,    29,    68,    69,    25,    79,    25,    38,    66,    66,
      38,    23,    27,    25,    24,    27,    24,    25,    77,    24,
      20,    70,    26,    14,    62,    63,    64,    70,    66,    38,
      65,    28,    79,    25,    25,    27,    29,    41,    26,    79,
      64,    61,    25,    65,    79,    26,     8,     9,    70,    24,
      38,    70,    27,    25,    38,    27,    27
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_int8 yyr1[] =
{
       0,    54,    55,    56,    57,    57,    58,    58,    59,    59,
      60,    61,    61,    62,    62,    62,    62,    62,    63,    63,
      64,    64,    65,    65,    66,    66,    66,    66,    66,    66,
      66,    67,    67,    68,    68,    69,    69,    70,    70,    70,
      70,    70,    70,    70,    70,    70,    70,    70,    70,    70,
      71,    71,    71,    71,    71,    72,    72,    72,    72,    72,
      73,    73,    74,    74,    75,    75,    75,    75,    76,    76,
      76,    76,    77,    77,    78,    79
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     3,    22,     0,     2,     6,     8,     0,     2,
      13,     0,     4,     1,     1,     3,     1,     1,     0,     1,
       2,     4,     0,     2,     3,     5,     4,     7,     1,     5,
       5,     5,     7,     0,     1,     1,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     4,     3,     1,     6,     4,
       1,     5,     4,     2,     3,     1,     1,     1,     1,     1,
       0,     2,     1,     1,    13,     7,     8,    10,    13,     7,
       8,    10,     0,     3,     1,     1
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YYUSE (yyoutput);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyo, yytoknum[yytype], *yyvaluep);
# endif
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyo, yytype, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[+yyssp[yyi + 1 - yynrhs]],
                       &yyvsp[(yyi + 1) - (yynrhs)]
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen(S) (YY_CAST (YYPTRDIFF_T, strlen (S)))
#  else
/* Return the length of YYSTR.  */
static YYPTRDIFF_T
yystrlen (const char *yystr)
{
  YYPTRDIFF_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYPTRDIFF_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYPTRDIFF_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            else
              goto append;

          append:
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (yyres)
    return yystpcpy (yyres, yystr) - yyres;
  else
    return yystrlen (yystr);
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYPTRDIFF_T *yymsg_alloc, char **yymsg,
                yy_state_t *yyssp, int yytoken)
{
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat: reported tokens (one for the "unexpected",
     one per "expected"). */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Actual size of YYARG. */
  int yycount = 0;
  /* Cumulated lengths of YYARG.  */
  YYPTRDIFF_T yysize = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[+*yyssp];
      YYPTRDIFF_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
      yysize = yysize0;
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYPTRDIFF_T yysize1
                    = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM)
                    yysize = yysize1;
                  else
                    return 2;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
    default: /* Avoid compiler warnings. */
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    /* Don't count the "%s"s in the final size, but reserve room for
       the terminator.  */
    YYPTRDIFF_T yysize1 = yysize + (yystrlen (yyformat) - 2 * yycount) + 1;
    if (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM)
      yysize = yysize1;
    else
      return 2;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          ++yyp;
          ++yyformat;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss;
    yy_state_t *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYPTRDIFF_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYPTRDIFF_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    goto yyexhaustedlab;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
# undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2:
#line 312 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = cat((yyval.genList), (yyvsp[-2].genList));
	(yyval.genList) = cat((yyval.genList), (yyvsp[-1].genList));
	(yyval.genList) = cat((yyval.genList), (yyvsp[0].genList));
	printall((yyval.genList));
	printf("\n");
}
#line 1780 "A1.tab.c"
    break;

  case 3:
#line 321 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = insert((yyval.genList), "class");
	(yyval.genList) = insert((yyval.genList), (yyvsp[-20].name));
	(yyval.genList) = insert((yyval.genList), "{");
	(yyval.genList) = cat((yyval.genList), (yyvsp[-18].genList));
	(yyval.genList) = insert((yyval.genList), "public");
	(yyval.genList) = insert((yyval.genList), "static");
	(yyval.genList) = insert((yyval.genList), "void"); 
	(yyval.genList) = insert((yyval.genList), "main");
	(yyval.genList) = insert((yyval.genList), "(");
	(yyval.genList) = insert((yyval.genList), "String");
	(yyval.genList) = insert((yyval.genList), "[");
	(yyval.genList) = insert((yyval.genList), "]");
	(yyval.genList) = insert((yyval.genList), (yyvsp[-9].name));
	(yyval.genList) = insert((yyval.genList), ")");
	(yyval.genList) = insert((yyval.genList), "{");
	(yyval.genList) = insert((yyval.genList), "System.out.println");
	(yyval.genList) = insert((yyval.genList), "(");
	(yyval.genList) = cat((yyval.genList), (yyvsp[-4].genList));
	(yyval.genList) = insert((yyval.genList), ")");
	(yyval.genList) = insert((yyval.genList), ";");
	(yyval.genList) = insert((yyval.genList), "}");
	(yyval.genList) = insert((yyval.genList), "}");	
}
#line 1810 "A1.tab.c"
    break;

  case 4:
#line 347 "A1.y"
        {
	(yyval.genList) = NULL;
}
#line 1818 "A1.tab.c"
    break;

  case 5:
#line 351 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = cat((yyval.genList), (yyvsp[-1].genList));
	(yyval.genList) = cat((yyval.genList), (yyvsp[0].genList));
}
#line 1828 "A1.tab.c"
    break;

  case 6:
#line 357 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = insert((yyval.genList), "class");
	(yyval.genList) = insert((yyval.genList), (yyvsp[-4].name));
	(yyval.genList) = insert((yyval.genList), "{");
	(yyval.genList) = cat((yyval.genList), (yyvsp[-2].genList));
	(yyval.genList) = cat((yyval.genList), (yyvsp[-1].genList));
	(yyval.genList) = insert((yyval.genList), "}");
}
#line 1842 "A1.tab.c"
    break;

  case 7:
#line 367 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = insert((yyval.genList), "class");
	(yyval.genList) = insert((yyval.genList), (yyvsp[-6].name));
	(yyval.genList) = insert((yyval.genList), "extends");
	(yyval.genList) = insert((yyval.genList), (yyvsp[-4].name));
	(yyval.genList) = insert((yyval.genList), "{");
	(yyval.genList) = cat((yyval.genList), (yyvsp[-2].genList));
	(yyval.genList) = cat((yyval.genList), (yyvsp[-1].genList));
	(yyval.genList) = insert((yyval.genList), "}");
}
#line 1858 "A1.tab.c"
    break;

  case 8:
#line 379 "A1.y"
        {
	(yyval.genList) = NULL;
}
#line 1866 "A1.tab.c"
    break;

  case 9:
#line 383 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = cat((yyval.genList), (yyvsp[-1].genList));
	(yyval.genList) = cat((yyval.genList), (yyvsp[0].genList));
}
#line 1876 "A1.tab.c"
    break;

  case 10:
#line 389 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = insert((yyval.genList), "public");
	(yyval.genList) = insert((yyval.genList), (yyvsp[-11].name));
	(yyval.genList) = insert((yyval.genList), (yyvsp[-10].name));
	(yyval.genList) = insert((yyval.genList), "(");
	(yyval.genList) = cat((yyval.genList), (yyvsp[-8].genList));
	(yyval.genList) = insert((yyval.genList), ")");
	(yyval.genList) = insert((yyval.genList), "{");
	(yyval.genList) = cat((yyval.genList), (yyvsp[-5].genList));
	(yyval.genList) = cat((yyval.genList), (yyvsp[-4].genList));
	(yyval.genList) = insert((yyval.genList), "return");
	(yyval.genList) = cat((yyval.genList), (yyvsp[-2].genList));
	(yyval.genList) = insert((yyval.genList), ";");
	(yyval.genList) = insert((yyval.genList), "}");
}
#line 1897 "A1.tab.c"
    break;

  case 11:
#line 406 "A1.y"
        {
	(yyval.genList) = NULL;
}
#line 1905 "A1.tab.c"
    break;

  case 12:
#line 410 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = cat((yyval.genList), (yyvsp[-3].genList));
	(yyval.genList) = insert((yyval.genList), (yyvsp[-2].name));
	(yyval.genList) = insert((yyval.genList), (yyvsp[-1].name));
	(yyval.genList) = insert((yyval.genList), ";");
}
#line 1917 "A1.tab.c"
    break;

  case 13:
#line 418 "A1.y"
{
	int len = strlen("int");
	(yyval.name) = (char*) malloc((len + 1) * sizeof(char));
	(yyval.name)[0] = '\0';
	strcat((yyval.name),"int");
}
#line 1928 "A1.tab.c"
    break;

  case 14:
#line 425 "A1.y"
{
	int len = strlen("int[]");
	(yyval.name) = (char*) malloc((len + 1) * sizeof(char));
	(yyval.name)[0] = '\0';
	strcat((yyval.name),"int[]");
}
#line 1939 "A1.tab.c"
    break;

  case 15:
#line 432 "A1.y"
{
	int len = strlen("int[]");
	(yyval.name) = (char*) malloc((len + 1) * sizeof(char));
	(yyval.name)[0] = '\0';
	strcat((yyval.name),"int[]");
}
#line 1950 "A1.tab.c"
    break;

  case 16:
#line 439 "A1.y"
{
	int len = strlen("boolean");
	(yyval.name) = (char*) malloc((len + 1) * sizeof(char));
	(yyval.name)[0] = '\0';
	strcat((yyval.name),"boolean");
}
#line 1961 "A1.tab.c"
    break;

  case 17:
#line 446 "A1.y"
{
	int len = strlen((yyvsp[0].name));
	(yyval.name) = (char*) malloc((len + 1) * sizeof(char));
	(yyval.name)[0] = '\0';
	strcat((yyval.name),(yyvsp[0].name));
}
#line 1972 "A1.tab.c"
    break;

  case 18:
#line 453 "A1.y"
        {
	(yyval.genList) = NULL;
}
#line 1980 "A1.tab.c"
    break;

  case 19:
#line 457 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = cat((yyval.genList), (yyvsp[0].genList));
}
#line 1989 "A1.tab.c"
    break;

  case 20:
#line 462 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = insert((yyval.genList), (yyvsp[-1].name));
	(yyval.genList) = insert((yyval.genList), (yyvsp[0].name));
}
#line 1999 "A1.tab.c"
    break;

  case 21:
#line 468 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = insert((yyval.genList), (yyvsp[-3].name));
	(yyval.genList) = insert((yyval.genList), (yyvsp[-2].name));
	(yyval.genList) = insert((yyval.genList), ",");
	(yyval.genList) = cat((yyval.genList), (yyvsp[0].genList));
}
#line 2011 "A1.tab.c"
    break;

  case 22:
#line 476 "A1.y"
        {
	(yyval.genList) = NULL;
}
#line 2019 "A1.tab.c"
    break;

  case 23:
#line 480 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = cat((yyval.genList), (yyvsp[-1].genList));
	(yyval.genList) = cat((yyval.genList), (yyvsp[0].genList));
}
#line 2029 "A1.tab.c"
    break;

  case 24:
#line 486 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = insert((yyval.genList), "{");
	(yyval.genList) = cat((yyval.genList), (yyvsp[-1].genList));
	(yyval.genList) = insert((yyval.genList), "}");
}
#line 2040 "A1.tab.c"
    break;

  case 25:
#line 493 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = insert((yyval.genList), "System.out.println");
	(yyval.genList) = insert((yyval.genList), "(");
	(yyval.genList) = cat((yyval.genList), (yyvsp[-2].genList));
	(yyval.genList) = insert((yyval.genList), ")");
	(yyval.genList) = insert((yyval.genList), ";");
}
#line 2053 "A1.tab.c"
    break;

  case 26:
#line 502 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = insert((yyval.genList), (yyvsp[-3].name));
	(yyval.genList) = insert((yyval.genList), "=");
	(yyval.genList) = cat((yyval.genList), (yyvsp[-1].genList));
	(yyval.genList) = insert((yyval.genList), ";");
}
#line 2065 "A1.tab.c"
    break;

  case 27:
#line 510 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = insert((yyval.genList), (yyvsp[-6].name));
	(yyval.genList) = insert((yyval.genList), "[");
	(yyval.genList) = cat((yyval.genList), (yyvsp[-4].genList));
	(yyval.genList) = insert((yyval.genList), "]");
	(yyval.genList) = insert((yyval.genList), "=");
	(yyval.genList) = cat((yyval.genList), (yyvsp[-1].genList));
	(yyval.genList) = insert((yyval.genList), ";");
}
#line 2080 "A1.tab.c"
    break;

  case 28:
#line 521 "A1.y"
{
	(yyval.genList) = (yyvsp[0].genList);
}
#line 2088 "A1.tab.c"
    break;

  case 29:
#line 525 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = insert((yyval.genList), "while");
	(yyval.genList) = insert((yyval.genList), "(");
	(yyval.genList) = cat((yyval.genList), (yyvsp[-2].genList));
	(yyval.genList) = insert((yyval.genList), ")");
	(yyval.genList) = cat((yyval.genList), (yyvsp[0].genList));
}
#line 2101 "A1.tab.c"
    break;

  case 30:
#line 534 "A1.y"
{
	(yyval.genList) = expandMacro((yyvsp[-4].name), (yyvsp[-2].genList), 0);
	// $$ = insert($$, $1);
	// $$ = insert($$, "(");
	// $$ = cat($$, $3);
	// $$ = insert($$, ")");
	// $$ = insert($$, ";");

}
#line 2115 "A1.tab.c"
    break;

  case 31:
#line 544 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = insert((yyval.genList), "if");
	(yyval.genList) = insert((yyval.genList), "(");
	(yyval.genList) = cat((yyval.genList), (yyvsp[-2].genList));
	(yyval.genList) = insert((yyval.genList), ")");
	(yyval.genList) = cat((yyval.genList), (yyvsp[0].genList));
}
#line 2128 "A1.tab.c"
    break;

  case 32:
#line 553 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = insert((yyval.genList), "if");
	(yyval.genList) = insert((yyval.genList), "(");
	(yyval.genList) = cat((yyval.genList), (yyvsp[-4].genList));
	(yyval.genList) = insert((yyval.genList), ")");
	(yyval.genList) = cat((yyval.genList), (yyvsp[-2].genList));
	(yyval.genList) = insert((yyval.genList), "else");
	(yyval.genList) = cat((yyval.genList), (yyvsp[0].genList));
}
#line 2143 "A1.tab.c"
    break;

  case 33:
#line 564 "A1.y"
        {
	(yyval.genList) = NULL;
}
#line 2151 "A1.tab.c"
    break;

  case 34:
#line 568 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = cat((yyval.genList), (yyvsp[0].genList));
}
#line 2160 "A1.tab.c"
    break;

  case 35:
#line 573 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = cat((yyval.genList), (yyvsp[0].genList));
}
#line 2169 "A1.tab.c"
    break;

  case 36:
#line 578 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = cat((yyval.genList), (yyvsp[-2].genList));
	(yyval.genList) = insert((yyval.genList), ",");
	(yyval.genList) = cat((yyval.genList), (yyvsp[0].genList));
}
#line 2180 "A1.tab.c"
    break;

  case 37:
#line 606 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = cat((yyval.genList), (yyvsp[-2].genList));
	(yyval.genList) = insert((yyval.genList), "&&");
	(yyval.genList) = cat((yyval.genList), (yyvsp[0].genList));
}
#line 2191 "A1.tab.c"
    break;

  case 38:
#line 613 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = cat((yyval.genList), (yyvsp[-2].genList));
	(yyval.genList) = insert((yyval.genList), "||");
	(yyval.genList) = cat((yyval.genList), (yyvsp[0].genList));
}
#line 2202 "A1.tab.c"
    break;

  case 39:
#line 620 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = cat((yyval.genList), (yyvsp[-2].genList));
	(yyval.genList) = insert((yyval.genList), "!=");
	(yyval.genList) = cat((yyval.genList), (yyvsp[0].genList));
}
#line 2213 "A1.tab.c"
    break;

  case 40:
#line 627 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = cat((yyval.genList), (yyvsp[-2].genList));
	(yyval.genList) = insert((yyval.genList), "<=");
	(yyval.genList) = cat((yyval.genList), (yyvsp[0].genList));
}
#line 2224 "A1.tab.c"
    break;

  case 41:
#line 634 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = cat((yyval.genList), (yyvsp[-2].genList));
	(yyval.genList) = insert((yyval.genList), "+");
	(yyval.genList) = cat((yyval.genList), (yyvsp[0].genList));
}
#line 2235 "A1.tab.c"
    break;

  case 42:
#line 641 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = cat((yyval.genList), (yyvsp[-2].genList));
	(yyval.genList) = insert((yyval.genList), "-");
	(yyval.genList) = cat((yyval.genList), (yyvsp[0].genList));
}
#line 2246 "A1.tab.c"
    break;

  case 43:
#line 648 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = cat((yyval.genList), (yyvsp[-2].genList));
	(yyval.genList) = insert((yyval.genList), "*");
	(yyval.genList) = cat((yyval.genList), (yyvsp[0].genList));
}
#line 2257 "A1.tab.c"
    break;

  case 44:
#line 655 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = cat((yyval.genList), (yyvsp[-2].genList));
	(yyval.genList) = insert((yyval.genList), "/");
	(yyval.genList) = cat((yyval.genList), (yyvsp[0].genList));
}
#line 2268 "A1.tab.c"
    break;

  case 45:
#line 662 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = cat((yyval.genList), (yyvsp[-3].genList));
	(yyval.genList) = insert((yyval.genList), "[");
	(yyval.genList) = cat((yyval.genList), (yyvsp[-1].genList));
	(yyval.genList) = insert((yyval.genList), "]");
}
#line 2280 "A1.tab.c"
    break;

  case 46:
#line 670 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = cat((yyval.genList), (yyvsp[-2].genList));
	(yyval.genList) = insert((yyval.genList), ".");
	(yyval.genList) = insert((yyval.genList), "length");
}
#line 2291 "A1.tab.c"
    break;

  case 47:
#line 677 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = cat((yyval.genList), (yyvsp[0].genList));
}
#line 2300 "A1.tab.c"
    break;

  case 48:
#line 682 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = cat((yyval.genList), (yyvsp[-5].genList));
	(yyval.genList) = insert((yyval.genList), ".");
	(yyval.genList) = insert((yyval.genList), (yyvsp[-3].name));
	(yyval.genList) = insert((yyval.genList), "(");
	(yyval.genList) = cat((yyval.genList), (yyvsp[-1].genList));
	(yyval.genList) = insert((yyval.genList), ")");
}
#line 2314 "A1.tab.c"
    break;

  case 49:
#line 692 "A1.y"
{
	(yyval.genList) = expandMacro((yyvsp[-3].name), (yyvsp[-1].genList), 1);
	// $$ = NULL;
	// $$ = insert($$, $1);
	// $$ = insert($$, "(");
	// $$ = cat($$, $3);
	// $$ = insert($$, ")");
}
#line 2327 "A1.tab.c"
    break;

  case 50:
#line 701 "A1.y"
{
	(yyval.genList) = (yyvsp[0].genList);
}
#line 2335 "A1.tab.c"
    break;

  case 51:
#line 705 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = insert((yyval.genList), "new");
	(yyval.genList) = insert((yyval.genList), "int");
	(yyval.genList) = insert((yyval.genList), "[");
	(yyval.genList) = cat((yyval.genList), (yyvsp[-1].genList));
	(yyval.genList) = insert((yyval.genList), "]");
}
#line 2348 "A1.tab.c"
    break;

  case 52:
#line 714 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = insert((yyval.genList), "new");
	(yyval.genList) = insert((yyval.genList), (yyvsp[-2].name));
	(yyval.genList) = insert((yyval.genList), "(");
	(yyval.genList) = insert((yyval.genList), ")");
}
#line 2360 "A1.tab.c"
    break;

  case 53:
#line 722 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = insert((yyval.genList), "!");
	(yyval.genList) = cat((yyval.genList), (yyvsp[0].genList));
}
#line 2370 "A1.tab.c"
    break;

  case 54:
#line 728 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = insert((yyval.genList), "(");
	(yyval.genList) = cat((yyval.genList), (yyvsp[-1].genList));
	(yyval.genList) = insert((yyval.genList), ")");
}
#line 2381 "A1.tab.c"
    break;

  case 55:
#line 735 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = insert((yyval.genList), (yyvsp[0].name));
}
#line 2390 "A1.tab.c"
    break;

  case 56:
#line 740 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = insert((yyval.genList), "true");
}
#line 2399 "A1.tab.c"
    break;

  case 57:
#line 745 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = insert((yyval.genList), "false");
}
#line 2408 "A1.tab.c"
    break;

  case 58:
#line 750 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = insert((yyval.genList), (yyvsp[0].name));
}
#line 2417 "A1.tab.c"
    break;

  case 59:
#line 755 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = insert((yyval.genList), "this");
}
#line 2426 "A1.tab.c"
    break;

  case 60:
#line 760 "A1.y"
        {
	(yyval.genList) = NULL;
}
#line 2434 "A1.tab.c"
    break;

  case 61:
#line 764 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = cat((yyval.genList), (yyvsp[-1].genList));
	(yyval.genList) = cat((yyval.genList), (yyvsp[0].genList));
}
#line 2444 "A1.tab.c"
    break;

  case 62:
#line 770 "A1.y"
{
	(yyval.genList) = (yyvsp[0].genList);
}
#line 2452 "A1.tab.c"
    break;

  case 63:
#line 774 "A1.y"
{
	(yyval.genList) = (yyvsp[0].genList);
}
#line 2460 "A1.tab.c"
    break;

  case 64:
#line 778 "A1.y"
{
	(yyval.genList) = NULL;
	Token* argList = NULL;
	argList = insert(argList, (yyvsp[-9].name));
	argList = insert(argList, (yyvsp[-7].name));
	argList = insert(argList, (yyvsp[-5].name));
	argList = cat(argList, (yyvsp[-4].genList));
	Token* tokenStream = NULL;
	tokenStream = insert(tokenStream, "{");
	tokenStream = cat(tokenStream, (yyvsp[-1].genList));
	tokenStream = insert(tokenStream, "}");
	registerMacro((yyvsp[-11].name), argList, tokenStream, 0);
}
#line 2478 "A1.tab.c"
    break;

  case 65:
#line 792 "A1.y"
{
	(yyval.genList) = NULL;
	Token* argList = NULL;
	Token* tokenStream = NULL;
	tokenStream = insert(tokenStream, "{");
	tokenStream = cat(tokenStream, (yyvsp[-1].genList));
	tokenStream = insert(tokenStream, "}");
	registerMacro((yyvsp[-5].name), argList, tokenStream, 0);
}
#line 2492 "A1.tab.c"
    break;

  case 66:
#line 802 "A1.y"
{
	(yyval.genList) = NULL;
	Token* argList = NULL;
	argList = insert(argList, (yyvsp[-4].name));
	Token* tokenStream = NULL;
	tokenStream = insert(tokenStream, "{");
	tokenStream = cat(tokenStream, (yyvsp[-1].genList));
	tokenStream = insert(tokenStream, "}");
	registerMacro((yyvsp[-6].name), argList, tokenStream, 0);
}
#line 2507 "A1.tab.c"
    break;

  case 67:
#line 813 "A1.y"
{
	(yyval.genList) = NULL;
	Token* argList = NULL;
	argList = insert(argList, (yyvsp[-6].name));
	argList = insert(argList, (yyvsp[-4].name));
	Token* tokenStream = NULL;
	tokenStream = insert(tokenStream, "{");
	tokenStream = cat(tokenStream, (yyvsp[-1].genList));
	tokenStream = insert(tokenStream, "}");
	registerMacro((yyvsp[-8].name), argList, tokenStream, 0);
}
#line 2523 "A1.tab.c"
    break;

  case 68:
#line 825 "A1.y"
{
	(yyval.genList) = NULL;
	Token* argList = NULL;
	argList = insert(argList, (yyvsp[-9].name));
	argList = insert(argList, (yyvsp[-7].name));
	argList = insert(argList, (yyvsp[-5].name));
	argList = cat(argList, (yyvsp[-4].genList));
	Token* tokenStream = NULL;
	tokenStream = insert(tokenStream, "(");
	tokenStream = cat(tokenStream, (yyvsp[-1].genList));
	tokenStream = insert(tokenStream, ")");
	registerMacro((yyvsp[-11].name), argList, tokenStream, 1);
}
#line 2541 "A1.tab.c"
    break;

  case 69:
#line 839 "A1.y"
{
	(yyval.genList) = NULL;
	Token* argList = NULL;
	Token* tokenStream = NULL;
	tokenStream = insert(tokenStream, "(");
	tokenStream = cat(tokenStream, (yyvsp[-1].genList));
	tokenStream = insert(tokenStream, ")");
	registerMacro((yyvsp[-5].name), argList, tokenStream, 1);
}
#line 2555 "A1.tab.c"
    break;

  case 70:
#line 849 "A1.y"
{
	(yyval.genList) = NULL;
	Token* argList = NULL;
	argList = insert(argList, (yyvsp[-4].name));
	Token* tokenStream = NULL;
	tokenStream = insert(tokenStream, "(");
	tokenStream = cat(tokenStream, (yyvsp[-1].genList));
	tokenStream = insert(tokenStream, ")");
	registerMacro((yyvsp[-6].name), argList, tokenStream, 1);
}
#line 2570 "A1.tab.c"
    break;

  case 71:
#line 860 "A1.y"
{
	(yyval.genList) = NULL;
	Token* argList = NULL;
	argList = insert(argList, (yyvsp[-6].name));
	argList = insert(argList, (yyvsp[-4].name));
	Token* tokenStream = NULL;
	tokenStream = insert(tokenStream, "(");
	tokenStream = cat(tokenStream, (yyvsp[-1].genList));
	tokenStream = insert(tokenStream, ")");
	registerMacro((yyvsp[-8].name), argList, tokenStream, 1);
}
#line 2586 "A1.tab.c"
    break;

  case 72:
#line 872 "A1.y"
        {
	(yyval.genList) = NULL;
}
#line 2594 "A1.tab.c"
    break;

  case 73:
#line 876 "A1.y"
{
	(yyval.genList) = NULL;
	(yyval.genList) = insert((yyval.genList), (yyvsp[-1].name));
	(yyval.genList) = cat((yyval.genList), (yyvsp[0].genList));
}
#line 2604 "A1.tab.c"
    break;

  case 74:
#line 882 "A1.y"
{
	int len = strlen((yyvsp[0].name));
	(yyval.name) = (char*) malloc((len + 1) * sizeof(char));
	(yyval.name)[0] = '\0';
	strcat((yyval.name),(yyvsp[0].name));
}
#line 2615 "A1.tab.c"
    break;

  case 75:
#line 889 "A1.y"
{
	int len = strlen((yyvsp[0].name));
	(yyval.name) = (char*) malloc((len + 1) * sizeof(char));
	(yyval.name)[0] = '\0';
	strcat((yyval.name),(yyvsp[0].name));
}
#line 2626 "A1.tab.c"
    break;


#line 2630 "A1.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = YY_CAST (char *, YYSTACK_ALLOC (YY_CAST (YYSIZE_T, yymsg_alloc)));
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;


#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif


/*-----------------------------------------------------.
| yyreturn -- parsing is finished, return the result.  |
`-----------------------------------------------------*/
yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[+*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 898 "A1.y"

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
