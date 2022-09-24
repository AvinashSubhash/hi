PRINT "give"
INPUT "take"
VARIABLE_NAME [a-zA-Z]([a-zA-Z]|[0-9]|_)*
%{

%}

%%
{PRINT}[ ]([0-9]|{VARIABLE_NAME}) {printf("Printing number:");}
{INPUT}[ ]([0-9]|{VARIABLE_NAME}) {printf("Taking number:");}
%%

int main(void) {
    yylex();
    return 0;
}