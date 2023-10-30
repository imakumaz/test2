%option noyywrap
%{
#include<stdio.h>
int lc=0,sc=0,tc=0,ch=0,wc=0;
%}
%%
[\n] { lc++; ch+=yyleng;}
" " { sc++; ch+=yyleng;}
[\t\n] { tc++; ch+=yyleng;}
[^\t\n ]+ { wc++;  ch+=yyleng;
printf("words:%s\n",yytext);}
%%

int main(){
    extern FILE *yyin;
	yyin=fopen("input.txt","r");
    yylex();
    printf("Number of lines : %d\n",lc);
    printf("Number of spaces : %d\n",sc);
    printf("Number of tabs, words, charc : %d , %d , %d\n",tc,wc,ch);

    return 0;
}
