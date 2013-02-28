#!/usr/bin/env ruby
require_relative 'parse.rb'
# a simple script to parse a sentence with some rules

def run (doubleHash, start, stack )
    while hasNonTerminal(start) do
        # record index of nonTerminal
        # look up in doubleHash
        # if it is there, replace it with its value based whats on the stack
        #   and remove from the stack all values that were consumed

        nonTerminal = getNonTerminal(start)
        if doubleHash.key? nonTerminal
            hash = doubleHash[nonTerminal]
            expandTo = hash[stack[0]]
            start = replaceNonTerminal( start, expandTo )
        else 
            puts "Not sure whats going on here"
        end
    end
    start
end

#abort("Please suply the string to parse") if ARGV.length != 1
if ARGV.length != 1
    print "Please enter a string: "
    stack = $stdin.gets.chomp
end

stack = ARGV[0]
current = "S"


