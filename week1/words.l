
%option noyywrap
%{
#include<stdio.h>
#include<string.h>
int i=0;
%}
%%
([a-zA-Z0-9])* { i++; }
[a-zA-Z]+ {printf("Word:%s\n",yytext);}
.;
%%

int main()
{
	yylex();
	printf("no of words=%d",i);
	return 0;
}
