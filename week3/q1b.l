
%option noyywrap
%{
#include<stdio.h>
%}
%%
[a-z]*"a"[a-z]*"e"[a-z]*"i"[a-z]*"o"[a-z]*"u"[a-z]* {printf("valid string: %s",yytext);}
.* {printf("invalid");}
%%
int main()
{
        yylex();
        return 0;
}
