%{
#include "simpleCalc.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

const char* reduce = "REDUCE: ";
extern int* integer_registers;
extern float* float_registers;
int print = 0;

int register_index( const char* string );
void print_registers();

%}

%union {
    float  fval;
    int    ival;
    char*  sval;
}

%token <sval> FREGISTER IREGISTER
%token <ival> INTEGER
%token <fval> FLOAT

%right '^'

%type <ival> iexpression iterm ifactor ipower ineg
%type <fval> fexpression fterm ffactor fpower fneg

%%
program: statement {
            print = 1;
       }
       | '{' statements'}' {
            print_registers();
       }
;

statements: /* empty*/
          | statement ';' statements
;
statement:	IREGISTER '=' iexpression { 
                if (print == 1 ) printf("= %d\n", integer_registers[register_index($1)]);
                integer_registers[register_index($1)] = $3;
            }
    |   FREGISTER '=' fexpression { 
                if (print == 1 ) printf("= %f\n", float_registers[register_index($1)-5]);
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

ifactor: '-' ifactor {
            $$ = -1 * $2;
            printf("%s<ifactor>: - <ifactor> value: %d\n", reduce, $$);
       }
       | ineg {
            $$ = $1;
            printf("%s<ifactor>: <ineg> value: %d\n", reduce, $$);
       }
       ;

ffactor: '-' ffactor {
            $$ = -1.0 * $2;
            printf("%s<ffactor>: - <ffactor> value: %f\n", reduce, $$);
       }
       | fneg {
            $$ = $1;
            printf("%s<ffactor>: <fneg> value: %f\n", reduce, $$);
       }
;

ineg: ipower {
        $$ = $1;
        printf("%s<ifactor>: <ipower> value: %d\n",reduce,$$);
      }
       ;

fneg: fneg '^' fneg {
        $$ = pow($1,$3);
        printf("%s<fneg>: <fneg> ^ <fneg> value: %f\n",reduce,$$);
      }
       | ineg '^' ineg  {
        $$ = pow($1,$3);
        printf("%s<fneg>: <ineg> ^ <ineg> value: %f\n",reduce,$$);
      }
       | ineg '^' fneg  {
        $$ = pow($1,$3);
        printf("%s<fneg>: <ineg> ^ <fneg> value: %f\n",reduce,$$);
      }
       | fneg '^' ineg  {
        $$ = pow($1,$3);
        printf("%s<fneg>: <fneg> ^ <ineg> value: %f\n",reduce,$$);
      }
       | fpower
       ;


ipower: INTEGER {
            $$ = $1;
        }
        | IREGISTER {
            $$ = integer_registers[register_index($1)];
        }
;
fpower: FLOAT {
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

void print_registers() {
    int i = 0;
    for( i = 0; i<5; ++i ) {
        printf("R%d: %d\n", i, integer_registers[i] );
    }
    for( i = 0; i<5; ++i ) {
        printf("R%d: %f\n", i+5, float_registers[i] );
    }
}

