/*
 * =====================================================================================
 *
 *       Filename:  test.c
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  02/12/2013 08:59:15 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Andrew DeMaria (muff1nman), ademaria@mines.edu
 *   Organization:  Colorado School of Mines
 *
 * =====================================================================================
 */
#include <stdlib.h>

#include "functions.h"

int main() {
    printf("isDigit('1'): %s\n", isDigit( '1') ? "true":"false");
    printf("isDigit('0'): %s\n", isDigit( '0') ? "true":"false");
    printf("isDigit('9'): %s\n", isDigit( '9') ? "true":"false");
    printf("isDigit('a'): %s\n", isDigit( 'a') ? "true":"false");
    printf("isDigit('='): %s\n", isDigit( 'a') ? "true":"false");
    printf("isDigit('\\n'): %s\n", isDigit( '\n') ? "true":"false");
}

