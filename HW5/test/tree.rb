#!/usr/bin/env ruby

require 'test/unit'
require_relative '../tree.rb'

class TestTree < Test::Unit::TestCase
    def test_getDepth
        puts "TESTING getDepth"
        assert_equal(0, getDepth("a"), "Single element failure")
        assert_equal(1, getDepth(["a"]), "Single array failture")
        assert_equal(2, getDepth(["a",["b"]]), "Nested array failture")
    end

    def test_simple
        puts "Testing Simple Run"
        expected = "[S a [b c ] ]"
        input = [
            ["S"],
            ["a","b"],
            ["a","c"]
        ]
        assert_equal(expected,create_array(input), "Could not pass simple test" )
    end
    
    def test_whole
        puts "Testing entire program"
        expected = "[<program> main { [<stmts> [<stmt> <var> = <expr> ] ; <stmts> ] } ]"
        assert_equal(expected, create("test/test.input"), "Could not pass the entire program")
    end
    
    def test_getDoubleArrayFromFile
        puts "Testing DoubleArrayfromFile"
        expected = [
            ["<program>"],
            ["main", "{", "<stmts>", "}"],
            ["main", "{", "<stmt>", ";", "<stmts>", "}"],
            ["main", "{", "<var>", "=", "<expr>", ";", "<stmts>", "}"]
        ]

        assert_equal( expected, getDoubleArrayFromFile( "test/test.input"), "File Import Failure")

    end

    def test_findTokenExpanded
        puts "Testing findTokenExpanded"
        old =  ["main", "{", "<stmt>", "<stmts>", "}"]
        new =  ["main", "{", "<var>", "=", "<expr>", "<stmts>", "}"]
        expected = 2
        assert_equal( expected, findTokenExpanded( old, new), "Failed withe simple replace");

        old = ["main", "{", "<stmts>", "}"]
        new = ["main", "{", "<stmt>", "<stmts>", "}"]
        expected = 2
        assert_equal( expected, findTokenExpanded( old, new ), "Failed with push to rightside")

        old = ["main", "{", "<stmts>", "}"]
        new = ["main", "{", "<stmt>", "}"]
        expected = 2
        assert_equal( expected, findTokenExpanded( old, new ), "Failed with push with one replace")
        old = ["f", "d", "g", "c", "j", "k", "h", "f", "a", "a", "d", "b", "c", "b", "h", "f", "a", "a", "k", "a", "S", "E"]
        new = ["f", "d", "g", "c", "j", "k", "h", "f", "a", "a", "d", "b", "c", "b", "h", "f", "a", "a", "k", "a", "B", "C", "S", "E"]
        expected = 20
        assert_equal( expected, findTokenExpanded( old, new ), "Failed with long replace")

        old = ["f", "d", "E", "a", "C", "k", "a", "S", "E"]
        new = ["f", "d", "A", "a", "a", "C", "k", "a", "S", "E"]
        expected = 2
        assert_equal( expected, findTokenExpanded( old, new ), "Failed with long replace")


    end

    def test_firstTokensExpandedTo
        puts "TEsting first Tokens Expaneded To"
        old =  ["main", "{", "<stmt>", "<stmts>", "}"]
        new =  ["main", "{", "<var>", "=", "<expr>", "<stmts>", "}"]
        expected = ["<var>", "=", "<expr>"]
        assert_equal( expected, findTokensExpandedTo( old, new), "Failed with simple replace");

        old =  ["main", "{", "<stmt>", "<stmts>", "}"]
        new =  ["main", "{", "<var>", "<stmts>", "}"]
        expected = ["<var>"]
        assert_equal( expected, findTokensExpandedTo( old, new), "Failed with simple replace");

        old = ["f", "d", "E", "a", "C", "k", "a", "S", "E"]
        new = ["f", "d", "A", "a", "a", "C", "k", "a", "S", "E"]
        expected = ["A", "a"]
        assert_equal( expected, findTokensExpandedTo( old, new), "Failed with complex replace");

    end

    def test_replaceIndexWith
        puts "Testing replaceIndex Withh"
        old = ["one"]
        new = ["two", "three" ]
        expected = ["one", ["two"], ["three"]]
        assert_equal(expected, replaceIndexWith(old, [0], new), "Failed with simple insert at front" )


        tree_old = [[0]]
        tree_new = [[1,0],[2,0]]
        assert_equal( tree_new, updateTreeStructure(tree_old,0,2), "Failed update")


        old = ["hello", "world"]
        new = ["find", "me" ]
        expected1 = ["hello", ["find"],[ "me"], "world"]

        assert_equal(expected1, replaceIndexWith(old, [0], new), "Failed with simple insert at front" )

        expected2 = [ "hello", "world", ["find"], ["me"]]

        assert_equal(expected2, replaceIndexWith(old, [1], new), "Failed with simple insert at back" )

        old = ["hello", "world"]
        new = ["find" ]
        expected1 = ["hello", ["find"], "world"]

        assert_equal(expected1, replaceIndexWith(old, [0], new), "Failed with simple insert at front" )


        old = ["S", ["child1"], ["child2"]]
        new = ["gch2", "gch3"]
        expected3 = ["S", ["child1", ["gch2"], ["gch3"]], ["child2"]]
        assert_equal(expected3, replaceIndexWith(old, [1,0], new), "Failed with simple insert at back" )
        
    end

    def test_updateTreeStructure
        puts "Testing Update Tree Structure"

        old = [
            [1,0],
            [2,1,0],
            [2,2,0]
        ]

        new = [
            [1,1,0],
            [2,1,0],
            [2,2,0]
        ]

        assert_equal( new, updateTreeStructure(old, 0, 1), "Failed general update structure")

        old = [
            [0]
        ]
        new = [
            [1,0],
            [2,0]
        ]

        assert_equal( new, updateTreeStructure(old, 0, 2), "Failed general update structure")

    end

    def test_convertDoubleArrayToString
        puts "Testing converDoubleArrayToString"

        simple = ["a"]
        string = "[a ]"
        assert_equal( string, convertDoubleArrayToString(simple), "Failed Convert simple")

        simple = ["a", ["b"], ["c"]]
        string = "[a b c ]"
        assert_equal( string, convertDoubleArrayToString(simple), "Failed Convert simple")

        array = ["a", ["b", ["g"],["f"]], ["c", ["d"],["e"]]]
        string = "[a [b g f ] [c d e ] ]"
        assert_equal( string, convertDoubleArrayToString(array), "Failed convert array to string")

    end

end
        
