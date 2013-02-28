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
        expected1 = ["hello", ["find"],[ "me"], "world"]

        assert_equal(expected1, replaceIndexWith(old, [0], new), "Failed with simple insert at front" )

        expected2 = [ "hello", "world", ["find"], ["me"]]

        assert_equal(expected2, replaceIndexWith(old, [1], new), "Failed with simple insert at back" )

        old = ["S", ["child1"], ["child2"]]
        new = ["gch2", "gch3"]
        expected3 = ["S", ["child1", ["gch2"], ["gch3"]], ["child2"]]
        assert_equal(expected3, replaceIndexWith(old, [0,0], new), "Failed with simple insert at back" )
        
    end

    def test_updateTreeStructure

        old = [
            [0],
            [1,0],
            [2,0],
            [2,1,0],
            [2,2,0]
        ]

        new = [
            [0],
            [1,0],
            [1,1,0],
            [1,2,0],
            [2,0],
            [2,1,0],
            [2,2,0]
        ]

        assert_equal( new, updateTreeStructure(old, 1, 2), "Failed general update structure")


    end

    def convertDoubleArrayToString
        array = ["a", ["b", ["g", "f"]], ["c", ["d"],["e"]]]

         
        string = "[a [b g f] [c d e]]"

        assert_equal( string, convertDoubleArrayToString(array), "Failed convert array to string")

    end
end
        
