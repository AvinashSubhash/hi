INTEGER [0-9]+
OPERATOR ("+"|"-"|"*"|"/")
BRACKETS_OPEN ("{"|"("|"[")
BRACKETS_CLOSE ("}"|")"|"]")
VARIABLE_NAME [a-zA-Z]([a-zA-Z]|[0-9]|_)*
STRING [^"\n]*
OUTPUT "hi "["]([^"]|\\(.|\n))*["]
END ";"
%{
    #ifndef YYSTYPE
    #define YYSTYPE struct varData
    #endif
    #include "TokenStruct.c"
    #include "y.tab.h"
    #include<limits.h>
    extern struct varData yylval;
    extern char* args_IO[1000];
    extern int args_IO_POINTER; 
    int point=0;
%}

%%
{INTEGER} {
                //printf("%d\n",point++);
                int data = atoi(yytext);
                //printf("%d",data);
                struct varData obj1;
                //printf("%d",data);
                obj1.tokenName = CONSTANT;
                //printf("%d",data);
                obj1.datatype = INT;
                //printf("%d",data);
                obj1.dataValue = &data;
                //displayStruct(&obj1);
                yylval = obj1;
                return numToken;
          }

"hi " {
                char* data = yytext;
                struct varData obj1;
                obj1.tokenName = OUTPUT;
                yylval = obj1;
                return outToken;
    }

"," {
                char* data = yytext;
                struct varData obj1;
                obj1.tokenName = OUTPUT;
                yylval = obj1;
                return seperateToken;
}

{VARIABLE_NAME} {
                 //printf("%d\n",point++);
                 char* data = yytext;
                 //printf("%p %p",&data,&yytext); Both the variables have different address.
                 struct varData obj1;
                 obj1.tokenName = INT;
                 obj1.variableName = data;
                 obj1.dataValue = &obj1.tokenName;
                 //displayStruct(&obj1);
                yylval = obj1;
                return dump; // Dummy return token (variable not included now)
                }
{OPERATOR} {
                //printf("%d\n",point++);
                char* data = yytext;
                struct varData obj1;
                obj1.tokenName = 4;
                obj1.dataValue = data;
                //displayStruct(&obj1);
                yylval = obj1;
                if(*data=='+')
                {
                    obj1.datatype = PLUS;
                    return pToken;
                }
                else if(*data=='-')
                {
                    obj1.datatype = MINUS;
                    return mToken;
                }
                else if(*data=='*')
                {
                    obj1.datatype = MULT;
                    return muToken;
                }
                else if(*data=='/')
                {
                    obj1.datatype = DIV;
                    return dToken;
                }
           }
{END} {
        char* data = yytext;
        struct varData obj1;
        obj1.tokenName = 1;
        obj1.dataValue = data;
        //displayStruct(&obj1);
        yylval = obj1;
        return endToken;
        }


["]{STRING}["] {
                char* data = yytext;
                struct varData obj1;
                obj1.tokenName = 7;
                obj1.dataValue = data;
                yylval = obj1;
                //printf("%s\n",obj1.dataValue);
                return stringToken;
                }

[ \n] {}
%%
