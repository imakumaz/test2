%{
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
%}
%token NUM
%left '+' '-'
%left '*''/'
%%
start: E '\n' {printf("%d\n", $1);return 1; }
     ;
E : E'+'E { $$=$1 + $3;}
     | E'-'E { $$=$1-$3; }
     | E'*'E {$$=$1*$3;}
     | E'/'E {$$=$1/$3;}
     | '('E')' {$$=$2;}
     | NUM {$$=$1;}
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

