/*
 * =====================================================================================
 *
 *       Filename:  functions.h
 *
 *    Description:  A compilation of all the functions to use as transistions.
 *
 *        Version:  1.0
 *        Created:  02/12/2013 12:41:48 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Andrew DeMaria (muff1nman), ademaria@mines.edu
 *   Organization:  Colorado School of Mines
 *
 * =====================================================================================
 */

#ifndef FUNCTIONS_H
#define FUNCTIONS_H

#include <stdlib.h>
#include <stdbool.h>
#include "types.h"
#include <stdio.h>

// THIS WOULD BE SOOO MUCH EASIER WITH TEMPLATES!

bool isCharacter( char supplied, char desired );

bool isDigit( char supplied );

bool isCharacter_R( char supplied );

bool isCharacter_EOF( char supplied );

bool isCharacter_slash( char supplied );

bool anything( char supplied );

bool notStart( char supplied );

bool isAnythingbutEOFNEW( char supplied );

bool isCharacterStar( char supplied );

bool isNotCharacter_EOF( char supplied );

bool isPeriod( char supplied );

bool isPlusMinus( char supplied );

bool isCharacter_E( char supplied );

bool isCharacterCP( char supplied );

bool isCharacterOP( char supplied );

bool isCharacterNewline( char supplied );

bool isCharacterPlus( char supplied );

bool isCharacterMinus( char supplied );

bool isCharacterSemi( char supplied );

bool isCharacterEXP( char supplied );

bool isCharacterEquals( char supplied );

#endif
