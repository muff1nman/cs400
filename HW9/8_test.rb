#! /usr/bin/env ruby
#
# Copyright © 2013 Andrew DeMaria (muff1nman) <ademaria@mines.edu>
#
# All Rights Reserved.

require 'test/unit'
require_relative 'test_helper.rb'

class Exercise8 < Test::Unit::TestCase
  def test_floating_point_simple_format
    float_assert( "2.3", "2.3", "Failed simple float format")
    float_assert( ".3", ".3", "Failed simple float format with missing preceding decimal")
    float_assert( "3.", "3.", "Failed simple float format with missing trailing decimal")
  end

  def test_floating_point_exponential_format
    float_assert( "2.3*10^30", "2.3*10^30", "Failed simple exponential format")
    float_assert( "2.3E10", "2.3E10", "Failed simple exponential format")
    float_assert( "2.3e12", "2.3e12", "Failed simple exponential format")
  end

  def test_floating_point_exponential_format_with_negatives
    float_assert( "2.3*10^-30", "2.3*10^-30", "Failed simple exponential format")
    float_assert( "2.3E-1", "2.3E-1", "Failed simple exponential format")
    float_assert( "2.3e-30", "2.3e-30", "Failed simple exponential format")
  end
end


