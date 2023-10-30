%{
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
%}
%token NUM
%left '+'
%left '*'
%left '-'
%left '/'
%%
start: expr '\n' {printf("%d\n", $1);return 1; }
     ;
expr : expr'+'term { $$=$1 + $3;}
     | expr'-'term { $$=$1-$3; }
| term { $$=$1;}
;
term : term'*'factor {$$=$1*$3;}
     | term'/'factor {$$=$1/$3;}
|factor
;
factor : '('expr')' {$$=$2;}
       | NUM
;
%%
yyerror(char const *s)
{
printf("yyerror %s",s);
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
