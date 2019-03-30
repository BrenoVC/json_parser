%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token OPEN_CURLYB CLOSE_CURLYB NUMBER TRUE FALSE NULO DOUBLE_DOT COMMA WORD END_OF_FILE OPEN_SQUAREDB CLOSE_SQUAREDB

%start SOFTWARE

%%

SOFTWARE:
    SOFTWARE JSON { printf("VALIDO\n"); }
    |
    ;

JSON:
    OPEN_CURLYB ITEM CLOSE_CURLYB
    ;

VALUE:
    WORD

    | NUMBER

    | JSON

    | ARRAY

    | TRUE

    | FALSE

    | NULO
    ;

ITEM:
    WORD DOUBLE_DOT VALUE
    
    | ITEM COMMA ITEM
    ;

ARRAY:
    OPEN_SQUAREDB ARRAY_VALUE CLOSE_SQUAREDB
    | OPEN_SQUAREDB CLOSE_SQUAREDB
    ;

ARRAY_VALUE:
    VALUE
    | ARRAY_VALUE COMMA ARRAY_VALUE
    ;
%%

void yyerror(char *s) {
    printf("INVALIDO\n");
}

int main() {
  yyparse();
    return 0;

}
