// This file emulates the file that would normally be created by Bison
// This file would normally be generated by Bison

#include <stdio.h>
#include <stdlib.h>
#include "types.h"
#include "functions.h"
#include "calc.tab.h"

FILE *yyin = NULL;
char *yytext = NULL;

FlowNode* initNode(int paths, TokenType state){
    FlowNode* R = (FlowNode*) malloc( sizeof( FlowNode ));
    R->state = state;
    R->arraySize = paths;
    R->transitions = (FunctionNodePair*) malloc( sizeof(FunctionNodePair) * paths );
    R->markedForDeletion = false;
    // !NOTE! the transitions are not initializaed
    return R;
}

FlowNode* acceptingState( TokenType end_state ){
    FlowNode* final = (FlowNode*) malloc( sizeof( FlowNode ));
    final->state = end_state;
    final->arraySize = 0;
    final->transitions = NULL;
    final->markedForDeletion = false;
    return final;
}

FlowNode* init_ID(){
    FlowNode* R = initNode( 1, BAD );
    (R->transitions+0)->transition = &isDigit;
    (R->transitions+0)->nextNode = acceptingState( ID );
    return R;
}

FlowNode* init_BAD() {
    FlowNode* R = initNode( 1, BAD );
    (R->transitions+0)->transition = &notStart;
    (R->transitions+0)->nextNode = R;
    return R;
}

FlowNode* init_DIV(){
    FlowNode* node = initNode(2, DIV );
    FlowNode* eolcmt = initNode(1, EOLCMT );
    FlowNode* blkcmt = initNode(2, BAD );
    FlowNode* blkcmt_mid = initNode(3, BAD);

    (node->transitions+0)->transition = &isCharacter_slash;
    (node->transitions+0)->nextNode = eolcmt;

    (node->transitions+1)->transition = &isCharacterStar;
    (node->transitions+1)->nextNode = blkcmt;

    (eolcmt->transitions+0)->transition = &isAnythingbutEOFNEW;
    (eolcmt->transitions+0)->nextNode = eolcmt;

    (blkcmt->transitions+0)->transition = &isCharacterStar;
    (blkcmt->transitions+0)->nextNode = blkcmt_mid;

    // possibly route to EOF bad
    (blkcmt->transitions+1)->transition = &isNotCharacter_EOF;
    (blkcmt->transitions+1)->nextNode = blkcmt;

    (blkcmt_mid->transitions+0)->transition = &isCharacterStar;
    (blkcmt_mid->transitions+0)->nextNode = blkcmt_mid;

    (blkcmt_mid->transitions+1)->transition = &isCharacter_slash;
    (blkcmt_mid->transitions+1)->nextNode = acceptingState( BLKCMT );

    (blkcmt_mid->transitions+2)->transition = &anything;
    (blkcmt_mid->transitions+2)->nextNode = blkcmt;

    return node;
}

FlowNode* initLeftINT() {
    FlowNode* node = initNode(1, BAD);
    // we will take care of children in the call to initCenter
    return node;
}

FlowNode* initRightINT() {
    FlowNode* node = initNode( 3, INT );
    // we will take care of children in the call to initCenter
    return node;
}

// no return FlowNode* here because this function is already linked to the Right
// and Left nodes
void initCenterINT( FlowNode* leftchild, FlowNode* rightchild ) {
    FlowNode* fltNoE = initNode( 2, FLT );
    FlowNode* fltWithE = initNode( 1, FLT );
    FlowNode* intermediateE = initNode( 2, BAD );
    FlowNode* intermediatePlusMinus = initNode( 1, BAD );

    (leftchild->transitions+0)->transition = &isDigit;
    (leftchild->transitions+0)->nextNode = fltNoE;

    (rightchild->transitions+0)->transition = &isPeriod;
    (rightchild->transitions+0)->nextNode = fltNoE;
    (rightchild->transitions+1)->transition = &isDigit;
    (rightchild->transitions+1)->nextNode = rightchild;
    (rightchild->transitions+2)->transition = &isCharacter_E;
    (rightchild->transitions+2)->nextNode = intermediateE;

    (fltNoE->transitions+0)->transition = &isDigit;
    (fltNoE->transitions+0)->nextNode = fltNoE;
    (fltNoE->transitions+1)->transition = &isCharacter_E;
    (fltNoE->transitions+1)->nextNode = intermediateE;

    (intermediateE->transitions+0)->transition = &isDigit;
    (intermediateE->transitions+0)->nextNode = fltWithE;
    (intermediateE->transitions+1)->transition = &isPlusMinus;
    (intermediateE->transitions+1)->nextNode = intermediatePlusMinus;

    (intermediatePlusMinus->transitions+0)->transition = &isDigit;
    (intermediatePlusMinus->transitions+0)->nextNode = fltWithE;

    (fltWithE->transitions+0)->transition = &isDigit;
    (fltWithE->transitions+0)->nextNode = fltWithE;

}

