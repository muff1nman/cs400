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
    indexOfLastTerminal = 0
    current = stack
    #puts "Initial stack: #{stack}"
    while hasNonTerminal(start)  do
        #puts "Current step: #{start}"
        # record index of nonTerminal
        # look up in doubleHash
        # if it is there, replace it with its value based whats on the current
        #   and remove from the current all values that were consumed
        nonTerminal = getNonTerminal(start)
        if doubleHash.key? nonTerminal
            hash = doubleHash[nonTerminal]
            expandTo = hash[current[0]]
            start = replaceNonTerminal( start, expandTo )
            #puts "Current step: #{start} Stack: #{stack}"
            while current != '' and start[indexOfLastTerminal] == current[0]
                #puts "first: #{current[0]}\n"
                current[0] = ''
                #puts "Current step: #{start} Stack: #{stack}"
                indexOfLastTerminal += 1
            end
        else 
            puts "Not sure whats going on here"
        end
        output << start
    end
    #output.each { |line| puts "> #{line}" }
    output
end
