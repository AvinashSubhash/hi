INTEGER [0-9]+
OPERATOR ("+"|"-"|"*"|"/")
BRACKETS_OPEN ("{"|"("|"[")
BRACKETS_CLOSE ("}"|")"|"]")
VARIABLE_NAME [a-zA-Z]([a-zA-Z]|[0-9]|_)*
%{
    #include "TokenStruct.c"
%}

%%
{INTEGER} {
                int data = atoi(yytext);
                //printf("%d",data);
                struct constData obj1;
                //printf("%d",data);
                obj1.tokenName = CONSTANT;
                //printf("%d",data);
                obj1.datatype = INT;
                //printf("%d",data);
                obj1.data = &data;
                void* send[2];
                send[0] = &obj1.tokenName;
                send[1] = &obj1;
                displayStruct(send);
          }

{VARIABLE_NAME} {
                 char* data = yytext;
                 //printf("%p %p",&data,&yytext); Both the variables have different address.
                 struct varData obj1;
                 obj1.tokenName = INT;
                 obj1.variableName = data;
                 obj1.dataValue = &obj1.tokenName;
                 void* send[2];
                 send[0] = &obj1.tokenName;
                 send[1] = &obj1;
                 displayStruct(send);

                }
{OPERATOR} {printf("OPERATOR-(%s) \n",yytext);}
{BRACKETS_OPEN} {printf("BRACKET-OPEN-(%s) \n",yytext);}
{BRACKETS_CLOSE} {printf("BRACKET-CLOSE-(%s) \n",yytext);}
" " {}
%%

int main(void) {
    yylex();
    return 0;
}