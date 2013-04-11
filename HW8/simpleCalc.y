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

/*%left '^'*/
%right EXPON

%type <ival> iexpression iterm ifactor ipower ineg iexp
%type <fval> fexpression fterm ffactor fpower fneg fexp

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

fneg: fpower '^' fexp %prec EXPON {
        $$ = pow($1,$3);
        printf("%s<fneg>: <fpower> ^ <fexp> value: %f\n",reduce,$$);
      }
      | fpower '^' fneg %prec EXPON {
        $$ = pow($1,$3);
        printf("%s<fneg>: <fpower> ^ <fneg> value: %f\n",reduce,$$);
      }
       | ipower '^' iexp  %prec EXPON  {
        $$ = pow($1,$3);
        printf("%s<fneg>: <ipower> ^ <iexp> value: %f\n",reduce,$$);
      }
       | ipower '^' ineg  %prec EXPON  {
        $$ = pow($1,$3);
        printf("%s<fneg>: <ipower> ^ <ineg> value: %f\n",reduce,$$);
      }
       | ipower '^' fexp  %prec EXPON  {
        $$ = pow($1,$3);
        printf("%s<fneg>: <ipower> ^ <fexp> value: %f\n",reduce,$$);
      }
       | ipower '^' fneg  %prec EXPON  {
        $$ = pow($1,$3);
        printf("%s<fneg>: <ipower> ^ <fneg> value: %f\n",reduce,$$);
      }
       | fpower '^' iexp  %prec EXPON  {
        $$ = pow($1,$3);
        printf("%s<fneg>: <fpower> ^ <iexp> value: %f\n",reduce,$$);
      }
       | fpower '^' ineg  %prec EXPON  {
        $$ = pow($1,$3);
        printf("%s<fneg>: <fpower> ^ <ineg> value: %f\n",reduce,$$);
      }
       | fpower {
        $$ = $1;
        printf("%s<fneg>: <fpower> value: %f\n", reduce, $$);
}
       ;

fexp: '-' fneg {
        $$ = -1 * $2;
        printf("%s<fexp>: - <fexp> value: %f\n", reduce, $$);
};


iexp: '-' iexp {
        $$ = -1 * $2;
        printf("%s<iexp>: - <iexp> value: %d\n", reduce, $$);
}
       | ipower {
            $$ = $1;
            printf("%s<iexp>: <fpower> value: %d\n", reduce, $$);
       }
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

