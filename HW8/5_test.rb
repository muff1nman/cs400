#! /usr/bin/env ruby
#
# Copyright © 2013 Andrew DeMaria (muff1nman) <ademaria@mines.edu>
#
# All Rights Reserved.

require 'test/unit'
require_relative 'test_helper.rb'

class Exercise5 < Test::Unit::TestCase
  def test_register_saves
    float_assert("6", "{R1=2;R1*3;}", "Simple integer register save")
    float_assert("3.0", "{R5=1.5;R5*2;}", "Simple float register save")
  end

  def test_correct_register_usage
    # NOTE: The program should complain about an error.  This is expected!
    (0..4).each do |i|
      float_not_assert("3.0", "{R#{i}=1.5;R#{i}*2;}","Simple improper integer register#{i} save")
    end
    (5..9).each do |i|
      float_not_assert("6", "{R#{i}=2;R#{i}*3;}", "Simple improper float register#{i} save")
    end
  end

  def test_register_start_value_is_zero
    float_assert("0", "{R2*3;}", "Test for register initialized to zero")
  end


end


