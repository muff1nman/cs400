%option noyywrap

%{

%}

DIGIT   [0-9]

%%

[\t ]+		/* ignore white space */ ;

(-?{DIGIT}+(\.{DIGIT}*)?)|(-?{DIGIT}*\.{DIGIT}+)  { printf("<real value=\"%s\">\n", yytext); }

b   { printf("<imaginary value=\"%s\">\n", yytext); }

c   { printf("<compex value=\"%s\">\n", yytext); }

\+   { printf("<add value=\"%s\">\n", yytext); }

-   { printf("<sub value=\"%s\">\n", yytext); }

\n  {ECHO;}

%%

int main(int argc, char** argv)
{
    if ( argc > 1 ) {
        yyin = fopen( argv[1], "r" );
    } else {
        yyin = stdin;
    }

	yylex();
}
