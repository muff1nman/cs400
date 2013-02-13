// This file would normally be generated by Flex

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h> 
#include <string.h>
#include "types.h"
#include "calc.tab.h"
#include "additional.h"

FlowNode* functionWants( char nextChar, FlowNode* current ){
    int i;
    for( i = 0; i < current->arraySize; ++i ){
        if ((*((current->transitions + i)->transition))( nextChar )){
            return (current->transitions + i)->nextNode;
        }
    }
    return NULL;
}

int yylex( FlowNode* root, char** start)
{
    //left over from last iteration
    static int tokens = 0;
    int yychar;
    FlowNode* current = root;
    FlowNode* next;

    // get only if tokens empty.
    if ( tokens == 0 ) {
        yychar = fgetc( yyin );
    } else {
        yychar = tokens;
        tokens = 0;
    }

    // do special for EOF
    if ( yychar == EOF ) {
        yytext = (char*) malloc( sizeof(char) * 4 );
        strcpy( yytext, "end");
        return END;
    }
    
    while( (next = functionWants( yychar, current )) != NULL ) {
        current = next;
        append( yychar, start);
        //get new character
        yychar = fgetc( yyin );
        // do special for EOF
        if ( yychar == EOF ) {
            yytext = (char*) malloc( sizeof(char) * 4 );
            strcpy( yytext, "end");
            return END;
        }
        // TODO check all input for error.  
    }

    // save left over character
    tokens = yychar;
    // populate yytext based on data collected
    yytext = (char*) malloc( sizeof(char) * strlen(*start) + 1 );
    strcpy( yytext, *start );
    scrub( &yytext );
    // empty *start
    free(*start);
    *start = (char*) malloc(sizeof(char));
    **start = '\0';
    
    // get the token from the current
    return current->state;
}

int main(int argc, char *argv[])
{

   if (argc <= 1)
   {
      printf("USAGE: calc inputfilename\n");
      exit(EXIT_FAILURE);
   }
   
   yyparse(argv[1]);
   
   return 0;
}
