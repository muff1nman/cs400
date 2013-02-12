#define OUTPUTFILE "calc.tkn"

int yyparse(char const *filename);

extern FILE *yyin;
extern char *yytext;

