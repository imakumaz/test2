
%option noyywrap
%{
#include<stdio.h>

%}
%%
("+"[0-9]+|"-"[0-9]+|[0-9]+)  printf(" number valid : %s",yytext);
.+ printf("number Invalid");

%%
int main()
{
        printf("Enter the number:");
        yylex();
        return 0;
}

