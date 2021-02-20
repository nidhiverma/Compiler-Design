%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    int yyerror();
%}

%token A B NEWLINE

%%
START   : A S B NEWLINE     { printf("String IS IN the language"); exit(0); }
        ;
S       : A S B
        | A B
        ;
%%

int yyerror(char const* s) {
    printf("String NOT IN the language");
    return 1;
}

int main() {
    printf("Language {a^nb^n, n >= 1}\n");
    printf("Enter a string: ");
    yyparse();
    return 0;
}

