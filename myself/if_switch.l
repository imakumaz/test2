%option noyywrap

%{
	#include<stdio.h>
	#include<string.h>
	
%}

%%

"if" {printf("case");}
"else if"       {printf("case");}
"else"	{printf("default");}
[(].[)]	{printf(" %s :",yytext);}
"{"	{printf(":{");}
.[;]$	{printf("%s\n",yytext);}
"}"	{printf("\tbreak;\n}");}
\n	{printf("%s",yytext);}


%%

int main()
{
	extern FILE *yyin,*yyout;
	yyin = fopen("if.txt","r");
	printf("switch(true)\n{\n");
	yylex();
	return 0;
} 

