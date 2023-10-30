%{
#include<stdio.h>
#include<ctype.h>
#include<stdlib.h>

int yylex();
int yyerror();
int count=0;
extern int yyin;
%}


%token WHILE RELOP NUM ID NL EQ OP INC KEY SEM S INSIDE START END SPACE
%%

stmt:START while_stmt NL {printf("Input accepted\n");exit(0);};
while_stmt: WHILE'('cond ')' NL '{' NL INSIDE SEM NL incre SEM NL'}'END {count++;}
        |ID;
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


