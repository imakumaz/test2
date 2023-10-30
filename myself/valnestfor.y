%{
#include<stdio.h>
#include<ctype.h>
#include<stdlib.h>

int yylex();
int yyerror();
int count=0;
extern int yyin;
%}


%token FOR RELOP NUM ID NL EQ OP INC KEY SEM S INSIDE START END SPACE
%%

stmt:START for_stmt NL {printf("Input accepted\n");exit(0);};
for_stmt: FOR'('KEY SPACE init cond incre')' NL '{' NL FOR'('KEY SPACE init cond incre')' NL '{' NL INSIDE SEM NL '}' NL '}'END {count++;}
        |ID;
incre: x INC | x EQ x OP x|INC x;
init: x EQ x SEM;
cond: x RELOP x SEM;
x: ID | NUM;
%%

void main(int argc, char* argv[]) {
FILE *fp=fopen("1.txt", "r");
yyin=fp;
yyparse();
}
int yywrap()
{}
yyerror(char const *s)
{
printf("Not Accepted\n");
}


