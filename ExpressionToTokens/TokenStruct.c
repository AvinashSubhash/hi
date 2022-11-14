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


void displayStruct(struct varData* obj)       //Incomplete changes - modified all structure to single structure.
{
    int* res = obj[0]; 
    //printf("%d\n",*res);
    struct varData *obj1 = obj[2];
    switch(*res)
    {
        case CONSTANT:         
        struct constData *obj1 = obj[1];
        printf("Token Number: %d\n",obj1->tokenName);
        printf("Datatype: %d\n",obj1->datatype);
        int* value = obj1->data;
        printf("Data: %d\n",*value);
        break;

        case INT:
        struct varData *obj2 = obj[1];
        printf("Token Number: %d\n",obj2->tokenName);
        printf("Variable Name: %s\n",obj2->variableName);
        int* varvalue = obj2->dataValue;
        printf("Value: %d\n",*varvalue);
        break;

        default:
        printf("Error state . .\n"); 
    }
    
    if(*res==8)
    {

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