FlowNode* initializeTree(){
    // TODO CHECK ALL MALOCS
    FlowNode* root = initNode( 16, BAD );

    (root->transitions+0)->transition = &isCharacter_R;
    (root->transitions+0)->nextNode = init_ID();

    (root->transitions+1)->transition = &isCharacter_EOF;
    (root->transitions+1)->nextNode = acceptingState( END );

    (root->transitions+2)->transition = &isCharacter_slash;
    (root->transitions+2)->nextNode = init_DIV();

    (root->transitions+3)->transition = &isDigit;
    (root->transitions+3)->nextNode = initRightINT();

    (root->transitions+4)->transition = &isPeriod;
    (root->transitions+4)->nextNode = initLeftINT();

    initCenterINT( (root->transitions+4)->nextNode, (root->transitions+3)->nextNode);

    (root->transitions+5)->transition = &isCharacterOP;
    (root->transitions+5)->nextNode = acceptingState( OPAREN );

    (root->transitions+6)->transition = &isCharacterCP;
    (root->transitions+6)->nextNode = acceptingState( CPAREN );

    (root->transitions+7)->transition = &isCharacterNewline;
    (root->transitions+7)->nextNode = acceptingState( NEWLINE );

    (root->transitions+9)->transition = &isCharacterStar;
    (root->transitions+9)->nextNode = acceptingState( MUL );

    (root->transitions+10)->transition = &isCharacterEquals;
    (root->transitions+10)->nextNode = acceptingState( ASSIGN );

    (root->transitions+11)->transition = &isCharacterEXP;
    (root->transitions+11)->nextNode = acceptingState( EXP );

    (root->transitions+12)->transition = &isCharacterPlus;
    (root->transitions+12)->nextNode = acceptingState( ADD );

    (root->transitions+13)->transition = &isCharacterMinus;
    (root->transitions+13)->nextNode = acceptingState( SUB );

    (root->transitions+14)->transition = &isCharacterSemi;
    (root->transitions+14)->nextNode = acceptingState( SEMI );

    (root->transitions+15)->transition = &notStart;
    (root->transitions+15)->nextNode = init_BAD();

    return root;
}

void destroyTree(FlowNode* root){
    printf("Destroying Node");
    int i;
    root->markedForDeletion = true;
    for (i = 0; i < root->arraySize; ++i ){
        // handle recursive
        if (( root->transitions + i )->nextNode->markedForDeletion ){
            // don't do anything because it will get handled soon
        } else {
            destroyTree((root->transitions + i)->nextNode);
        }
        (root->transitions + i)->nextNode = NULL;
    }
    free( root->transitions );
    root->transitions = NULL;
    free( root );
    root = NULL;
}

// TODO modify to use the string representation of token and have the token type
// be the enum TokenType
int ExportToken(FILE *yyout, TokenType token, char *yytext)
{
    fprintf(yyout, "<%s> %s\n", toString(token), ((yytext)? yytext:""));
    if (NULL != yytext)
       free(yytext);
    yytext = NULL;
    return 0;
}

int yyparse(char const *filename)
{
   FILE *yyout;
   TokenType token;
   FlowNode* root = initializeTree();

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

   while ((token=yylex(root, &current)) != END)
       ExportToken(yyout, token, yytext);
   ExportToken(yyout, token, yytext);

   free( current );
   
   fclose(yyin);
   fclose(yyout);
   destroyTree( root );
   return 0;
}

