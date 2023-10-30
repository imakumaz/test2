%{
#include<stdio.h>
#include<ctype.h>
#include<stdlib.h>

int yylex();
int yyerror();
int count=0;
extern int yyin;
%}


%token SWITCH RELOP NUM ID NL EQ OP INC KEY SEM S INSIDE START END SPACE COL BREAK DEFAULT CASE
%%

stmt:START switch_stmt NL {printf("Input accepted\n");exit(0);};
switch_stmt: SWITCH'('x')' NL '{' NL cases  defaults '}'END {count++;}
        |ID;
cases: CASE x COL '{'INSIDE SEM NL BREAK SEM '}' NL | cases ;
default: DEFAULT COL'{'INSIDE SEM NL BREAK SEM '}' NL
incre: x INC | x EQ x OP x|INC x;
init: x EQ x SEM;
cond: x RELOP x ;
x: ID | NUM;
%%

void main(int argc, char* argv[]) {
FILE *fp=fopen("2.txt", "r");
yyin=fp;
yyparse();
}
int yywrap()
{}
yyerror(char const *s)
{
printf("Not Accepted\n");
}

