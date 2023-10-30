
%option noyywrap
%{
#include<stdio.h>
#include<string.h>
%}

%%
[a-zA-Z]+[^\t\n]*    { for(int i=yyleng-1;i>=0;i--){
				fprintf(yyout,"%c",yytext[i]); }}
.
%%



int main()
{
    extern FILE *yyin, *yyout;
    yyin=fopen("input.txt", "r");
    yyout=fopen("output.txt", "w");
    yylex();
}
