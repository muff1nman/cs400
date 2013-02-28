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

    def test_findTokenExpanded
        old =  ["main", "{", "<stmt>", "<stmts>", "}"]
        new =  ["main", "{", "<var>", "=", "<expr>", "<stmts>", "}"]
        expected = 2
        assert_equal( expected, findTokenExpanded( old, new), "Failed withe simple replace");

        old = ["main", "{", "<stmts>", "}"]
        new = ["main", "{", "<stmt>", "<stmts>", "}"]
        expected = 2
        assert_equal( expected, findTokenExpanded( old, new ), "Failed with push to rightside")
    end

    def test_firstTokensExpandedTo
        old =  ["main", "{", "<stmt>", "<stmts>", "}"]
        new =  ["main", "{", "<var>", "=", "<expr>", "<stmts>", "}"]
        expected = ["<var>", "=", "<expr>"]
        assert_equal( expected, findTokensExpandedTo( old, new), "Failed with simple replace");
    end

    def test_replaceIndexWith
        old = ["hello", "world"]
        new = ["find", "me" ]
        expected1 = [["find", "me"], "world"]

        assert_equal(expected1, replaceIndexWith(old, 0, new), "Failed with simple insert at front" )

        expected2 = [ "hello", ["find", "me"]]

        assert_equal(expected2, replaceIndexWith(old, 1, new), "Failed with simple insert at back" )
        
    end

    def convertDoubleArrayToString
        array = ["a"]
    end
end
        
