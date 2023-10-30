%{
#include<stdio.h>
int valid = 1;
%}
%token letter digit
%%
start: letter s

s: letter s
 | digit s
 | 
 ;
%%
int yyerror(){
	printf("It's not a Identifier\n");
	valid = 0;
	return 0;
}
int main(){
	printf("Enter the name to check : ");
	yyparse();
	if(valid){
		printf("It's a Identifier\n");
	}
	return 0;
}

