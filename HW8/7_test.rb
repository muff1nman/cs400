#! /usr/bin/env ruby
#
# Copyright © 2013 Andrew DeMaria (muff1nman) <ademaria@mines.edu>
#
# All Rights Reserved.

require 'test/unit'
require_relative 'test_helper.rb'

class Exercise7 < Test::Unit::TestCase
  def test_simple_unary_neg
    float_assert( "-3", "-3", "Test simple integer unary neg")
    float_assert( "-1.2" "-1.2", "Test simple float unary neg")
  end

  def test_unary_operator_precedence
    float_assert("1", "4+-3", "Test simple integer add with unary")
    float_assert("1.0", "4.0+-3.0", "Test simple float add with unary")
    float_assert("7", "4--3", "Test simple integer subtract with unary")
    float_assert("7.0", "4.0--3.0", "Test simple float subtract with unary")
    float_assert("-3", "6/-2", "Test simple integer division with unary")
    float_assert("-3.0", "6./-2.0", "Test simple float division with unary")
    float_assert("-8", "4*-2" ,"Test simple integer multiplication with unary")
    float_assert("-8.0", "4.0*-2.0" ,"Test simple float multiplication with unary")
  end

  def test_unary_cascade
    float_assert("3", "----3", "Test simple integer unary neg cascade")
    float_assert("-1.4", "---1.4", "Test simple float unary neg cascade")
  end

  def test_unary_complex
    # TODO 
    assert_true(false)
  end
end


