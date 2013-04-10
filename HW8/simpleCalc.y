%{
#include "simpleCalc.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

const char* reduce = "REDUCE: ";

%}

%union {
    double fval;
    int    ival;
    char*  sval;
}

%token <sval> NAME
%token <ival> NUMBER

%type <ival> expression term factor

%%
statement:	NAME '=' expression
	|	expression		{ printf("= %d\n", $1); }
	;

expression:	expression '+' term { 
                $$ = $1 + $3; 
                printf("%s<expression>: <expression> + <term> value: %d\n",reduce,$$); 
            }
          |	expression '-' term { 
                $$ = $1 - $3; 
                printf("%s<expression>: <expression> - <term> value: %d\n",reduce,$$); 
            }
          |	term {
                $$ = $1;
                printf("%s<expression>: <term> value: %d\n",reduce,$$); 
            }
          ;

term: term '*' factor { 
        $$ = $1 * $3; 
        printf("%s<term>: <term> * <factor> value: %d\n",reduce,$$);
      }
    | term '/' factor { 
        $$ = $1 / $3; 
        printf("%s<term>: <term> / <factor> value: %d\n",reduce,$$);
      }
    | factor {
        $$ = $1;
        printf("%s<term>: <factor> value: %d\n",reduce,$$);
      }
    ;

factor: NUMBER
      ;
