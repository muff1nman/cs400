%option noyywrap

%{
#include "simpleCalc.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int* integer_registers;
float* float_registers;

void init_registers();

char* convert_register( const char* string ) {
    char* toReturn = (char*) malloc(3*sizeof(char));
    if (!toReturn){
        perror("no more memory");
        exit(1);
    }

    toReturn[0] = string[0];
    toReturn[1] = string[strlen(string)-1];
    toReturn[2] = '\0';
    return toReturn;
}
 
%}

DECIMAL     ({DIGIT}+(\.{DIGIT}*)?)|({DIGIT}*\.{DIGIT}+) 
DIGIT       [0-9]
%%
{DIGIT}+	{ 
        yylval.ival = atoi(yytext); 
        printf("TOKEN: INTEGER (%d from '%s')\n", yylval.ival, yytext);
        return INTEGER; 
    }

{DECIMAL} { 
        yylval.fval = atof(yytext); 
        printf("TOKEN: FLOAT (%f from '%s')\n", yylval.fval, yytext);
        return FLOAT; 
    }

(r|R)[^0123456789\n ]*[01234] {
    yylval.sval = convert_register(yytext);
    printf("TOKEN: IREGISTER (%s from '%s')\n", yylval.sval, yytext);
    return IREGISTER;
}

(r|R)[^0123456789\n ]*[56789] {
    yylval.sval = convert_register(yytext);
    printf("TOKEN: FREGISTER (%s from '%s')\n", yylval.sval, yytext);
    return FREGISTER;
}

[ \t]	;		/* ignore white space */

\n	return 0;	/* logical EOF */

.	return yytext[0];


%%

/*---------------------------------------------------------------------------*/
/* 5. Other C code that we need.                                           */

yyerror(char *errmsg)
{
    fprintf(stderr, "ERROR: %s\n", errmsg);
}

void init_registers() {
    int i;
    integer_registers = (int*) malloc( sizeof(int) * 5 );
    float_registers = (float*) malloc( sizeof(float) * 5);
    if (!integer_registers || !float_registers ) {
        perror("Not enough memory");
        exit(1);
    }
    for(i = 0; i < 5; ++i ) {
        integer_registers[i] = 0;
        float_registers[i] = 0.0;
    }
}

main()
{
    init_registers();
	yyparse();
}
