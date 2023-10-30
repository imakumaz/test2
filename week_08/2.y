%{
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
%}
%token NUM
%%
start: E '\n' {if($1) printf("True\n");
     else printf("False\n");
return 1; }
| E1 '\n'
;
E : E1'O''R'E1 {$$=$1||$4;}
     | E1'A''N''D'E1 { $$=$1&&$5; }
	| 'N''O''T'E1 { $$=!$4;}
;
E1 : E1'<'E1 { $$=($1<$3);}
      | E1'>'E1 { $$=($1>$3);}
| '!'E1 { $$=(!$2);}
| E1'=''='E1 { $$= ($1==$4);}
|E1'!''='E1 {$$= ($1!=$4);}
|'('E1')' {$$=$2;}
| NUM
;
%%
yyerror(char const *s)
{
	printf("yyerror");
}
int yylex() {
	int c;
	c=getchar();
	if (isdigit(c)) {
	yylval=c-'0';
	return NUM;
	}
	return c;
	}
int main(){
	while(1){
		yyparse();
	}
return 1;
}
