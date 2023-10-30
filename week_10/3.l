%option noyywrap
%{
        #include<stdio.h>
        #include "y.tab.h"
%}
%%
[ \t\n] ;
for     return FOR;
[a-zA-Z][_a-zA-Z0-9]* return ID;
[0-9]+  return NUMBER;
"!"     return NOT;
"&&"    return AND;
"||"    return OR;
">"     return GT;
"<"     return LT;
"=="    return E;
"!="    return NE;
">="    return GE;
"<="    return LE;
"+"     return ADD;
"-"     return SUB;
"="     return EQ;
"*"     return MUL;
"/"     return DIV;
";"     return SC;
"{"     return OB;
"}"     return CB;
"("     return OP;
")"     return CP;
"++"    return INCR;
"--"    return DECR;
%%
