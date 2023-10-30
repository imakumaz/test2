%{
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
%}
%token ifcond then closeop openop lt gt eq semic not and or finalline finalline2 NL NUM CHA
%left '|'
%left '&'
%left '<'
%left '>'
%left ')'
%left '('
%left '='
%left '!'  
%right '\n'
%%
start: ifcond openop expr closeop e1 NL {printf("Input Matched\n");
     if($3){printf("True Condition.\n");}
	else{printf("False condition.\n");exit(0);}}
| rexpr NL
;
expr : expr or rexpr {$$=$1||$3;}
     | expr and rexpr {$$=$1&&$3;}
     | not rexpr {$$=!($2);} 
     | rexpr
;
rexpr : rexpr lt rexpr {if($1<$3)
     			$$=$1;
			else
			$$=0;}
	| rexpr gt rexpr       {if($1>$3)
			 $$=1; 
			 else
			  $$=0;}
	| not rexpr            {$$=!($2);}
	| rexpr eq eq rexpr    {if($1==$4)
			$$=1; 
			else
			$$=0;}
	|rexpr not eq rexpr    {if($1!=$4)
			$$=1; 
			else
			$$=0;}
|openop expr closeop
| NUM
| CHA
;
e1: then NL finalline
  | finalline2
;
%%
int yywrap(){}
yyerror(char const *s)                                                                                                                                                  
{                                                                                                                                                                       
    printf("Not Matched\n");                                                                                                                                            
    exit(0);                                                                                                                                                            
}                                                                                                                                                                       
int main(){                                                                                                                                                             
	while(1){                                                                                                                                                               yyparse();                                                                                                                                                              }
return 0;
} 
