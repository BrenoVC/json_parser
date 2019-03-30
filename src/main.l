
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}


LETTER   [a-zA-Z0-9]
NUM  [0-9]

WORD  {LETTER}+
INTERGER  {NUM}+

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

{INTERGER}+([.]{INTERGER}+)?  {
          yylval = atof(yytext);
          return NUMBER;
        }

["]{WORD}([ ]{WORD})*["] {
          return WORD;
        }

[{]     {
          return OPEN_CURLYB;
        }

[}]     {
          return CLOSE_CURLYB;
        }

\[     {
          return OPEN_SQUAREDB;
        }

\]     {
          return CLOSE_SQUAREDB;
        }

[:]     {
          return DOUBLE_DOT;
        }

[,]     {
          return COMMA;
        }

[\n] ;

[ \t]+ ;

.


%%

int yywrap() {
  return 1;
}
