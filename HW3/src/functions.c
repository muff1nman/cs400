#include "functions.h"

bool isCharacter( char supplied, char desired ) {
    return supplied == desired;
}

bool isDigit( char supplied ) {
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

bool isCharacter_EOF( char supplied ){
    return isCharacter( supplied, EOF );
}

bool anything( char supplied ) {
    return true;
}

bool notStart( char supplied ){
    return !isCharacter( supplied, 'R') &&
//        !isCharacter( supplied, '(') &&
//        !isCharacter( supplied, ')') &&
//        !isCharacter( supplied, '=') &&
//        !isCharacter( supplied, '^') &&
//        !isCharacter( supplied, '*') &&
        !isCharacter( supplied, '/') &&
//        !isCharacter( supplied, '+') &&
//        !isCharacter( supplied, '-') &&
//        !isCharacter( supplied, ';') &&
//        !isCharacter( supplied, '.') &&
//        !isCharacter( supplied, '\n') &&
 //       !isDigit( supplied ) && 
        !isCharacter_EOF( supplied );
}

bool isCharacter_slash( char supplied ) {
    return isCharacter( supplied, '/');
}

bool isAnythingbutEOFNEW( char supplied ) {
    return !isCharacter_EOF( supplied ) && !isCharacter( supplied, '\n' );
}

bool isCharacterStar( char supplied ) {
    return isCharacter( supplied, '*' );
}

bool isNotCharacter_EOF( char supplied ) {
    return !isCharacter_EOF( supplied );
}
