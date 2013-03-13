#!/usr/bin/env ruby

require 'test/unit'

class TestComplex < Test::Unit::TestCase

    def setup
        `make`
    end

    def create_result( type, expected )
        "<#{type} value=\"#{expected}\">\n\n"
    end

    def run_with( value )
        `echo "#{value}" | ./complex.out `
    end


    def test_Real_natural
        test_input = "34"
        assert_equal(
            create_result( "real", test_input),
            run_with( test_input),
            "Failed simple Real Natural")

        test_input = "0"
        assert_equal(
            create_result( "real", test_input),
            run_with( test_input),
            "Failed simple Real Natural")
        test_input = "a0"
        assert_not_equal(
            create_result( "real", test_input),
            run_with( test_input),
            "Failed simple Real Natural")

    end

    def test_Real_decimal
        test_input = ".5"
        assert_equal(
            create_result( "real", test_input),
            run_with( test_input),
            "Failed simple Real Natural")
        test_input = "0.5"
        assert_equal(
            create_result( "real", test_input),
            run_with( test_input),
            "Failed simple Real Natural")
        test_input = "8.5"
        assert_equal(
            create_result( "real", test_input),
            run_with( test_input),
            "Failed simple Real Natural")
        test_input = "8..5"
        assert_not_equal(
            create_result( "real", test_input),
            run_with( test_input),
            "Failed simple Real Natural")
        test_input = "."
        assert_not_equal(
            create_result( "real", test_input),
            run_with( test_input),
            "Failed simple Real Natural")
    end

    def test_Real_decimal_negaitve
        test_input = "-38.5"
        assert_equal(
            create_result( "real", test_input),
            run_with( test_input),
            "Failed simple Real Natural")
        test_input = "-.5"
        assert_equal(
            create_result( "real", test_input),
            run_with( test_input),
            "Failed simple Real Natural")
        test_input = "-5."
        assert_equal(
            create_result( "real", test_input),
            run_with( test_input),
            "Failed simple Real Natural")
        test_input = "-."
        assert_not_equal(
            create_result( "real", test_input),
            run_with( test_input),
            "Failed simple Real Natural")
    end


    def test_Real_integer
        test_input = "-9"
        assert_equal(
            create_result( "real", test_input),
            run_with( test_input),
            "Failed simple Real Natural")
        test_input = "-234902"
        assert_equal(
            create_result( "real", test_input),
            run_with( test_input),
            "Failed simple Real Natural")
    end

    def test_imaginary_simple

    end

    def test_plus
        test_input = "+"
        assert_equal(
            create_result( "add", test_input),
            run_with( test_input),
            "Failed simple add")
    end

    def test_subtract
        test_input = "-"
        assert_equal(
            create_result( "sub", test_input),
            run_with( test_input),
            "Failed simple sub")

    end

    def test_multiple

    end

end
