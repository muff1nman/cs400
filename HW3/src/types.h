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

typedef enum  {
    ID, INT, FLT, OPAREN, CPAREN, ASSIGN, EXP, MUL, DIV, ADD, SUB, SEMI, BAD,
    NEWLINE, EOLCMT, BLKCMT, END 
} TokenType;

// returns a string based on the enum TokenType
const char* toString( TokenType x );

#endif
