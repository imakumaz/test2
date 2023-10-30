%option noyywrap
%{
#include<stdio.h>
#include<string.h>
%}

%%
^[d][a-z]*[t]$  { printf("Valid: %s",yytext);}
.+ printf("Invalid");
%%



int main()
{
    yylex();
        return 0;
}
