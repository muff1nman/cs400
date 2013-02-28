#!/usr/bin/env ruby
require_relative 'parse.rb'
# a simple script to parse a sentence with some rules

S = {
    :a => 'Ab',
}

A = {
    :a => 'aa'
}

nonTerminals = {
    "S" => S,
    "A" => A
}

abort("Please suply the string to parse") if ARGV.length != 1

stack = ARGV[0].split(//)
current = ["S"]

while hasNonTerminal(current) do
    # record index of nonTerminal
    # look up in nonTerminals
    # if it is there, replace it with its value based whats on the stack
    #   and remove from the stack all values that were consumed

    nonTerminal = getNonTerminal(current)
    if nonTerminals.key? nonTerminal
        hash = nonTerminals[nonTerminal]
        expandTo = hash[stack[0]]
        replaceNonTerminal( current, expandTo )
    else 
        puts "Not sure whats going on here"
    end
end
