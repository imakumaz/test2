%option noyywrap
%{
#include<stdio.h>
#include<string.h>
%}

%%
[a-zA-Z0-9]+    { printf("Valid: %s",yytext);}
.+ {printf("invalid but removal of special chars: ");
	for(int i=0;i<=yyleng-1;i++){
		if(yytext[i]=='!'||yytext[i]=='@'||yytext[i]=='#'||yytext[i]=='$'||yytext[i]=='%'||yytext[i]=='^'||yytext[i]=='&'||yytext[i]=='*'||yytext[i]=='('||yytext[i]==')'||yytext[i]=='='||yytext[i]=='>'||yytext[i]=='<'||yytext[i]==','||yytext[i]=='.'||yytext[i]=='?'){
			continue;}
		else{
		printf("%c",yytext[i]);}}}
%%



int main()
{
    yylex();
	return 0;
}
