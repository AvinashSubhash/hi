yacc -d *.y
lex *.l
cc -lfl lex.yy.c y.tab.c
./a.out