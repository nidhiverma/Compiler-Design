%{
    // Program to remove comment from a cpp file
    #include <stdio.h>
    int commentCount = 0;
%}

%%
\/\*(.*\n*)*\*\/$       {fprintf(yyout, "");}                           // remove multiline comment
\/\*.*\*\/              {fprintf(yyout, "");}                           // remove multiline comment
\".*[\/\/|\/\*].*\"     {fprintf(yyout, "%s", yytext);}                 // print comment written inside string literal
\/\/.*                  {fprintf(yyout, "");}                           // remove single line comments
.|\n                    {fprintf(yyout, "%s", yytext);}                 // print remaining characters
%%

int main() {
    yyin = fopen("comments.cpp", "r");
    yyout = fopen("output.cpp", "w");
    yylex();
    return;
}

int yywrap() {
    return 1;
}