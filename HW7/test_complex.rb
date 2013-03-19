#!/usr/bin/env ruby

require 'test/unit'

class TestComplex < Test::Unit::TestCase

    def setup
        `make`
    end

    def create_result_no_eol( type, expected )
        "<#{type} value=\"#{expected}\">\n"
    end

    def create_result( type, expected )
        create_result_no_eol( type, expected) + "\n"
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
            create_result_no_eol( "sub", "-") + 
            create_result_no_eol( "real", "38.5") +
            "\n",
            run_with( test_input),
            "Failed simple decimal Natural")

        test_input = "-.5"
        assert_equal(
            create_result_no_eol( "sub", "-") + 
            create_result_no_eol( "real", ".5") +
            "\n",
            run_with( test_input),
            "Failed simple decimal Natural")

        test_input = "-."
        assert_not_equal(
            create_result_no_eol( "sub", "-") + 
            create_result_no_eol( "real", ".") +
            "\n",
            run_with( test_input),
            "Failed simple decimal Natural")
    end


    def test_Real_integer
        test_input = "-234902"
        assert_equal(
            create_result_no_eol( "sub", "-") + 
            create_result_no_eol( "real", "234902") +
            "\n",
            run_with( test_input),
            "Failed simple Real Natural")
    end

    def test_imaginary_simple
        test_input = "4i"
        assert_equal(
            create_result( "imaginary", test_input),
            run_with( test_input ),
            "Failed simple imaginary")

        # Optional
        test_input = "7.4i"
        assert_equal(
            create_result( "imaginary", test_input),
            run_with( test_input ),
            "Failed optional decimal imaginary")

        # Optional
        test_input = "7.i"
        assert_equal(
            create_result( "imaginary", test_input),
            run_with( test_input ),
            "Failed optional decimal imaginary")

        test_input = "i4"
        assert_not_equal(
            create_result( "imaginary", test_input),
            run_with( test_input ),
            "Failed simple imaginary")

        test_input = "4ii"
        assert_not_equal(
            create_result( "imaginary", test_input),
            run_with( test_input ),
            "Failed simple imaginary")
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

    def test_multiple_no_imaginary
        test_input = "4+3i"
        assert_equal(
            create_result_no_eol( "real", "4") +
            create_result_no_eol( "add", "+") +
            create_result_no_eol( "imaginary", "3i") +
            "\n",
            run_with( test_input ),
            "Failed simple addition"
        )

        test_input = "-3--2i"
        assert_equal(
            create_result_no_eol( "sub", "-") +
            create_result_no_eol( "real", "3") +
            create_result_no_eol( "sub", "-") +
            create_result_no_eol( "sub", "-") +
            create_result_no_eol( "imaginary", "2i") +
            "\n",
            run_with( test_input ),
            "Failed simple addition"
        )

        test_input = "23i-+1.2-34i"
        assert_equal(
            create_result_no_eol( "imaginary", "23i") +
            create_result_no_eol( "sub", "-") +
            create_result_no_eol( "add", "+") +
            create_result_no_eol( "real", "1.2") +
            create_result_no_eol( "sub", "-") +
            create_result_no_eol( "imaginary", "34i") +
            "\n",
            run_with( test_input ),
            "Failed simple addition"
        )

    end

    def test_multiple_no_imaginary
        test_input = "3+4"
        assert_equal(
            create_result_no_eol( "real", "3") +
            create_result_no_eol( "add", "+") +
            create_result_no_eol( "real", "4") +
            "\n",
            run_with( test_input ),
            "Failed simple addition"
        )

        test_input = "4.3+5.6"
        assert_equal(
            create_result_no_eol( "real", "4.3") +
            create_result_no_eol( "add", "+") +
            create_result_no_eol( "real", "5.6") + 
            "\n",
            run_with( test_input ),
            "Failed decimal addition"
        )

        test_input = "4.3-5.6"
        assert_equal(
            create_result_no_eol( "real", "4.3") +
            create_result_no_eol( "sub", "-") +
            create_result_no_eol( "real", "5.6") + 
            "\n",
            run_with( test_input ),
            "Failed decimal subtraction"
        )

        test_input = "-.4+35+-23.5"
        assert_equal(
            create_result_no_eol( "sub", "-") +
            create_result_no_eol( "real", ".4") +
            create_result_no_eol( "add", "+") +
            create_result_no_eol( "real", "35") + 
            create_result_no_eol( "add", "+") +
            create_result_no_eol( "sub", "-") +
            create_result_no_eol( "real", "23.5") +
            "\n",
            run_with( test_input ),
            "Failed longer addition"
        )

        test_input = "-.4-35--23.5"
        assert_equal(
            create_result_no_eol( "sub", "-") +
            create_result_no_eol( "real", ".4") +
            create_result_no_eol( "sub", "-") +
            create_result_no_eol( "real", "35") + 
            create_result_no_eol( "sub", "-") +
            create_result_no_eol( "sub", "-") +
            create_result_no_eol( "real", "23.5") + 
            "\n",
            run_with( test_input ),
            "Failed longer subtraction"
        )
    end
end

