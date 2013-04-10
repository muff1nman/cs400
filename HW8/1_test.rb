require 'test/unit'
require_relative 'test_helper.rb'

class Exercise1 < Test::Unit::TestCase
  def test_simple_addition
    assert_equal(formatted_result("7"),format_result(run_calculator("3+4")), "Failed simple addition")
  end

  def test_simple_subtraction
    assert_equal(formatted_result("1"), format_result(run_calculator("7-6")), "Failed simple subtraction")
    assert_equal(formatted_result("-4"), format_result(run_calculator("3-7")), "Failed simple subtraction with negative result")
  end

  def test_simple_division
    assert_equal(formatted_result("2"), format_result(run_calculator("6/3")), "Failed simple division")
  end

  def test_simple_multiplication
    assert_equal(formatted_result("15"), format_result(run_calculator("3*5")), "Failed simple multiplication")
  end

  def test_long_subtraction_and_addition
    assert_equal(formatted_result("12"), format_result(run_calculator("3+8+1")), "Failed multiple additions")
    assert_equal(formatted_result("1"), format_result(run_calculator("5-3-1")), "Failed multiple subtractions")
    assert_equal(formatted_result("-6"), format_result(run_calculator("3-2-7")), "Failed multiple subtractions with negative result")
    assert_equal(formatted_result("2"), format_result(run_calculator("4-3+1")), "Failed a mix of subtractions and additions")
    assert_equal(formatted_result("-2"), format_result(run_calculator("4-3-4+1")), "Failed a mix of subtractions and additions with negative result")
  end

  def test_long_multiplication_and_division
    assert_equal(formatted_result("24"), format_result(run_calculator("3*2*4")), "Failed multiple multiplications")
    assert_equal(formatted_result("1"), format_result(run_calculator("12/3/4")), "Failed multiple divisions")
    assert_equal(formatted_result("8"), format_result(run_calculator("12/3*2")), "Failed mix of multiplication and division")
    assert_equal(formatted_result("6"), format_result(run_calculator("3*4/2")), "Failed mix of multiplication and division")
  end

  def test_simple_operator_precedence
    assert_equal(formatted_result("14"), format_result(run_calculator("2+3*4")), "Failed multiplication before addition")
    assert_equal(formatted_result("-10"), format_result(run_calculator("2-3*4")), "Failed multiplication before subtraction")
    assert_equal(formatted_result("12"), format_result(run_calculator("10+4/2")), "Failed division before addition")
    assert_equal(formatted_result("10"), format_result(run_calculator("12-6/3")), "Failed division before subtraction")
  end

  def test_complex_operator_precedence
    assert_equal(formatted_result("-2"), format_result(run_calculator("2+4/2-6")), "Failed division in the middle")
    assert_equal(formatted_result("36"), format_result(run_calculator("2+4*10-6")), "Failed multiplication in the middle")
    puts derivation(run_calculator("4+6/6+6*7-8-9+23*6-2+4/2-3"))
    assert_equal(formatted_result("165"), format_result(run_calculator("4+6/6+6*7-8-9+23*6-2+4/2-3")), "Failed a long random one")
  end

end
