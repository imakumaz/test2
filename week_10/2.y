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
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS
%type <dval> state
%type <dval> exp
%type <dval> ex
%%
state : exp {printf("\n Output =%f\n",output);}
 ;
exp :  '+' ex ex {$$=$2+$3;output=$$;}
 | '-' ex ex  {$$=$2-$3;output=$$;}
 | '*' ex ex  {$$=$2*$3;output=$$;}
 | '/' ex ex  {$$=$2/$3;output=$$;}
 ;
ex : NUMBER {$$=$1;};
%%
