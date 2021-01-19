%{
    // count the number of lines and characters in the input file

    #include <stdio.h>
    int num_lines = 0, num_chars = 0;

%}

%% 
.   { num_chars++; }
\n  { num_chars++, num_lines++; }
%%


int main() {
    yyin = fopen("input.txt", "r");
    yylex();
    printf("No. of characters: %d\nNo. of lines: %d", num_chars, num_lines);
    return 0;
}

int yywrap() {
    return 1;
}