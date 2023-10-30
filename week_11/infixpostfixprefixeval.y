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
lines : lines expri '\n' {printf("valid infix expression\n"); printf("%g\n", $2); }
      | lines '\n'
      | lines expr '\n' {printf("valid postfix expression\n"); printf("%g\n", $2); }
      |lines exprp '\n' {printf("valid prefix expression\n"); printf("%g\n", $2); }
      | /* empty */
;
expri : expri '+' expri  { $$ = $1 + $3; }
     | expri '-' expri  { $$ = $1 - $3; }
     | expri '*' expri  { $$ = $1 * $3; }
     | expri '/' expri  { $$ = $1 / $3; }
     | '(' expri ')' { $$ =$2;}
     | NUMBER
;
expr : expr expr '+'  { $$ = $1 + $2; }
     | expr expr '-'  { $$ = $1 - $2; }
     | expr expr '*'  { $$ = $1 * $2; }
     | expr expr '/'  { $$ = $1 / $2; }
     | NUMBER
;

exprp : '+' exprp exprp  { $$ = $2 + $3; }
     | '-' exprp exprp  { $$ = $2 - $3; }
     | '*' exprp exprp   { $$ = $2 * $3; }
     | '/' exprp exprp  { $$ = $2 / $3; }
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

