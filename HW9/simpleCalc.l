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

float normalize_float( const char* float_string );

extern int verbose;

%}

%s COMMENT
%s ONELINECOMMMENT

DIGIT       [0-9]
DECIMAL     ({DIGIT}+(\.{DIGIT}*)?)|({DIGIT}*\.{DIGIT}+) 
%%

[rR][_A-Za-z]*[0-4] { yylval.ival = extract_reg(yytext); token(I_REG) ; return I_REG; }
[rR][_A-Za-z]*[5-9] { yylval.ival = extract_reg(yytext); token(F_REG); return F_REG; }
{DIGIT}+	{ yylval.ival = atoi(yytext); token(I_NUM); return I_NUM; }
{DECIMAL}	{ yylval.fval = atof(yytext); token(F_NUM); return F_NUM; }
{DECIMAL}[eE]-?{DIGIT}+ { yylval.fval = atof(yytext); token(F_NUM); return F_NUM; }

<INITIAL>{
            "/*" BEGIN(COMMENT); 
            "//" BEGIN(ONELINECOMMMENT);
}

<COMMENT>{
            "*/" BEGIN(INITIAL); token(COMMENT);
            [^*]+  
            "*"       
}

<ONELINECOMMMENT>{
    \n  BEGIN(INITIAL); token(COMMENT);
    [^\n]+
}

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
            case COMMENT: printf("TOKEN: %s \n", "COMMENT"); break;
			case 0    : printf("TOKEN: %s\n", "<<EOF>>"); break;
			default   : printf("TOKEN: %c\n", tkn); break;
		}
	}
}

// returns a zero based index for the first e|E in string otherwise returns -1.  
int find_e( const char* string ) {
    char* e_lower;
    char* e_upper;

    e_lower = strchr( string, (int) 'e' );
    e_upper = strchr( string, (int) 'E' );

    if( NULL == e_lower && NULL == e_upper ) {
        return -1;
    } else if ( NULL == e_lower ) {
        return e_upper - string;
    } else if ( NULL == e_upper ) {
        return e_lower - string;
    } else {
        return e_lower < e_upper ? 
            e_lower - string : e_upper - string;
    }
}

// This function extracts a float value from a string that contains a float
float normalize_float( const char* float_string ) {
    float value = 0;
    float base_value = 0;
    float exponent_value = 0;
    int e_index = find_e( float_string);

    // There is no exponential value so treat it like a regular float encoded in
    // a string
    if( e_index < 0 ) {
        return atof( float_string );
    } else {
        return atof( float_string );
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
