%{                                                                         
#include<stdio.h>                                                          
#include<stdlib.h>                                                         
char result[300],stat1[50],inc2[10];                                       
%}                                                                         
%s S1                                                                      
%s S2                                                                      
%s S3                                                                      
%s S4                                                                      
%s S5                                                                      
%s S6                                                                      
%s S7                                                                      
%option noyywrap                                                           
%%                                                                         
<INITIAL>("if") {                                                          
BEGIN S1;                                                                  
}                                                                          
                                                                           
<S1>([a-z]*[==|!=|>|<|>=|<=]*[a-z0-9]*) {                                  
strcat(result,"if(");                                                      
strcat(result,yytext);                                                     
BEGIN S2;                                                                  
}                                                                          
                                                                           
<S2>("\n{"?.*";") {                                                        
BEGIN S3;                                                                  
}                                                                          
                                                                           
<S3>("else if") {                                                          
strcat(result," || ");                                                     
BEGIN S4;                                                                  
}                                                                          
                                                                           
<S3>("if") {                                                               
strcat(result," || ");                                                     
BEGIN S4;                                                                  
}                                                                          
                                                                           
<S4>([a-z]*[==|!=|>|<|>=|<=][a-z0-9]*) {                                   
strcat(result,yytext);                                                     
strcat(result,")\n\t\t");                                                  
BEGIN S5;                                                                  
}                                                                          
                                                                           
<S5>("\n{"?.*";""}"?) {                                                    
strcat(result,yytext);                                                     
strcat(result,"\n\t\n");                                                   
BEGIN S6;                                                                  
}                                                                          
                                                                           
<S6>("else") {                                                             
strcat(result,yytext);                                                     
strcat(result,"\n\t\n\t");                                                 
BEGIN S7;                                                                  
}                                                                          
                                                                           
<S7>("\n{"?.*";""}"?) {                                                    
strcat(result,yytext);                                                     
strcat(result,"\n\t\n");                                                   
BEGIN INITIAL;                                                             
}                                                                          
                                                                           
.|\n ;                                                                     
%%                                                                         
int main(int argc, char* argv[]) {                                         
        FILE *fptr = fopen(argv[1],"r");                                   
        if(fptr){                                                          
                yyin=fptr;                                                 
        }                                                                  
        yylex();                                                           
        printf("%s\n",result);                                             
        return 0;                                                          
}                    
