#!/usr/bin/env ruby

require 'test/unit'
require_relative '../parse.rb'

class TestParse < Test::Unit::TestCase

    def test_hasNonTerminal
        a = ["a", "b"]
        assert_equal( false, hasNonTerminal(a), "Failed for no non terminals")
        a = ["a", "A", "b"]
        assert_equal( true, hasNonTerminal(a), "Failed for one non terminal in the middle")
        a = []
        assert_equal( false, hasNonTerminal(a), "Failed for empty string")
    end

    def test_getNonTerminal
        a = ["S"]
        assert_equal("S", getNonTerminal(a), "Failed for a single NonTerminal")
        a = ["b", "c", "B", "E" ]
        assert_equal("B", getNonTerminal(a), "Failed for more than one NonTerminal")
        r = ["b", "q", 4, "hello" ]
        assert_equal(nil, getNonTerminal(r), "Failed for no nonTerminals")
    end
end
        
