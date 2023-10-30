%{
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
%}
%token NUM
%%
start: expr '\n' {if($1) printf("True\n");
else printf("False\n");
return 1; }
| rexpr '\n'
;
expr : rexpr'|''|'rexpr {$$=$1||$4;}
| rexpr'&''&'rexpr { $$=$1&&$4; }
| 'N''O''T'rexpr { $$=!$4;}
rexpr : rexpr'<'rexpr { $$=($1<$3);}
| rexpr'>'rexpr { $$=($1>$3);}
| '!'rexpr { $$=(!$2);}
| rexpr'=''='rexpr { $$= ($1==$4);}
|rexpr'!''='rexpr {$$= ($1!=$4);}
|'('rexpr')' {$$=$2;}
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

