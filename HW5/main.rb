#!/usr/bin/env ruby
require_relative 'parse.rb'
# a simple script to parse a sentence with some rules

S = {
    :a => 'BCS',
    :b => 'ASE'
}

nonTerminals = {
    "S" => S
}

abort("Please suply the string to parse") if ARGV.length != 1

stack = ARGV[0].split(//)
current = ["S"]

while hasNonTerminal(current) do
    # record index of nonTerminal
    # look up in nonTerminals
    # if it is there, replace it with its value based whats on the stack
    #   and remove from the stack all values that were consumed


end
