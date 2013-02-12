#include "functions.h"

bool isCharacter( char supplied, char desired ) {
    return supplied == desired;
}

bool isDigit( char supplied, char empty ) {
    int i;
    for (i = 0; i < 10; ++i ) {
        if ( supplied == (char)( (int)'0' + i ) ){
            return true;
        }
    } 

    return false;
}


bool isCharacter_R( char supplied ){
    return isCharacter( supplied, 'R' );
}
