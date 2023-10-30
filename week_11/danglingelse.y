%{                                                                                                                                                                      
#include<stdio.h>                                                                                                                                                       
#include<stdlib.h>
int yylex();
int yyerror();
%}
%token IF NL THEN A B ELSE
%%
start:stmt NL {printf("valid input\n");exit(0);};
 stmt: IF expr THEN stmt|IF expr THEN stmt ELSE stmt| A;
expr: B;
%%
void main() {                                                                                                                                                           
printf("Enter the expr:\n");                                                                                                                                      
yyparse();                                                                                                                                                              
}
int yywrap(){}
yyerror(char const *s)
{                                                                                                                                                                       
printf(" not valid\n");                                                                                                                                          
exit(0);                                                                                                                                                                
}    
