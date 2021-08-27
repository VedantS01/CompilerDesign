/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

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

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

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
#line 266 "A1.y"

	int	int_val;
	char* name;
	struct Token* genList;

#line 117 "A1.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_A1_TAB_H_INCLUDED  */
