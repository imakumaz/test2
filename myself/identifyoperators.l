%option noyywrap
%{
#include<stdio.h>
%}
%%

("+"|"-"|"*"|"/"|"%"|"<"|">"|"="|"=="|"!=") {printf("its a operator");}
if|else|while|int|switch|for|char {printf("keyword");}
[a-z]([a-z]|[0-9])* {printf("identifier");}
[0-9]* {printf("number");}
(";"|":"|"*/"|"/*"|"#"|".") {printf("its puntuation");}
.* { printf ("invalid"); }
%%
int main()
{
yylex();
return 0;
}
