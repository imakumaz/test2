%option noyywrap
%{
#include<stdio.h>
#include"y.tab.h"
#include<math.h>
%}
%%
[0-9] {yylval.dval=atof(yytext);return NUMBER;}
[\t];
[\n] return 0;
. {return yytext[0];}
%%
void yyerror(char * str)
{
 printf("\n Invalid Expression...");
}
int main()
{
 
 yyparse();
 return(0);
}
