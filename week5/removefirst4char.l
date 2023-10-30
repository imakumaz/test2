%option noyywrap
%{
        #include<stdio.h>
        char str[50];
        int temp=4,i=0;
%}
%%
[a-zA-Z0-9]* {while(temp<yyleng){
str[i++]=yytext[temp++];}
temp=4;
}
" " {str[i++]=' ';}
"\n" {int len=strlen(str)-1;
int k=0;
while(k<=len){
        printf("%c",str[k]);
str[k]=' ';
k++;
}
}
%%
int main(int argc,char *argv[]){
        if(argc>0){
                yyin=fopen(argv[1],"r");
        }
        yylex();
        printf("\n");
        return 0;
}

