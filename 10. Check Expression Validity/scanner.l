%{ 
    /* Definition */
    #include<stdio.h> 
    #include "y.tab.h" 
    extern int yylval; 
%} 

/* Rules */
%% 
[0-9]+                   { return NUMBER; }
[a-zA-Z][a-zA-Z0-9_]*    { return ID; }
\n                       { return NEWLINE ;}
.                        { return *yytext; } 
%% 

int yywrap() { 
    return 1; 
} 
