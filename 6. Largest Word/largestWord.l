%{
    #include <stdio.h>
    #include <string.h>
    int maxLen = 0;
    char *longestWord;
%}

%%
[a-zA-Z]+ {
    if(yyleng > maxLen) {
        longestWord = (char *)malloc(sizeof(char)* yyleng);
        strncpy(longestWord, yytext, yyleng);
        maxLen = yyleng;
    }
}
.|\n   {}
%%

int main() {
    yyin = fopen("input.txt", "r");
    yylex();
    printf("Longest word: %s\n", longestWord);
    printf("Longest word length: %d\n", maxLen);
    return 0;
}

int yywrap() {
    return 1;
}