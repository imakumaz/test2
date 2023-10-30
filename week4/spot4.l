%option noyywrap
%{
#include<stdio.h>
#include<string.h>
%}

%%
^("/*"[a-zA-Z0-9]*"*/")  { printf("Valid comment: %s",yytext);}
.+ printf("Invalid comment");
%%



int main()
{
    yylex();
        return 0;
}
