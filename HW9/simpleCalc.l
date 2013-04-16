%option noyywrap

%{
// William L. Bahn
// Spring 2013
// Slightly crippled SimpleCalc

#include <stdio.h>
#include <string.h>
#include "simpleCalc.tab.h"

int extract_reg(char *s);
void token(int tkn);

extern int verbose;

%}

%%

[rR][_A-Za-z]*[0-4] { yylval.ival = extract_reg(yytext); token(I_REG) ; return I_REG; }
[rR][_A-Za-z]*[5-9] { yylval.ival = extract_reg(yytext); token(F_REG); return F_REG; }
[0-9]+	{ yylval.ival = atoi(yytext); token(I_NUM); return I_NUM; }
[0-9]+\.[0-9]*	{ yylval.fval = atof(yytext); token(F_NUM); return F_NUM; }
[ \t]	;		/* ignore white space */
\n    	;		/* ignore white space */
.	    {token(yytext[0]); return yytext[0];}
<<EOF>> {token(0); return 0;}

%%

/*---------------------------------------------------------------------------*/
/* 5. Other C code that we need.                                           */
 
yyerror(char *errmsg)
{
    fprintf(stderr, "%s\n", errmsg);
}

void token(int tkn)
{
	if (verbose)
	{

		switch(tkn)
		{
			case I_NUM: printf("TOKEN: %s (%i from %s)\n", "I_NUM", yylval.ival, yytext); break;
			case F_NUM: printf("TOKEN: %s (%g from %s)\n", "F_NUM", yylval.fval, yytext); break;
			case I_REG: printf("TOKEN: %s (%i from %s)\n", "I_REG", yylval.ival, yytext); break;
			case F_REG: printf("TOKEN: %s (%i from %s)\n", "F_REG", yylval.ival, yytext); break;
			case 0    : printf("TOKEN: %s\n", "<<EOF>>"); break;
			default   : printf("TOKEN: %c\n", tkn); break;
		}
	}
}

// This function assumes that the string passed is a properly recognized token
int extract_reg(char *s)
{
	int reg;
	
	while (*(s+1)) // Start with second character
		s++;
	reg = *s - '0'; // Convert to a number
	return ((reg<5)? reg : reg - 5); // Adjust fp reg index
}

int found_verbose( int argc, char** argv ) {
    if ( argc > 1 ) {
        return found_verbose_at( argv, argc - 1 );
    } else {
        return 0;
    }
}

int found_verbose_at( char** argv, int location ) {
    char* string = "-v";
    if ( strcmp(string,argv[location]) == 0 ){
        return 1;
    } else {
        return 0;
    }
}

int main(int argc, char *argv[])
{
	if (2 == argc)
	{
        if ( found_verbose( argc, argv ) == 0 ) {
            yyin = fopen(argv[1], "rt");
            if (!yyin)
            {
                printf("Failed to open input file <%s>\n", argv[1]);
                exit(1);
            }
        } else {
            verbose = 1;
            yyin = stdin;
        }
	} 
    else if ( 3 == argc ) {
        if ( found_verbose( argc, argv) != 1 ) {
            printf( "Incorrect arguments");
            exit(1);
        } else {
            verbose = 1;
            yyin = fopen(argv[1], "rt");
            if (!yyin)
            {
                printf("Failed to open input file <%s>\n", argv[1]);
                exit(1);
            }
        }

    }
	else {
		yyin = stdin;
    }
	
	yyparse();
}
