VARIABLE_NAME [a-zA-Z]([a-zA-Z]|[0-9]|_)*
INTEGER "Int "
FLOAT "Flo "
BOOL "Boo "
CHAR "Char "
INT_VAL (";"|("="[0-9]*";"))
DECIMAL (";"|[=][0-9]*[.][0-9]*";")

%{
int count1=0,count2=0,count3=0;
%}

/* Rules Section*/
%%
{INTEGER}{VARIABLE_NAME}{INT_VAL} {count1++;}
{FLOAT}{VARIABLE_NAME}{DECIMAL} {count2++;}
{BOOL}{VARIABLE_NAME}(";"|[=]"true"|"false"";") {count3++;}
%%

int main(void)
{
	// The function that starts the analysis
	yylex();
    if(count1)
        printf("\nInteger Detected\n");
    if (count2)
        printf("\nFloat Detected\n");
    if (count3)
        printf("\nBoolean Detected\n");
	return 0;
}