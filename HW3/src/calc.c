// This file would normally be generated by Flex

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h> 
#include "calc.tab.h"
#include "types.h"

int yylex(Flow* flows)
{
   static int tokens = 0;
   
   int token;
   int yychar;

//   yychar = fgetc( yyin );
//
//   feed( yychar );
//
//   if ( isEndState( /* any */ ) ){
//       yytext = getValue();
//       resetStates( /* all  */);
//       return token;
//   } else { 
//       yylex(flows);
//   }
   
   //----------------------------------------------------------
   // This code is junk placeholder code to give an initial
   // lexer that will compile and run and do something.
   
   yychar = fgetc(yyin); // File assumed to be open and ready
   if (EOF == yychar)
   {
      token = END;
      yytext = (char *) malloc(11*sizeof(char));
      sprintf(yytext, "%i", tokens);
   }
   else
   {
      token = BAD;
      yytext = (char *) malloc(4*sizeof(char));
      if (isgraph(yychar)&&('#' != yychar))
         sprintf(yytext, "%c", yychar);
      else
         sprintf(yytext, "#%02X", (yychar&0xFF));
   }
   //----------------------------------------------------------
   
   return token;
}

int main(int argc, char *argv[])
{

   if (argc <= 1)
   {
      printf("USAGE: calc inputfilename\n");
      exit(EXIT_FAILURE);
   }
   
   yyparse(argv[1]);
   
   // uncommented for easier testing
   //printf("Hit ENTER to exit.");
   //fgetc(stdin);
   
   return 0;
}
