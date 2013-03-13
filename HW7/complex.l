%option noyywrap

%{

%}

DIGIT   [0-9]
DECIMAL ({DIGIT}+(\.{DIGIT}*)?)|({DIGIT}*\.{DIGIT}+) 
%%

[\t ]+		/* ignore white space */ ;

{DECIMAL}  { printf("<real value=\"%s\">\n", yytext); }

imaginary   { printf("<imaginary value=\"%s\">\n", yytext); }

{DECIMAL}i   { printf("<complex value=\"%s\">\n", yytext); }

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
