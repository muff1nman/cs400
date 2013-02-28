#!/usr/bin/env ruby

require_relative 'tree.rb'

abort('need file') if ARGV.length != 1

puts create(ARGV[0])
