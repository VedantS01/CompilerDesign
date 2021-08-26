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

#ifndef YY_YY_LAB2_TAB_H_INCLUDED
# define YY_YY_LAB2_TAB_H_INCLUDED
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
    INTEGER_LITERAL = 258,
    EQ = 259,
    DIV = 260,
    MUL = 261,
    PLUS = 262,
    MINUS = 263,
    SEMICOLON = 264,
    LEFTCURLBRAC = 265,
    RIGHTCURLBRAC = 266,
    LEFTBRAC = 267,
    RIGHTBRAC = 268,
    LEFTSQBRAC = 269,
    RIGHTSQBRAC = 270,
    COMMA = 271,
    QUES = 272,
    NOT = 273,
    AND = 274,
    OR = 275,
    NEQ = 276,
    LEQ = 277,
    DOT = 278,
    IDENTIFIER = 279,
    CLASS = 280,
    PUBLIC = 281,
    STATIC = 282,
    VOID = 283,
    MAIN = 284,
    STRING = 285,
    SOP = 286,
    EXTENDS = 287,
    RETURN = 288,
    INTTYPE = 289,
    BOOL = 290,
    IF = 291,
    ELSE = 292,
    WHILE = 293,
    THIS = 294,
    NEW = 295,
    HDEF = 296,
    DLEN = 297,
    TR = 298,
    FL = 299
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 23 "lab2.y"

	//int	int_val;
	char* char_val;
	//bool bool_val;

#line 108 "lab2.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_LAB2_TAB_H_INCLUDED  */
