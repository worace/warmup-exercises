require_relative './worace_scrabble'
require 'minitest/autorun'

class ScrabbleTest < MiniTest::Unit::TestCase
  def test_empty_word_scores_zero
    assert_equal 0, Scrabble.score("")
  end

  def test_simple_word_scores_the_number_of_letters
    assert_equal 6, Scrabble.score("street")
  end

  def test_complicated_word_scores_more
    assert_equal 22, Scrabble.score("quirky")
  end

  def test_case_insensitive
    assert_equal 20, Scrabble.score("MULTIBILLIONAIRE")
  end

  def test_double_word
    assert_equal 12, Scrabble.score("street", :double_word)
  end

  def test_triple_word
    assert_equal 18, Scrabble.score("street", :triple_word)
  end

  def test_triple_letter
    assert_equal 8, Scrabble.score("street", :triple_letter_3)
  end

  def test_double_and_triple_letter
    assert_equal 9, Scrabble.score("street", :triple_letter_3, :double_letter_1)
  end

  def test_allows_any_order_for_mods
    assert_equal 18, Scrabble.score("street", :double_word, :triple_letter_3, :double_letter_1)
    assert_equal 18, Scrabble.score("street", :triple_letter_3, :double_word, :double_letter_1)
    assert_equal 18, Scrabble.score("street",  :double_letter_1, :triple_letter_3, :double_word)
  end
end
