%{
    #include <stdio.h>
    #include <stdbool.h>
    #include <ctype.h>

    int identifierCount = 0;
    int keywordsCount = 0;
    bool flag = false;

    char keywords[64][20]= {
        "auto","double","int","struct",
        "break","else","long","switch",
        "case","enum","register","typedef",
        "char","extern","return","union",
        "const","cout","cin","float","short","unsigned",
        "continue","for","signed","void",
        "default","goto","sizeof","volatile",
        "do","if","static","while","asm",
        "dynamic_cast","namespace","reinterpret_cast",
        "bool","explicit","new","static_cast",
        "catch","false","operator","template",
        "class","friend","private","this"
        "const_cast","inline","public","throw",
        "delete","mutable","protected","true",
        "try","typeid","typename","using",
        "virtual","wchar_t"
    };
%}

between_quotes          ["].*["]
starting_hash           [#].* 
keyword_type            [a-z][a-zA-Z_]+
identifier_type         ^[_a-zA-Z][a-zA-Z0-9_]*
special_char            [^a-zA-Z0-9]

%%
{between_quotes}    ;
{starting_hash}     ;
{keyword_type} {
    flag = 0;
    int i;
    for(i = 0; i < sizeof(keywords)/sizeof(keywords[0]); i++) {
        if(strcmp(keywords[i], yytext) == 0) {  
            keywordsCount++;
            printf("%s : Keyword\n", keywords[i]);
            flag=1;
        }
    }
    if(flag == 0){
        if(isalpha(yytext[0]) || yytext[0] == '_') {
            identifierCount++;
            printf("%s : Identifier\n", yytext);
        }   
    }   
}
{special_char} ;
%%

int main() {
    yyin=fopen("input.cpp","r"); 
    yylex(); 
    printf("No. of Keywords %d\n", keywordsCount);
    printf("No. of Identifiers %d\n", identifierCount);
    return 0;
}

yywrap(){
    return 1;
}