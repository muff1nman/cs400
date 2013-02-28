#!/usr/bin/env ruby

require 'test/unit'
require_relative '../tree.rb'

class TestTree < Test::Unit::TestCase
    #def test_simple
        #expected = "[S [a] [b c]]"
        #assert_equal(expected,create("test.input"), "Could not pass simple test" )
    #end
    
    def test_getDoubleArrayFromFile
        expected = [
            ["<program>"],
            ["main", "{", "<stmts>", "}"],
            ["main", "{", "<stmt>", ";", "<stmts>", "}"],
            ["main", "{", "<var>", "=", "<expr>", ";", "<stmts>", "}"]
        ]

        assert_equal( expected, getDoubleArrayFromFile( "test/test.input"), "File Import Failure")

    end


end
        
