/*
 * =====================================================================================
 *
 *       Filename:  additional.h
 *
 *    Description:  Some additional string funness
 *
 *        Version:  1.0
 *        Created:  02/12/2013 02:24:21 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Andrew DeMaria (muff1nman), ademaria@mines.edu
 *   Organization:  Colorado School of Mines
 *
 * =====================================================================================
 */

#ifndef ADDITIONAL_H
#define ADDITIONAL_H
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

void append(char s, char** string);

// edits the string to adhere to the doc conventions for non-graphical
// characters.
char* scrub(const char* string );

bool isGraphical( char x );


#endif
