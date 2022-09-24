ADDITION "+"
SUBTRACTION "-"
MULTIP "*"
DIVID "/"
VARIABLE_NAME [a-zA-Z]([a-zA-Z]|[0-9]|_)*

%{

%}

/* Basic two argument operations */
%%
(([0-9]|{VARIABLE_NAME})[ ]*{ADDITION}[ ]*([0-9]|{VARIABLE_NAME})";") {printf("\n Addition operation.\n");}

(([0-9]|{VARIABLE_NAME})[ ]*{SUBTRACTION}[ ]*([0-9]|{VARIABLE_NAME})";") {printf("\nSubtraction operation.\n");}

(([0-9]|{VARIABLE_NAME})[ ]*{MULTIP}[ ]*([0-9]|{VARIABLE_NAME})";") {printf("\nMultiplication operation.\n");}

(([0-9]|{VARIABLE_NAME})[ ]*{DIVID}[ ]*([0-9]|{VARIABLE_NAME})";") {printf("\nDivision operation.\n");}

[0-9]([ ]*({ADDITION}|{SUBTRACTION}|{MULTIP}|{DIVID})[ ]*([0-9]))* {printf("\nMulti-operation expression found!\n");}
%%

int main(void) {
    yylex();
    return 0;
}