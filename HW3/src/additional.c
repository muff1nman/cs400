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

//void append(char s, char** string){
//    strncat( *string, &s, 1);
//}
