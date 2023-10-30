%{
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include "y.tab.h"
extern int yylval;
%}
%%
"if" return ifcond;
"then" return then;
[0-9] {yylval=atoi(yytext);return NUM;}
")" return closeop;
"(" return openop;
"<" return lt;
">" return gt;
"=" return eq;
";" return semic;
"!" return not;
"&&" return and;
"||" return or;
"x=y-z+p" return finalline;
"x"[ ]*"=="[ ]*[0-9]+ return finalline2;
[a-zA-Z] return CHA;
. return(yytext[0]);
\n return NL;
%% 
