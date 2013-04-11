%{
#include "simpleCalc.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

const char* reduce = "REDUCE: ";
extern int* integer_registers;
extern float* float_registers;

int register_index( const char* string );

%}

%union {
    float  fval;
    int    ival;
    char*  sval;
}

%token <sval> FREGISTER IREGISTER
%token <ival> INTEGER
%token <fval> FLOAT

%type <ival> iexpression iterm ifactor
%type <fval> fexpression fterm ffactor

%%
program: statement 
       | '{' statements'}'
;

statements: /* empty*/
          | statement ';' statements
;
statement:	IREGISTER '=' iexpression { 
                integer_registers[register_index($1)] = $3;
            }
    |   FREGISTER '=' fexpression { 
                float_registers[register_index($1) - 5] = $3;
            }
	|	iexpression		{ printf("= %d\n", $1); }
	|	fexpression		{ printf("= %f\n", $1); }
	;

iexpression:	iexpression '+' iterm { 
                $$ = $1 + $3; 
                printf("%s<iexpression>: <iexpression> + <iterm> value: %d\n",reduce,$$); 
            }
          |	iexpression '-' iterm { 
                $$ = $1 - $3; 
                printf("%s<iexpression>: <iexpression> - <iterm> value: %d\n",reduce,$$); 
            }
          |	iterm {
                $$ = $1;
                printf("%s<iexpression>: <iterm> value: %d\n",reduce,$$); 
            }
          ;

fexpression:	fexpression '+' fterm { 
                $$ = $1 + $3; 
                printf("%s<fexpression>: <fexpression> + <fterm> value: %f\n",reduce,$$); 
            }
          | fexpression '+' iterm { 
                $$ = $1 + $3; 
                printf("%s<fexpression>: <fexpression> + <iterm> value: %f\n",reduce,$$); 
            }
          | iexpression '+' fterm { 
                $$ = $1 + $3; 
                printf("%s<fexpression>: <iexpression> + <fterm> value: %f\n",reduce,$$); 
            }
          |	fexpression '-' fterm { 
                $$ = $1 - $3; 
                printf("%s<fexpression>: <fexpression> - <fterm> value: %f\n",reduce,$$); 
            }
          |	iexpression '-' fterm { 
                $$ = $1 - $3; 
                printf("%s<fexpression>: <iexpression> - <fterm> value: %f\n",reduce,$$); 
            }
          |	fexpression '-' iterm { 
                $$ = $1 - $3; 
                printf("%s<fexpression>: <fexpression> - <iterm> value: %f\n",reduce,$$); 
            }
          |	fterm {
                $$ = $1;
                printf("%s<fexpression>: <fterm> value: %f\n",reduce,$$); 
            }
          ;

iterm: iterm '*' ifactor { 
        $$ = $1 * $3; 
        printf("%s<iterm>: <iterm> * <ifactor> value: %d\n",reduce,$$);
      }
    | iterm '/' ifactor { 
        $$ = $1 / $3; 
        printf("%s<iterm>: <iterm> / <ifactor> value: %d\n",reduce,$$);
      }
    | ifactor {
        $$ = $1;
        printf("%s<iterm>: <ifactor> value: %d\n",reduce,$$);
      }
    ;

fterm: fterm '*' ffactor { 
        $$ = $1 * $3; 
        printf("%s<fterm>: <fterm> * <ffactor> value: %f\n",reduce,$$);
      }
    | iterm '*' ffactor { 
        $$ = $1 * $3; 
        printf("%s<fterm>: <iterm> * <ffactor> value: %f\n",reduce,$$);
      }
    | fterm '*' ifactor { 
        $$ = $1 * $3; 
        printf("%s<fterm>: <fterm> * <ifactor> value: %f\n",reduce,$$);
      }
    | fterm '/' ffactor { 
        $$ = $1 / $3; 
        printf("%s<fterm>: <fterm> / <ffactor> value: %f\n",reduce,$$);
      }
    | iterm '/' ffactor { 
        $$ = $1 / $3; 
        printf("%s<fterm>: <iterm> / <ffactor> value: %f\n",reduce,$$);
      }
    | fterm '/' ifactor { 
        $$ = $1 / $3; 
        printf("%s<fterm>: <fterm> / <ifactor> value: %f\n",reduce,$$);
      }
    | ffactor {
        $$ = $1;
        printf("%s<fterm>: <ffactor> value: %f\n",reduce,$$);
      }
    ;


ifactor: INTEGER {
            $$ = $1;
        }
        | IREGISTER {
            $$ = integer_registers[register_index($1)];
        }
;
ffactor: FLOAT {
            $$ = $1;
        }
        | FREGISTER {
            $$ = float_registers[register_index($1) - 5];
        }
;

%%

int register_index( const char* string ) {
    return string[1] - '0';
}
