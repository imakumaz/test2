%{
#include<stdio.h>
#include "y.tab.h"
extern int yyval;
%}
%%
"i" return IF;                                                                                                                                                          
"t" return THEN;                                                                                                                                                        
"e" return ELSE;                                                                                                                                                        
"a" return A;                                                                                                                                                           
"b" return B;                                                                                                                                                           
"\n" return NL;                                                                                                                                                         
. return(yytext[0]);
%%                      
