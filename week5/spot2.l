%option noyywrap
%{
#include<stdio.h>
%}
%%
[a-zA-Z]+ {
printf("\n input "); ECHO;
yyless (4);
printf("\nThe word after yyless () = "); ECHO;
}

%%
int main()
{
yylex ();
return 0;
}

