ADDITION "+"
SUBTRACTION "-"
MULTIP "*"
DIVID "/"
VARIABLE_NAME [a-zA-Z]([a-zA-Z]|[0-9]|_)*
DIGIT [0-9]+

%{

%}

/* Basic two argument operations */
%%
(({DIGIT}|{VARIABLE_NAME})[ ]*{ADDITION}[ ]*({DIGIT}|{VARIABLE_NAME})";") {printf("\n Addition operation.\n");}

(({DIGIT}|{VARIABLE_NAME})[ ]*{SUBTRACTION}[ ]*({DIGIT}|{VARIABLE_NAME})";") {printf("\nSubtraction operation.\n");}

(({DIGIT}|{VARIABLE_NAME})[ ]*{MULTIP}[ ]*([0-9]|{VARIABLE_NAME})";") {printf("\nMultiplication operation.\n");}

(({DIGIT}|{VARIABLE_NAME})[ ]*{DIVID}[ ]*([0-9]|{VARIABLE_NAME})";") {printf("\nDivision operation.\n");}

{DIGIT}([ ]*({ADDITION}|{SUBTRACTION}|{MULTIP}|{DIVID})[ ]*({DIGIT}))* {printf("\nMulti-operation expression found!\n");}
%%

int main(void) {
    yylex();
    return 0;
}