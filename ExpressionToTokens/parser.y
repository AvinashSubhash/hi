%{
    #include<stdio.h>
    #include<stdlib.h>
%}

%token numToken
%token opToken

%%
S:E {printf("Result is %d\n",$$);}
;
E:EPT {$$=$1+$3;}
|EPT {$$=$1-$3;}
|T
;
P:opToken.dataValue {}
;
T:T'*'F {$$=$1*$3;}
|T'/'F {$$=$1/$3;}
|F {$$=$1;}
;
F:numToken.dataValue {$$=$1;}
;
%%