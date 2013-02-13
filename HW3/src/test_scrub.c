/*
 * =====================================================================================
 *
 *       Filename:  test_scrub.c
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  02/12/2013 11:05:24 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Andrew DeMaria (muff1nman), ademaria@mines.edu
 *   Organization:  Colorado School of Mines
 *
 * =====================================================================================
 */
#include <stdlib.h>
#include <stdio.h>
#include "additional.h"

int main() {
    char* test = (char*) malloc( sizeof(char) * 20 );
    strcpy( test, "hello");
    printf("Before: %s\n", test );
    scrub( &test );
    printf("After: %s\n", test );
    strcpy( test, "h l\no");
    printf("Before: %s\n", test );
    scrub( &test );
    printf("After: %s\n", test );
    return 0;
}
