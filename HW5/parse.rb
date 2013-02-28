#!/usr/bin/env ruby

# a simple script to parse a sentence with some rules

def hasNonTerminal( array )
    array.any? do |char|
        true if char == char.upcase
    end
end

def getNonTerminal( array )
    array.any? do |char|
        @return = char if char == char.upcase
    end
    @return
end

