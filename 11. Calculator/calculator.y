%{
    #include <stdio.h>
    #include <stdlib.h>  
    #include <math.h>  
%}

%union {
    float f;
}

%token FLOAT NEWLINE;
%type <f> start expr FLOAT
%left '+' '-'
%left '*' '/'
%right '^'

%%
start:  expr NEWLINE {
                        printf("Expression valid\nResult = %f\n", $$);
                        exit(1);
                    }
        ;
expr:   expr '+' expr   { $$ = $1 + $3; }
    |   expr '-' expr   { $$ = $1 - $3; }
    |   expr '*' expr   { $$ = $1 * $3; }
    |   expr '/' expr   { 
                            if($3 != 0) {
                                $$ = $1 / $3;
                            }
                            else {
                               printf("Result = Not Defined\n");
                               exit(1); 
                            }  
                        }
    |   expr '^' expr        { $$ = pow($1,$3); }
    |   '(' expr ')'    { $$ = $2; }
    |   FLOAT
    |   '-' expr        { $$ = -$2; }
    |   '+' expr        { $$ = $2; }
%%

int yyerror(char const *s) {
    printf("Expression invalid");
    return 1;
}

int main() {
    printf("Enter an arithmetic expression: \n");
    yyparse();
    return 0;
}