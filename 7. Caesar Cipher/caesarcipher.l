%{
    /*
     *  Lex Program to implement Caesar Cipher
     *  @author: Nidhi Verma
     */
    #include <stdio.h>
    #include <ctype.h>
    int key;
%}

%%
[a-zA-Z]    { 
    char e;
    if(isupper(yytext[0])) {    
        e = (yytext[0] - 65 + key) % 26 + 65;
    }
    else {
        e = (yytext[0] - 97 + key) % 26 + 97;
    }
    fprintf(yyout, "%c", e);
}
.|\n {fprintf(yyout, "%c", yytext[0]);}
%%

int main() {
    printf("Enter key: ");
    scanf("%d", &key);
    yyin = fopen("plain.txt", "r");
    yyout = fopen("cipher.txt","w");
    yylex();
}

int yywrap() {
    return 1;
}
