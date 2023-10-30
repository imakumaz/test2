%{
#include <stdio.h>
#include <stdlib.h>


int is_empty();
void push(char c);
char pop();

int error_flag = 0;
%}

%option noyywrap

%%

\(    { push('('); }
\)    { 
        if (is_empty()) {
            printf("Unmatched closing parenthesis at line %d\n", yylineno);
            error_flag = 1;
        } else {
            char top = pop();
            if (top != '(') {
                printf("Mismatched parentheses at line %d\n", yylineno);
                error_flag = 1;
            }
        }
    }

.     ;  
\n    ;  

%%

int main(int argc, char** argv) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return 1;
    }
    yyin = fopen(argv[1], "r");
    if (yyin == NULL) {
        perror("Error opening file");
        return 1;
    }

    yylex();
    
    if (!is_empty()) {
        printf("Unmatched opening parenthesis at the end of the file\n");
        error_flag = 1;
    }

    fclose(yyin);

    if (error_flag) {
        printf("Parentheses are not balanced.\n");
        return 1;
    } else {
        printf("Parentheses are balanced.\n");
        return 0;
    }
}

#define MAX_STACK_SIZE 100

char stack[MAX_STACK_SIZE];
int top = -1;

int is_empty() {
    return top == -1;
}

int is_full() {
    return top == MAX_STACK_SIZE - 1;
}

void push(char c) {
    if (is_full()) {
        fprintf(stderr, "Stack overflow\n");
        exit(1);
    }
    stack[++top] = c;
}

char pop() {
    if (is_empty()) {
        fprintf(stderr, "Stack underflow\n");
        exit(1);
    }
    return stack[top--];
}

