%option noyywrap
%{
	#include<stdio.h>
	#include<string.h>
	char u[100], l[100];
	int i = 0, j = 0, k = 0, m = 0;
%}
%%
[a-z]+ {while(k < yyleng){
		l[i] = yytext[k];
		k++;
		i++;
	 }
	 k = 0;
	}
[A-Z]+ {while(m < yyleng){
		u[j] = yytext[m];
		m++;
		j++;
	 }
	 m = 0;
	}
" "  {/*Nothing*/}
"\n" {printf("Lower : %s\n", l); 
      printf("Start of LowerCase : %c, End of LowerCase : %c\n",l[0], l[i-1]);
      printf("Upper : %s\n", u);
      printf("Start of UpperCase : %c, End of UpperCase : %c\n",u[0], u[j-1]);
} 
%%
int main(int argc, char *argv[]){
	if(argc > 0)
		yyin = fopen(argv[1], "r");
	yylex();
	return 0;
}

