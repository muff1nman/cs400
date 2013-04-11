%option noyywrap

%{
#include "simpleCalc.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

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

(r|R)[^0123456789]*{DIGIT} {
    yylval.sval = convert_register(yytext);
    printf("TOKEN: REGISTER (%s from '%s')\n", yylval.sval, yytext);
    return REGISTER;
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
