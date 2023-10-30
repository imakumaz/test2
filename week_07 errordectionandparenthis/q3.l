%option noyywrap
%{
#include <stdio.h>
%}

%x IN_COMMENT

%%
"/*"            { BEGIN(IN_COMMENT); }
<IN_COMMENT>"*/" { BEGIN(INITIAL); }
<IN_COMMENT>.    { /* Ignore characters inside multi-line comments */ }

"//"            { BEGIN(IN_COMMENT); }
<IN_COMMENT>"\n" { BEGIN(INITIAL); }

<IN_COMMENT>[^\n]*   { /* Ignore characters inside single-line comments */ }

[^\n"/*]+       { printf("%s", yytext); }
"\"([^\"]|\\.)*\"" { printf("'%s'", yytext); }  /* Handle string literals */
\n              { putchar('\n'); }   /* Print newlines */
.               { /* Ignore other characters */ }

%%

int main() {
extern FILE *yyin, *yyout;
yyin = fopen("cprgm.txt","r");    
yyout = fopen("output.txt","w");
yylex();
    return 0;
}

