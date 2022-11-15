INTEGER [0-9]+
OPERATOR ("+"|"-"|"*"|"/")
BRACKETS_OPEN ("{"|"("|"[")
BRACKETS_CLOSE ("}"|")"|"]")
VARIABLE_NAME [a-zA-Z]([a-zA-Z]|[0-9]|_)*
%{
    #ifndef YYSTYPE
    #define YYSTYPE struct varData
    #endif
    #include "TokenStruct.c"
    #include "y.tab.h"
    extern struct varData yylval;
%}

%%
{INTEGER} {
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

{VARIABLE_NAME} {
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
" " {}
%%
