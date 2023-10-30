%option noyywrap
%{
#include<stdio.h>
#include<string.h>
%}

%%
^[b]("an"|"anan")[a]?$   { printf("Valid: %s",yytext);}
.+ printf("Invalid");
%%



int main()
{
    yylex();
        return 0;
}
