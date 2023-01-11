%{
    #include<stdio.h>
    #include<stdlib.h>
    #include<limits.h>
    extern FILE *yyin;
    int yylex();
    int yyerror();
%}

%union {
    int integer;
    char endVal;
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
%token <arg> endToken

%%
S:E Z {printf("Result is %d\n",$<integer>1);}
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
Z:endToken {char* data = $<arg.dataValue>1;
            $<endVal>$=*data;}
%%

int main()
{
    FILE *mainfile;
    char line[1024];
    mainfile = fopen("code_file.hi","r");
    while (fgets(line,1024,mainfile))
    {
        FILE *fp;
        fp = fopen("temp.txt","w+");
        fputs(line,fp);
        fclose(fp);
        yyin = fopen("temp.txt","r");
        //printf("Enter an expression\n");
        yyparse();
        printf("Valid Expression\n");
        fclose(yyin);
    }
    return 0;
}

int yyerror(char *s) {
    printf("Invalid expression\n");
    printf("Error: %s\n",s);
    exit(0);
    return 0;
}