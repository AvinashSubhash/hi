%{
    #include<stdio.h>
    #include<stdlib.h>
    extern FILE *yyin;
%}

%union {
    int integer;
    struct varData {
    int tokenName;
    int datatype;
    char* variableName;
    void* dataValue;
        } arg;
}

%token <arg> numToken
%token <arg> pToken
%token <arg> mToken
%token <arg> muToken
%token <arg> dToken
%token dump
%token <arg> finToken

%%
S:E {printf("Result is %d\n",$<integer>$);}
;
E:E P T {$<integer>$=$<integer>1+$<integer>3;}
|E K T {$<integer>$=$<integer>1-$<integer>3;}
|T
;
P:pToken {
            int* data = $<arg.dataValue>1;    
            $<integer>$=*data;}
;
K:mToken {int* data = $<arg.dataValue>1;    
            $<integer>$=*data;}
;
T:T G F {$<integer>$=$<integer>1*$<integer>3;}
|T D F {$<integer>$=$<integer>1/$<integer>3;}
|F {$<integer>$=$<integer>1;}
;
G:muToken {int* data = $<arg.dataValue>1;    
            $<integer>$=*data;}
;
D:dToken {int* data = $<arg.dataValue>1;    
            $<integer>$=*data;}
;
F:numToken {int* data = $<arg.dataValue>1;    
            $<integer>$=*data;}
;
%%

int main()
{
    yyin = fopen("code_file.hi","r");
    printf("Enter an expression\n");
    yyparse();
    printf("Valid Expression\n");
    fclose(yyin);
    return 0;
}

yyerror(char *s) {
    printf("Invalid expression\n");
    exit(0);
}