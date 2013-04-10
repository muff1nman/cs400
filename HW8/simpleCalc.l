%option noyywrap

%{
#include "simpleCalc.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
 
%}

%%
[0-9]+	{ yylval.ival = atoi(yytext); return NUMBER; }
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
