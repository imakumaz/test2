%option noyywrap
%{
#include<stdio.h>
int i=0;
%}

%%
[a-z]+ { 
		printf("\nLowercase letter = "); ECHO; 
		printf("\nStart of 1st yymore %d\n",i+1); 
		yymore ();
		i++;
		printf("\nEnd of 1st yymore %d\n",yyleng);
		}
[A-Z]+ {
	printf("\nUppercase letter = "); ECHO;
	printf("\nStart of 2nd yymore %d\n",i+1);
	yymore ();
	i++;
	printf("\nEnd of 2nd yymore %d\n",yyleng);
} 
%%
int main ()
{
	yylex ();
	return 0;
}

