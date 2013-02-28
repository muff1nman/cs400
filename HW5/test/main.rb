#!/usr/bin/env ruby

require 'test/unit'
require_relative '../main.rb'

class TestMain < Test::Unit::TestCase

    def test_main
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

        expected = "aab"

        assert_equal( expected, run( nonTerminals, "S", "aab" ), "Failed simple test")
    end

end

