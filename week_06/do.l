%{
#include <stdio.h>
#include <string.h>
%}

%option noyywrap                                                                                                       

%%
"do"            { printf("while (1)"); }
"}while"        { printf("if"); }
"{"             { printf("{"); }
"}"             { printf("}"); }
");"           {printf(")");}                  
.|\n            { printf("%s", yytext); }
%%

int main() {                                                                                                           
    FILE* inputFile = fopen("while.txt", "r");
    if (!inputFile) {
        fprintf(stderr, "Failed to open input.txt\n");
        return 1;
    }

    yyin = inputFile;
    yylex();

    fclose(inputFile);
    printf("{\n\tcontinue;\n}\nelse{\n\tbreak;\n}\n}");
    return 0;
}

