%{
    // count the number of words present in a given text file

    #include <stdio.h>
    int num_words = 0;
%}

%%
[A-Za-z]+  { num_words++; }
%%

int main() {
    yyin = fopen("input.txt", "r");
    yylex(); 
    printf("No. of words: %d", num_words);
    return 0;
}

int yywrap() {
    return 1;
}