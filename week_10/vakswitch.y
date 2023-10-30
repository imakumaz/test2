%{
#include<stdio.h>
#include<ctype.h>
#include<stdlib.h>

int yylex();
int yyerror();
int count=0;
extern int yyin;
%}


%token SWITCH CASE DEFAULT ERR RELOP NUM ID NL EQ OP INC KEY SEM S INSIDE START END SPACE
%%

stmt:START switch_stmt NL {printf("Input accepted\n");exit(0);};
switch_stmt: SWITCH NL '{' NL CASE NL INSIDE SEM NL CASE NL INSIDE SEM NL DEFAULT NL ERR SEM NL '}' END {count++;}
        |ID;
incre: x INC | x EQ x OP x|INC x;
init: x EQ x SEM;
cond: x RELOP x ;
x: ID | NUM;
%%

void main(int argc, char* argv[]) {
FILE *fp=fopen("spot1.txt", "r");
yyin=fp;
yyparse();
}
int yywrap()
{}
yyerror(char const *s)
{
printf("Not Accepted\n");
}
