%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void push(char);
char pop();
int precedence(char);
int isOperator(char);
char* infixToPrefix(char*);
int stack[100];
int top = -1;
%}

%option noyywrap

%%
[ \t]       ; // Ignore whitespace
[0-9]+      { printf("%s ", yytext); } // Match and print numbers
[-+*/()^]   { 
              while(top!=-1 && stack[top]!='(' && precedence(stack[top])>=precedence(yytext[0])){
                printf("%c",pop());
              }
              push(yytext[0]);
            } // Handle operators
\n          {
              while(top!=-1){
                printf("%c",pop());
              }
              printf("\n");
            } // Newline terminates the expression
.           { 
              printf("Invalid character: %s\n", yytext);
              exit(1); 
            } // Handle invalid input
%%


int main() {
    char input[100];
    printf("Enter an infix expression: ");
    fgets(input, sizeof(input), stdin);
    char* prefix = infixToPrefix(input);
    printf("The prefix expression is: %s\n", prefix);
    return 0;
}

void push(char ch) {
    stack[++top] = ch;
}

char pop() {
    if (top == -1) {
        return '\0';
    }
    return stack[top--];
}

int precedence(char ch) {
    if (ch == '^') return 3;
    if (ch == '*' || ch == '/') return 2;
    if (ch == '+' || ch == '-') return 1;
    return 0;
}

int isOperator(char ch) {
    return (ch == '+' || ch == '-' || ch == '*' || ch == '/' || ch == '^');
}

char* infixToPrefix(char* infix) {
    char* prefix = (char*)malloc(2 * strlen(infix) * sizeof(char));
    int i, j = 0;
    
    // Reverse the infix expression
    int len = strlen(infix);
    for (i = len - 1; i >= 0; i--) {
        if (infix[i] == '(')
            infix[i] = ')';
        else if (infix[i] == ')')
            infix[i] = '(';
        prefix[j++] = infix[i];
    }
    prefix[j] = '\0';
    
    // Evaluate the reversed expression using the Shunting Yard algorithm
    top = -1;
    for (i = 0; i < len; i++) {
        if (isOperator(prefix[i])) {
            while (top != -1 && precedence(stack[top]) >= precedence(prefix[i])) {
                prefix[j++] = pop();
            }
            push(prefix[i]);
        } else if (prefix[i] == '(') {
            push(prefix[i]);
        } else if (prefix[i] == ')') {
            while (top != -1 && stack[top] != '(') {
                prefix[j++] = pop();
            }
            pop();  // Pop '('
        } else {
            prefix[j++] = prefix[i];
        }
    }
    
    while (top != -1) {
        prefix[j++] = pop();
    }
    
    prefix[j] = '\0';
    
    // Reverse the final result to get the prefix expression
    len = strlen(prefix);
    for (i = 0; i < len / 2; i++) {
        char temp = prefix[i];
        prefix[i] = prefix[len - i - 1];
        prefix[len - i - 1] = temp;
    }
    
    return prefix;
}


