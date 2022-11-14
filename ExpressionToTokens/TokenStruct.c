#include<stdio.h>
#include<stdlib.h>
#define INT 5
#define CHAR 6
#define STRING 7
#define CONSTANT 8
#define BRACKET 9
#define OPERATOR 4
#define VAR 3

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


// Testing
/*int main() {
    struct constData obj1;
    obj1.tokenName=8;
    obj1.datatype = 5;
    int data;
    printf("Enter the Integer:");
    scanf("%d",&data);
    obj1.data = &data;
    void* send[2];
    send[0]=&obj1.tokenName;
    send[1]=&obj1;
    displayStruct(send);
}*/