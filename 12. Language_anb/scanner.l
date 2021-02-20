%{
    #include "y.tab.h"
    /*
        Program Description: YACC Program to recognize strings of language {a^nb, n >= 5}
    */
%}

%%
"a" return A;
"b" return B;
.   return *yytext;
\n  return NEWLINE;
%%

int yywrap() {
    return 1;
}