%option noyywrap

%{
/*
 * Example based on code in lex & yacc by 
 * Levine, Mason and Brown
 */

%}
%%

[\t ]+		/* ignore white space */ ;

ski |
bike |
hike |
read |
swim |
surf |
climb |
ride |
go		{ printf("%s: is a verb\n", yytext); }

I |
you |
he |
she |
we |
it |
they		{ printf("%s: is a pronoun\n", yytext); }

mountain |
ocean |
snowboard |
trail |
elk 		{ printf("%s: is a noun\n", yytext); }

for |
and |
nor |
but |
yet   { printf("%s: is a conjunction\n", yytext); }

interesting |
sad |
happpy |
round |
big  { printf("%s: is an adjective\n", yytext); }

extremely |
slowly |
incredibly |
often |
only  { printf("%s: is an adverb\n", yytext); }


[a-zA-Z]+ {
	 printf("%s:  don't recognize, might be a noun\n", yytext);
	}

\&.|\n		{ ECHO; /* normal default anyway */ }

%%

main()
{
	yylex();
}
