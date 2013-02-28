#!/usr/bin/env ruby

require 'test/unit'
require_relative '../tree.rb'

class TestTree < Test::Unit::TestCase
    def test_simple
        expected = "[S [a] [b c]]"
        assert_equal(expected,create(file), "Could not pass simple test" )
    end
end
        
