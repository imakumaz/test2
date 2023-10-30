/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

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

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
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
    ID = 258,
    NUMBER = 259,
    FOR = 260,
    GT = 261,
    LT = 262,
    GE = 263,
    LE = 264,
    E = 265,
    NE = 266,
    OP = 267,
    CP = 268,
    OB = 269,
    CB = 270,
    SC = 271,
    AND = 272,
    OR = 273,
    NOT = 274,
    INCR = 275,
    DECR = 276,
    ADD = 277,
    SUB = 278,
    MUL = 279,
    DIV = 280,
    EQ = 281
  };
#endif
/* Tokens.  */
#define ID 258
#define NUMBER 259
#define FOR 260
#define GT 261
#define LT 262
#define GE 263
#define LE 264
#define E 265
#define NE 266
#define OP 267
#define CP 268
#define OB 269
#define CB 270
#define SC 271
#define AND 272
#define OR 273
#define NOT 274
#define INCR 275
#define DECR 276
#define ADD 277
#define SUB 278
#define MUL 279
#define DIV 280
#define EQ 281

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
