%option noyywrap

%{
#include "simpleCalc.tab.h"
extern int yylval;
%}

%%
[0-9]+	{ yylval = atoi(yytext); return NUMBER; }
[ \t]	;		/* ignore white space */
\n	return 0;	/* logical EOF */
.	return yytext[0];
%%
/*---------------------------------------------------------------------------*/
/* 5. Other C code that we need.                                           */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
 
yyerror(char *errmsg)
{
    fprintf(stderr, "%s\n", errmsg);
}

main()
{
	yyparse();
}
