%option noyywrap
%{
#include <stdio.h>
int error_count = 0;
%}

%%


int|char|float|double|void    { printf("Data type: %s\n", yytext); }
if|else|while|for            { printf("Control keyword: %s\n", yytext); }
[0-9]+                       { printf("Integer constant: %s\n", yytext); }
\"[^\"\n]*\"                 { printf("String constant: %s\n", yytext); }
\/\/.*                       { printf("Comment: %s\n", yytext); }
\/\*[^*]*\*+([^/*][^*]*\*+)*\/ { printf("Comment: %s\n", yytext); }
[(){};,]                    { printf("Special character: %s\n", yytext); }
[+-/*<>=]                     {printf("operator: %s\n",yytext);}
[_a-zA-Z][_a-zA-Z0-9]*      { printf("Identifier: %s\n", yytext);}
[ \t\n]                          {}
.                            { printf("Unknown token: %s\n", yytext); error_count++; }

%%

int main()
{
    yyin = fopen("sample.c", "r");
    if (yyin == NULL) {
        perror("Error opening file");
        return 1;
    }
    yylex();
    if (error_count == 0) {
        printf("No errors found.\n");
    } else {
        printf("%d error(s) found.\n", error_count);
    }
    fclose(yyin);
    return 0;
}

