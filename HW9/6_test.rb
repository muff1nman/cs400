#! /usr/bin/env ruby
#
# Copyright © 2013 Andrew DeMaria (muff1nman) <ademaria@mines.edu>
#
# All Rights Reserved.

require 'test/unit'
require_relative 'test_helper.rb'

class Exercise6 < Test::Unit::TestCase
  def test_simple_integer_exponent
    float_assert( "8", "2^3", "Failed simple integer exponent")
    # The following test is not that great because it assumes that a float needs
    # decimal values.
    #assert_not_equal( formatted_result("8"), format_result(run_calculator("2^3")), "Should return float, not integer")
    float_assert( "1", "2^0", "Failed zero exponent test")
  end

  def test_simple_float_exponent
    float_assert( "4.342848712", "3.4^1.2", "Failed simple float exponent")
  end

  def test_float_integer_mixed_exponent
    float_assert( "1.39038917", "3^0.3", "Failed simple mixed with float power")
    float_assert( "92972.22253683", "1.4^34", "Failed simple mixed with integer power")
  end

  def test_operator_precedence
    float_assert("262144", "4^3^2", "Operator precendence is wrong for only exponents")
    float_assert("-6", "3-3^2", "Should be before subtraction")
    float_assert("18", "2*3^2", "Should be before multiplication")
    float_assert("0.222222", "2.0/3^2", "Should be before division")
    float_assert("-2.444444444", "2/3^2+4^2/3+1-3^2", "Just a bunch of operations to test, all integers")
    float_assert("-2.311474184", "3.4^1.2-8*2^1.2^0.3/3.4^0/5*2.0", "Just a bunch of operations to test, mixed float")

  end
end


