#include<stdio.h>
#include<stdlib.h>
#define INT 5
#define CHAR 6
#define STRING 7
#define CONSTANT 8
#define BRACKET 9
#define OPERATOR 4
#define VAR 3
#define PLUS 10
#define MINUS 11
#define MULT 12
#define DIV 13
#define END 1

struct varData {
    int tokenName;
    int datatype;
    char* variableName;
    void* dataValue;
};


void displayStruct(struct varData *obj)       //Incomplete changes - modified all structure to single structure.
{
    //struct varData *obj = obx;
    int res = obj->tokenName; 
    //printf("%d\n",*res);
    switch(res)
    {
        case CONSTANT:        
        printf("\nToken Number: %d\n",obj->tokenName);
        printf("Datatype: %d\n",obj->datatype);
        int* value = obj->dataValue;
        printf("Data: %d\n",*value);
        break;

        case INT:
        printf("Token Number: %d\n",obj->tokenName);
        printf("Variable Name: %s\n",obj->variableName);
        int* varvalue = obj->dataValue;
        printf("Value: %d\n",*varvalue);
        break;

        case OPERATOR:
        printf("Token Number: %d\n",obj->tokenName);
        char* charvalue = obj->dataValue;
        printf("Value: %c\n",*charvalue);
        break;

        default:
        printf("Error state . .\n"); 
    }
    
}


