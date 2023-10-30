%option noyywrap
%{
#include<stdio.h>
#include<string.h>
%}

%%

[a-z]*[d][e][f][a-z]* {printf("it has the string def:%s",yytext);}
.+ printf("Invalid");
%%



int main()
{
    yylex();
        return 0;
}
