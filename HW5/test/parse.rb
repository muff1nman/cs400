#!/usr/bin/env ruby

require 'test/unit'
require_relative '../parse.rb'

class TestParse < Test::Unit::TestCase

    def test_hasNonTerminal
        a = "ab"
        assert_equal( false, hasNonTerminal(a), "Failed for no non terminals")
        a = "aAb"
        assert_equal( true, hasNonTerminal(a), "Failed for one non terminal in the middle")
        a = ""
        assert_equal( false, hasNonTerminal(a), "Failed for empty string")
    end

    def test_getNonTerminal
        a = "S"
        assert_equal("S", getNonTerminal(a), "Failed for a single NonTerminal")
        a = "bcBE" 
        assert_equal("B", getNonTerminal(a), "Failed for more than one NonTerminal")
        r = "bqhello" 
        assert_equal(nil, getNonTerminal(r), "Failed for no nonTerminals")
    end

    def test_replaceNonTerminal
        array1 = "bAc"
        expected1 = "bqc"
        assert_equal(expected1, replaceNonTerminal(array1, "q"), "Failed to replace simple")
        array2 = "aXX" 
        expected2 = "aqrX"
        assert_equal( expected2, replaceNonTerminal( array2, "qr"), "Failed to replace multiople")
    end

    def test_main_simple
        _S = {
            "a" => 'Ab',
        }

        _A = {
            "a" => 'aa'
        }

        nonTerminals = {
            "S" => _S,
            "A" => _A
        }

        expected = ["S", "Ab", "aab"]

        assert_equal( expected, parse( nonTerminals, "S", "aab" ), "Failed simple test")
    end

    def test_main_complextree_simplesentence
        nonTerminals = {
            "S" => { "a" => "BCS", "b" => "ASE", "c" => "BCS", "d" => "CC", "e" => "CC", "f" => "ASE", "j" => "ASE", "h" => "CC", "i" => "ASE", "g" => "ASE", "k" => "BCS" },
            "A" => { "b" => "bEC", "f" => "Da", "j" => "Da", "i" => "Da", "g" => "gB" },
            "B" => { "a" => "aDE", "c" => "cD", "k" => "kAB" },
            "C" => { "d" => "dEa", "e" => "eS", "h" => "hf" },
            "D" => { "f" => "fSk", "j" => "jkC", "i" => "iB" },
            "E" => { "b" => "Aa", "c" => "cb", "d" => "CS", "e" => "CS", "f" => "Aa", "j" => "Aa", "h" => "CS", "i" => "Aa", "g" => "Aa" }
        }

        expected = ["S", "CC", "hfC", "hfhf"]

        assert_equal( expected, parse( nonTerminals, "S", "hfhf" ), "Failed simple test with complex tree")
    end

    def test_main_complextree_complexsentence
        nonTerminals = {
            "S" => { "a" => "BCS", "b" => "ASE", "c" => "BCS", "d" => "CC", "e" => "CC", "f" => "ASE", "j" => "ASE", "h" => "CC", "i" => "ASE", "g" => "ASE", "k" => "BCS" },
            "A" => { "b" => "bEC", "f" => "Da", "j" => "Da", "i" => "Da", "g" => "gB" },
            "B" => { "a" => "aDE", "c" => "cD", "k" => "kAB" },
            "C" => { "d" => "dEa", "e" => "eS", "h" => "hf" },
            "D" => { "f" => "fSk", "j" => "jkC", "i" => "iB" },
            "E" => { "b" => "Aa", "c" => "cb", "d" => "CS", "e" => "CS", "f" => "Aa", "j" => "Aa", "h" => "CS", "i" => "Aa", "g" => "Aa" }
        }

        expected = [
            "S", 
            "ASE",
            "bECSE",
            "bcbCSE",
            "bcbhfSE",
            "bcbhfCCE",
            "bcbhfhfCE",
            "bcbhfhfhfE",
            "bcbhfhfhfbc" ]

        assert_equal( expected, parse( nonTerminals, "S", "bcbhfhfhfcb" ), "Failed complex test with complex tree")
    end
end
        
