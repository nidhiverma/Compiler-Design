%{
    #include <stdio.h>
    #include <ctype.h>
    int numOfIntegers = 0;
    int numOfFloat = 0;
%}

%%
(-)?[0-9]+[.][0-9]+   { printf("%s: Float\n", yytext); numOfFloat++; }
(-)?[0-9]+          { printf("%s: Integer\n", yytext); numOfIntegers++; }
.|\n                {}
%%

int main() {
    yyin = fopen("input.txt", "r");
    yylex();
    printf("No. of Floats: %d\nNo. of Numbers: %d", numOfFloat, numOfIntegers);
    return 0;
}

int yywrap() {
    return 1;
}