#!/usr/bin/env ruby

# a simple script to parse a sentence with some rules

def hasNonTerminal( array )
    array.each_char do |char|
        return true if char == char.upcase
    end
    false
end

def getNonTerminal( array )
    array.each_char do |char|
        return char if char.is_a? String and char == char.upcase
    end
    nil
end

def replaceNonTerminal( array, replacement )
    array.sub(getNonTerminal( array ), replacement )
end


def parse (doubleHash, start, stack )
    output = [start]
    limit = 40
    while hasNonTerminal(start) and limit > 0 do
        # record index of nonTerminal
        # look up in doubleHash
        # if it is there, replace it with its value based whats on the stack
        #   and remove from the stack all values that were consumed
        limit -= 1
        nonTerminal = getNonTerminal(start)
        if doubleHash.key? nonTerminal
            hash = doubleHash[nonTerminal]
            expandTo = hash[stack[0]]
            start = replaceNonTerminal( start, expandTo )
        else 
            puts "Not sure whats going on here"
        end
        output << start
    end
    output.each { |line| puts "> #{line}" }
    output
end
