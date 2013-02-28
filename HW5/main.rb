#!/usr/bin/env ruby
require_relative 'parse.rb'
# a simple script to parse a sentence with some rules

#abort("Please suply the string to parse") if ARGV.length != 1
if ARGV.length != 1
    print "Please enter a string: "
    stack = $stdin.gets.chomp
end

stack = ARGV[0]
current = "S"


