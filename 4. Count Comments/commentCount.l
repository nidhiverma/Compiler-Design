%{
    // Program to count comment in a cpp file
    #include <stdio.h>
    int singlelineComment = 0, multilineComment = 0;
%}

%%
\".*[\/\/|\/\*].*\"      {}                                                 // skip comments inside string literal
\/\*(.*\**.*)*\*\/       { printf("%s\n", yytext), multilineComment++; }    // print multi-line comments
\/\*[*]+\*\/                 { printf("%s\n", yytext), multilineComment++; }    // print multi-line comments   
\/\*(.*\n*)*\*\/$        { printf("%s\n", yytext), multilineComment++; }    // print multi-line comments
\/\/.*                   { printf("%s\n", yytext), singlelineComment++; }   // print single-line comments
.|\n                     {}                                                 // skip remaining characters
%%

int main() {
    yyin = fopen("comments.cpp", "r");
    yylex();
    printf("No. of single-line comments: %d\n", singlelineComment);
    printf("No. of multi-line comments: %d", multilineComment);
    return 0;
}

int yywrap() {
    return 1;
}