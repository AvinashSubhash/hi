#include<stdio.h>
#include<string.h>
#define INT 5
#define CHAR 6
#define STRING 7

struct storedData {
    int tokenName;
    char* variableName;
    void* dataValue;
};

void displayStruct(struct storedData obj)
{
    printf("\nVariable name: %s",obj.variableName);
    printf("\nToken: %d",obj.tokenName);
    if (obj.tokenName==INT)
        printf("\nData value: %d\n",*((int*)obj.dataValue));
    else if(obj.tokenName==CHAR)
        printf("\n Data value: %c\n",*((char*)obj.dataValue));
    else if(obj.tokenName==STRING)
        printf("\n Data value: %s\n",*((char*)obj.dataValue));
}
// Testing
int main() {
    char Varname[100];
    void* data;
    int datatype;
    printf("Enter the data is it is being stored properly:\n\n");
    printf("Enter the variable name:");
    scanf("%s",&Varname);
    //printf("Testing: %s",Varname);
    printf("Enter the tokenName:");
    scanf("%d",&datatype);
    struct storedData object_one;
    if(datatype==INT)
    {
        int dat;
        printf("Enter the value in variable:");
        scanf("%d",&dat);
        data = &dat;
        object_one.tokenName = INT;
    }
    else if(datatype==CHAR)
    {
        char dat;
        printf("Enter the value in variable:");
        scanf("%c",&dat);
        data = &dat;
        object_one.tokenName = CHAR;  
    }
        else if(datatype==STRING)
    {
        char* dat = "#";
        printf("Enter the value in variable:");
        scanf("%s",dat);
        data = &dat;
        object_one.tokenName = STRING;  
    }
    object_one.dataValue = data;
    object_one.variableName = Varname;
    displayStruct(object_one);

}