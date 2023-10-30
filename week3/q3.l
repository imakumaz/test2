%option noyywrap
%{
#include<stdio.h>

%}
%%
([a]*|[a]*[b]+|"abb")  printf(" string valid");
.+ printf(" Invalid");

%%
int main()
{
        printf("Enter the string:");
        yylex();
        return 0;
}
