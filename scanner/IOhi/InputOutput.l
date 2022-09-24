PRINT "give"
INPUT "take"
VARIABLE_NAME [a-zA-Z]([a-zA-Z]|[0-9]|_)*
STRING \"([a-zA-Z]|[ ])*\"
%{

%}

%%
{PRINT}[ ]({STRING}|[0-9]|{VARIABLE_NAME})(","({STRING}|[0-9]|{VARIABLE_NAME}))* {printf("Printing expression");}
{INPUT}[ ]([0-9]|{VARIABLE_NAME}) {printf("Taking number:");}
%%

int main(void) {
    yylex();
    return 0;
}