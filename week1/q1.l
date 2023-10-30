%option noyywrap
%{
#include <stdio.h>
int i=0;
%}
%%
[ \t\n] ;
[a-zA-Z]+ {
  printf("words: %s\n",yytext);
	i++;
}
. ;

%%

int main() {
yylex();
printf("no of words=%d",i);
return 0;
}

