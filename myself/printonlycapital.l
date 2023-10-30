
%option noyywrap
%{
#include<stdio.h>
#include<string.h>
%}

%%
[a-z0-9]+    { printf("inValid no capital letters: %s",yytext);}
[a-zA-Z0-9]+ {printf("Valid %s Capital letters:",yytext);
        for(int i=0;i<=yyleng-1;i++){
                if(yytext[i]>=96&&yytext[i]<=96+27){
                        continue;}
                else{
                printf("%c",yytext[i]);}}}
. 
%%



int main()
{
    yylex();
        return 0;
}
