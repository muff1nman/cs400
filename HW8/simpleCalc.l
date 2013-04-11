%option noyywrap

%{
#include "simpleCalc.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
 
%}

DECIMAL     ({DIGIT}+(\.{DIGIT}*)?)|({DIGIT}*\.{DIGIT}+) 
DIGIT       [0-9]
%%
{DIGIT}+	{ 
        yylval.ival = atoi(yytext); 
        printf("TOKEN: INTEGER (%d from '%s')", yylval.ival, yytext);
        return INTEGER; 
    }

{DECIMAL} { 
        yylval.fval = atof(yytext); 
        printf("TOKEN: FLOAT (%f from '%s')", yylval.fval, yytext);
        return FLOAT; 
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

main()
{
	yyparse();
}
