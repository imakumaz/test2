%option noyywrap
%{
        #include<stdio.h>
%}
%%
[a-z]([a-z]|0-9)* {printf("Identifier: %s\n",yytext);}
\+|\-|=|"++"|"--"|\. {printf("Operator: %s\n",yytext);}
%%
int main()
{
        yylex();
        return 0;
}
