%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>

// Define a simple stack structure
struct Stack {
    char data;
    struct Stack* next;
};

struct Stack* top = NULL; // Initialize an empty stack
int error_flag = 0;      // Flag to track errors
%}

%%
"(" {
    // Push opening parentheses onto the stack
    struct Stack* new_node = (struct Stack*)malloc(sizeof(struct Stack));
    if (!new_node) {
        fprintf(stderr, "Memory allocation failed.\n");
        exit(1);
    }
    new_node->data = '(';
    new_node->next = top;
    top = new_node;
}

")" {
    // Check for a matching closing parenthesis
    if (top == NULL || top->data != '(') {
        printf("Unmatched ')' at line %d\n", yylineno);
        error_flag = 1;
    } else {
        // Pop the matching opening parenthesis from the stack
        struct Stack* temp = top;
        top = top->next;
        free(temp);
    }
// Check for unmatched opening parentheses
    while (top != NULL) {
        printf("Unmatched '(' at line %d\n", yylineno);
        error_flag = 1;
        struct Stack* temp = top;
        top = top->next;
        free(temp);
    }

}

[\t]+ {//ignore white spaces
}

\n {
    yylineno++; // Track line numbers
}

. {
    // Ignore other characters
}

%%

int main() {
    extern FILE *yyin;
    yyin = fopen("cprgm.txt","r");
    yylex();

    if (error_flag) {
        printf("Parentheses are not balanced.\n");
    } else {
        printf("Parentheses are balanced.\n");
    }

    return error_flag; // Return 0 if balanced, 1 if not
}


