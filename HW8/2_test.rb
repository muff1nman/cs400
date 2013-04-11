#! /usr/bin/env ruby
#
# Copyright © 2013 Andrew DeMaria (muff1nman) <ademaria@mines.edu>
#
# All Rights Reserved.

require 'test/unit'
require_relative 'test_helper.rb'

class Exercise2 < Test::Unit::TestCase
  def test_float
    float_assert("1.2","1.2", "Failed to recognize Float")
    float_assert(".2",".2", "Failed to recognize a Float without the leading decimal")
    float_assert("2.","2.", "Failed to recognize a Float without the trailing decimal")
  end

  def test_integer

  end

  def test_float_operations
    float_assert("3.4","1.1+2.3", "Failed to do a simple addition with floats")
    float_assert("4.08","5.98-1.9", "Failed to do a simple addition with floats")
    float_assert("5.95", "3.5*1.7", "Failed to do a simple multiplication with floats")
    float_assert("1.2", "2.76/2.3", "Failed to do a simple division with floats")
  end

  def test_small_large_floats
    float_assert("2.592857143","3.63/1.4", "Failed to do a division with more decimal points with floats")
  end

  def test_repeating_float
    float_assert("0.333333", "1.0/3.0", "Failed to do a division with repeating float as result")
  end


  def test_mixed_operations
    float_assert("7.5","4.5+3", "Failed to do a simple addition with float and integer")
    float_assert("7.5","3+4.5", "Failed to do a simple addition with float and integer")
    float_assert("2.3","3-0.7", "Failed to do a simple subtraction with float and integer")
    float_assert("-2.3","0.7-3", "Failed to do a simple subtraction with float and integer")
    float_assert("11.5","2.3*5", "Failed to do a simple multiplication with float and integer")
    float_assert("11.5","5*2.3", "Failed to do a simple multiplication with float and integer")
  end

  # singled out to ensure proper treatment of integer division
  def test_division
    float_assert("0.147826087","3.4/23", "Failed to do a simple division with float and integer")
    float_assert("12.261580381","45/3.67", "Failed to do a simple division with float and integer")

    float_assert("1", "4/3", "Failed to ensure that integer division happens")
  end
end


