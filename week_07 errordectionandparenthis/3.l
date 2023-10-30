%{
#include <stdio.h>
%}

%option noyywrap

%%

"/*"    { 
            int depth = 1;
            while (depth > 0) {
                int c = input();
                if (c == EOF) {
                    fprintf(stderr, "Unterminated comment.\n");
                    return 1;
                }
                if (c == '/' && input() == '*') {
                    depth++;
                } else if (c == '*' && input() == '/') {
                    depth--;
                }
            }
        }
"//"    { 
            while (1) {
                int c = input();
                if (c == EOF || c == '\n') {
                    unput(c);
                    break;
                }
            }
        }
.       { putchar(yytext[0]); }

%%

int main()
{
    yyin = fopen("sample.c", "r");
    if (yyin == NULL) {
        perror("Error opening file");
        return 1;
    }
    yylex();
    fclose(yyin);
    return 0;
}


