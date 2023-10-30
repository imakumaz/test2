%{
#include<stdio.h>
int yylex(void);
float output=0;
%}
%union
{
 float dval;
}
%token <dval> NUMBER
%token <dval>WL
%left '+' '-'
%left '*' '/'

%type <dval> state
%type <dval> exp
%type <dval> N
%%
state : exp N {}
 ;
exp : NUMBER {$$=$1;output=$$;}
 | exp WL exp WL '+' {$$=$1+$2;output=$$;}
 | exp WL exp WL  '-' {$$=$1-$2;output=$$;}
 | exp WL exp WL '*' {$$=$1*$2;output=$$;}
 | exp WL exp WL '/' {$$=$1/$2;output=$$;}
 ;
N : {printf("\n It is valid postfix expression\n Output =%.3f\n",output);}
 ;
%%
