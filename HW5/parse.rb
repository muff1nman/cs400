#!/usr/bin/env ruby

# a simple script to parse a sentence with some rules

def hasNonTerminal( array )
    array.any? do |char|
        true if char == char.upcase
    end
end

def getNonTerminal( array )
    toReturn = nil
    array.any? do |char|
        toReturn = char if char.is_a? String and char == char.upcase
    end
    toReturn
end

