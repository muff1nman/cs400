#!/usr/bin/env ruby
require_relative 'parse.rb'
# a simple script to parse a sentence with some rules

#abort("Please suply the string to parse") if ARGV.length != 1
if ARGV.length != 1
    print "Please enter a string: "
    stack = $stdin.gets.chomp
end

nonTerminals = {
    "S" => { "a" => "BCS", "b" => "ASE", "c" => "BCS", "d" => "CC", "e" => "CC", "f" => "ASE", "j" => "ASE", "h" => "CC", "i" => "ASE", "g" => "ASE", "k" => "BCS" },
    "A" => { "b" => "bEC", "f" => "Da", "j" => "Da", "i" => "Da", "g" => "gB" },
    "B" => { "a" => "aDE", "c" => "cD", "k" => "kAB" },
    "C" => { "d" => "dEa", "e" => "eS", "h" => "hf" },
    "D" => { "f" => "fSk", "j" => "jkC", "i" => "iB" },
    "E" => { "b" => "Aa", "c" => "cb", "d" => "CS", "e" => "CS", "f" => "Aa", "j" => "Aa", "h" => "CS", "i" => "Aa", "g" => "Aa" }
}


stack ||= ARGV[0]
current = "S"

steps =  parse(  nonTerminals, current, stack )

steps.each { |step| puts step }

