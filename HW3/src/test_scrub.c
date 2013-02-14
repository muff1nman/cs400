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
    const char* test = "hello!";
    const char* test2 = "h e@ll\no";
    char* new_test;
    //strcpy( test, "hello");
    //printf("Before: %s\n", test );
    //scrub( &test );
    //printf("After: %s\n", test );
    printf("Before: %s\n", test );
    new_test = scrub( test );
    printf("After: %s\n", new_test );
    free( new_test );
    new_test = NULL;

    printf("Before: %s\n", test2 );
    new_test = scrub( test2 );
    printf("After: %s\n", new_test );
    free( new_test );
    return 0;
}
