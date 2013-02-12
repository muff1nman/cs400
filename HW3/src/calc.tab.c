// This file emulates the file that would normally be created by Bison
// This file would normally be generated by Bison

#include <stdio.h>
#include <stdlib.h>
#include "types.h"

#include "calc.tab.h"

FILE *yyin = NULL;
char *yytext = NULL;

// TODO modify to use the string representation of token and have the token type
// be the enum TokenType
int ExportToken(FILE *yyout, int token, char *yytext)
{
    fprintf(yyout, "<%03i> %s\n", token, ((yytext)? yytext:""));
    if (yytext)
       free(yytext);
    yytext = NULL;
    return 0;
}

int yyparse(char const *filename)
{
   FILE *yyout;
   int token;
   FlowNode* root;

   //initialize current to an empty string
   char* current = (char*) malloc(sizeof(char));
   *current = '\0';
   
   yyin = fopen(filename, "rt");
   if (!yyin)
   {
      printf("File %s failed to open.\n", filename);
      return -1;
   }

   yyout = fopen(OUTPUTFILE, "wt");
   if (!yyout)
   {
      printf("File %s failed to open.\n", OUTPUTFILE);
      return -2;
   }

   while (token=yylex(root, &current))
      ExportToken(yyout, token, yytext);
   
   fclose(yyin);
   fclose(yyout);
   
   return 0;
}

