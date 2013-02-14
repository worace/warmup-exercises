require_relative './worace_year'
require 'minitest/autorun'

class YearTest < MiniTest::Unit::TestCase
  def test_vanilla_leap_year
    assert Year.new(1996).leap?
  end

  def test_any_old_year
    assert !Year.new(1997).leap?
  end

  def test_century
    assert !Year.new(1900).leap?
  end

  def test_exceptional_century
    assert Year.new(2000).leap?
  end
end

