%{
#include<stdio.h>
#include<ctype.h>
#include<stdlib.h>

int yylex();
int yyerror();
int count=0;
extern int yyin;
%}


%token NL  SEM  INSIDE  SPACE fxnname DATATYPE para COMMA
%%

START:fxn_stmt NL {printf("Input accepted\n");exit(0);};
fxn_stmt: DATATYPE SPACE fxnname '(' DATATYPE SPACE para COMMA DATATYPE SPACE para COMMA DATATYPE SPACE para ')' NL '{' NL INSIDE SEM NL '}';
%%

void main(int argc, char* argv[]) {
FILE *fp=fopen("spot.txt", "r");
yyin=fp;
yyparse();
}
int yywrap()
{}
yyerror(char const *s)
{
printf("Not Accepted\n");
}

