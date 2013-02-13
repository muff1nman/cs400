#include "types.h"

const char* toString( TokenType x ) {
    switch ( x ){
        case ID:
            return "ID";
        case INT:
            return "INT";
        case FLT:
            return "FLT";
        case OPAREN:
            return "OPAREN";
        case CPAREN:
            return "CPAREN";
        case ASSIGN:
            return  "ASSIGN";
        case EXP:
            return "EXP";
        case MUL:
            return "MUL";
        case DIV:
            return "DIV";
        case ADD:
            return "ADD";
        case SUB:
            return "SUB";
        case SEMI:
            return "SEMI";
        case BAD:
            return "BAD";
        case NEWLINE:
            return "NEWLINE";
        case EOLCMT:
            return "EOLCMT";
        case BLKCMT:
            return "BLKCMT";
        case END:
            return "END";
        default:
            return "UNKNOWN";
    }
}
