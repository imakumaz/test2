%option noyywrap
%{
#include<stdio.h>
#include"y.tab.h"
#include<math.h>
%}
%%
[0-9] {yylval.dval=atof(yytext);return NUMBER;}
[\t];
" " return WL;
[\n] return 0;
. {return yytext[0];}
%%
void yyerror(char * str)
{
 printf("\n Invalid Expression...\n");
}
int main()
{
 //yyin=fopen("postfix.txt","r");
 yyparse();
 return(0);
}
