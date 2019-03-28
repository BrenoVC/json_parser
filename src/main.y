%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token OPEN_CURLYB CLOSE_CURLYB NUMBER TRUE FALSE NULO ARRAY DOUBLE_DOT COMMA QUOTATION_MARKS WORD END_OF_FILE

%start SOFTWARE

%%

SOFTWARE:
    SOFTWARE JSON END_OF_FILE { printf("VALIDO\n"); }
    | JSON { printf("INVALIDO\n"); }
    ;

JSON:
    OPEN_CURLYB ITEM CLOSE_CURLYB { printf("JSON found\n"); }
    ;

STRING:
    QUOTATION_MARKS WORD QUOTATION_MARKS { printf("Achei um string!\n"); }
    ;

VALUE:
    STRING {
    printf("Achei um string!\n");
    }

    | NUMBER {
    printf("NUMBER found!\n");
    }

    | JSON

    | ARRAY

    | TRUE

    | FALSE

    | NULO
    ;

ITEM:
    STRING DOUBLE_DOT VALUE { printf("ITEM found\n"); }
    
    | ITEM COMMA ITEM
    ;

%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main() {
  yyparse();
    return 0;

}
