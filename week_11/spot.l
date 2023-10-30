%{
#include<stdio.h>
#include<stdlib.h>
#include "y.tab.h"
extern int yyval;
%}

alpha [A-Za-z]
digit [0-9]

%%
" " return SPACE;
[ /t] ;
"printf(hello world)" return INSIDE;
"int"|"float"|"char" return DATATYPE;
";" return SEM;
[_][A-Z] return fxnname;
[A-Za-z]+ return para;
"," return COMMA;
"\n" return NL;
. return(yytext[0]);

%%

