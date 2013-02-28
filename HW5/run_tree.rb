#!/usr/bin/env ruby

require_relative 'tree.rb'

abort('need file') if ARGV.length != 1

create(ARGV[0])
