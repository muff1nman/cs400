#include "additional.h"

void append(char s, char** string){
    char* old = *string;
    char* new = (char*) malloc( (strlen(old) + 2) * sizeof( char ) );
    strncpy( new, old, strlen( old ));
    new[strlen(old)] = s;
    new[strlen(old) + 1] = '\0';
    free( old );
    *string = new;
    new = NULL;
}

char* scrub( const char* string ) {
    int charsChanged = 0;
    int i;
    int j;
    int oldlen = strlen( string  );
    char* newstr;
    // how much larger is the string going to be?
    for ( i = 0; i<oldlen; ++i ){
        if ( !isGraphical( string[i] ) ){
            ++charsChanged;
        }
    }

    // allocate memory (2 additional for each charChanged
    newstr = (char*) malloc(( 2 * charsChanged + oldlen + 1 ) * sizeof(char));
    // copy that shit over
    for( i = 0, j = 0; i<oldlen; ++i, ++j ){
        if ( !isGraphical( string[i] )){
            newstr[j] = '#';
            snprintf( (newstr + j + 1), 3,"%02x", (int) string[i]);
            j +=2; // we moved forward two spaces.
        } else {
            newstr[j] =(char) string[i];
        }
    }

    // don't forget the null character
    newstr[j] = '\0';

    return newstr;
}

bool isGraphical( char x ) {
    // except # sym
    // 33(!) - 126(~)
    return (x >= '!' && x <= '~') && x != '#';
}

