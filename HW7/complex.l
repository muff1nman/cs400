%option noyywrap

%{
/*
 * Example based on code in lex & yacc by 
 * Levine, Mason and Brown
 */

%}
%%

[\t ]+		/* ignore white space */ ;

[a-zA-Z]+ {
	 printf("%s:  don't recognize, might be a noun\n", yytext);
	}

\&.|\n		{ ECHO; /* normal default anyway */ }

%%

main()
{
	yylex();
}
