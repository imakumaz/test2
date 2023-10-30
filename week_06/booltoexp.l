%option noyywrap

%{
	#include<stdio.h>
%}

%%
[a-z]	{printf("%s",yytext);}
"+"	{printf("%s","||");}
"*"	{printf("%s","&&");}
\n	{printf("\n");}

%%

int main()
{
	extern FILE *yyin;
	yyin = fopen("arith.txt","r");
	yylex();
	return 0;
}

