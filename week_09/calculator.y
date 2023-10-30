%{
#include <ctype.h>
#include <stdio.h>
#include <math.h>
#define YYSTYPE double /* double type for Yacc stack */
int flag =0;
%}
%token NUMBER
%left '+' '-'
%left '*' '/' '^'
%right UMINUS
%%
lines : lines expr '\n' { printf("%g\n", $2); }
      | lines '\n'
      | /* empty */
;
expr : expr '+' expr { $$ = $1 + $3; }
     | expr '-' expr { $$ = $1 - $3; }
     | expr '*' expr { $$ = $1 * $3; }
     | expr '/' expr { $$ = $1 / $3; }
     | '(' expr ')' { $$ = $2; }
     | expr '^' expr { $$ = pow($1,$3);}
     | 's''q''r''t'expr{$$ =sqrt($5);}
     | 's'expr{$$ = sin($2*3.14/180);}
     | 'c'expr{$$ = cos($2*3.14/180);}
     | 'l'expr{$$ = log($2);}
     | '-' expr %prec UMINUS { $$ = - $2; }
     | NUMBER
;
%%
float yylex() {
int c;
while ( ( c = getchar() ) == ' ' );
if ( (c == '.') || (isdigit(c)) ) {
ungetc(c, stdin);
scanf("%lf", &yylval);
return NUMBER;
}
return c;
}
void yyerror(const char *s){ 
	printf("Invalid\n");
	flag =1;
	}
void main() {
	printf("Enter any expr:\n");
	yyparse();
	if(flag==0) {
	printf("\nvalid expression");
	}
}

