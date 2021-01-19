%{
    // count the number of string literals

    #include <stdio.h>
    int str_literals = 0;
%}

D       \"
E       \\.
NDE      [^"\\"]

%%
\/\/.*|\/\*[^\/\*]\/\*       {}
\"[^\"]*\"                   { printf("%s\n", yytext); str_literals++; } 
.|\n                         {}
%%

int main() {
    yyin = fopen("test.cpp", "r");
    yylex();
    printf("No. of string literals: %d", str_literals);
    return 0;
}

int yywrap() {
    return 1;
}