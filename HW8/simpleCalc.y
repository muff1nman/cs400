%{
#include "simpleCalc.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

const char* reduce = "REDUCE: ";

%}

%token NAME NUMBER
%%
statement:	NAME '=' expression
	|	expression		{ printf("= %d\n", $1); }
	;

expression:	expression '+' term { 
                printf("%s<expression>: <expression> + <term> value: %d\n",reduce,$$); 
                $$ = $1 + $3; 
            }
          |	expression '-' term { 
                printf("%s<expression>: <expression> - <term> value: %d\n",reduce,$$); 
                $$ = $1 - $3; 
            }
          |	term {
                printf("%s<expression>: <term> value: %d\n",reduce,$$); 
                $$ = $1;
            }
          ;

term: term '*' factor { 
        printf("%s<term>: <term> * <factor> value: %d\n",reduce,$$);
        $$ = $1 * $3; 
      }
    | term '/' factor { 
        printf("%s<term>: <term> / <factor> value: %d\n",reduce,$$);
        $$ = $1 / $3; 
      }
    | factor {
        printf("%s<term>: <factor> value: %d\n",reduce,$$);
        $$ = $1;
      }
    ;

factor: NUMBER
      ;
