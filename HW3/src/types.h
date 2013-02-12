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


//!NOTE! this has to reflect the number of types in the following enum
//       This is because of a hack to use the enum as array indices.
static const size_t NUM_TYPES = 17;

typedef enum {
    ID, INT, FLT, OPAREN, CPAREN, ASSIGN, EXP, MUL, DIV, ADD, SUB, SEMI, BAD,
    NEWLINE, EOLCMT, BLKCMT, END 
} TokenType;

typedef enum {
    CONTINUE, NEXT, ABORT
} State;

// returns a string based on the enum TokenType
const char* toString( TokenType x );

// function type
typedef State (*Function)( char );

//type -> arrayfunctions
//        currentFuncIndex
//        arraySize
//        char* begin
//
//each function returns one of the following: continue, next, abort

typedef struct {
    size_t arraySize;
    char* begin;
    size_t currentFunc;
    Function* functions;
} Flow;

#endif
