/*
 * =====================================================================================
 *
 *       Filename:  types.h
 *
 *    Description:  Defines the types that are valid for the language
 *
 *        Version:  1.0
 *        Created:  02/11/2013 09:15:45 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Andrew DeMaria (muff1nman), ademaria@mines.edu
 *   Organization:  Colorado School of Mines
 *
 * =====================================================================================
 */

#ifndef TYPES_H
#define TYPES_H
#include <stdlib.h>
#include <stdbool.h>

//!NOTE! this has to reflect the number of types in the following enum
//       This is because of a hack to use the enum as array indices.
static const size_t NUM_TYPES = 17;

typedef enum {
    ID, INT, FLT, OPAREN, CPAREN, ASSIGN, EXP, MUL, DIV, ADD, SUB, SEMI, BAD,
    NEWLINE, EOLCMT, BLKCMT, END 
} TokenType;

// returns a string based on the enum TokenType
const char* toString( TokenType x );

// function type, NOTE the second char should be an extra paramater
typedef bool (*Function)( char );

struct FlowNode;
struct FunctionNodePair;
typedef struct FlowNode FlowNode;
typedef struct FunctionNodePair FunctionNodePair;

struct FunctionNodePair {
    Function transition;
    FlowNode* nextNode;
};

struct FlowNode{
    TokenType state;
    size_t arraySize;
    FunctionNodePair* transitions;
    bool markedForDeletion; // Note this is a workaround so I don't have to implement a tree traversal algorithm :P
};

#endif
