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

bool isCharacter( char supplied, char desired );

bool isDigit( char supplied );

bool isCharacter_R( char supplied );

bool isCharacter_EOF( char supplied );

bool anything( char supplied );

bool notStart( char supplied );

#endif
