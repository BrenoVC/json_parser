
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}


%%

true     {
          return TRUE;
        }

TRUE     {
          return TRUE;
        }

false     {
          return FALSE;
        }

FALSE     {
          return FALSE;
        }

null     {
          return NULO;
        }

NULL     {
          return NULO;
        }

[0-9]+  {
          yylval = atoi(yytext);
          return NUMBER;
        }

[a-zA-Z]+ {
          return WORD;
        }

[{]     {
          return OPEN_CURLYB;
        }

[}]     {
          return CLOSE_CURLYB;
        }

["]     {
          return QUOTATION_MARKS;
        }

[:]     {
          return DOUBLE_DOT;
        }

[,]     {
          return COMMA;
        }

[\0]     {
          return END_OF_FILE;
        }

[ \t]+ ;

.     {yyerror("Token nao reconhecido!\n");}


%%

int yywrap() {
  return 1;
}
