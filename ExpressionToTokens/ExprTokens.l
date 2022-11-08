INTEGER [0-9]+
OPERATOR ("+"|"-"|"*"|"/")
BRACKETS_OPEN ("{"|"("|"[")
BRACKETS_CLOSE ("}"|")"|"]")

%{

%}

%%
{INTEGER} {printf("INTEGER-(%s) ",yytext);}
{OPERATOR} {printf("OPERATOR-(%s) ",yytext);}
{BRACKETS_OPEN} {printf("BRACKET-OPEN-(%s) ",yytext);}
{BRACKETS_CLOSE} {printf("BRACKET-CLOSE-(%s) ",yytext);}
" " {}
%%

int main(void) {
    yylex();
    return 0;
}