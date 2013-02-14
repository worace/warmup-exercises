class ScrabbleScores
  def self.scores
    hash = Hash.new(1)
    hash[:d] = 2
    hash[:g] = 2
    hash[:b] = 3
    hash[:c] = 3
    hash[:m] = 3
    hash[:p] = 3
    hash[:f] = 4
    hash[:h] = 4
    hash[:w] = 4
    hash[:y] = 4
    hash[:k] = 5
    hash[:j] = 8
    hash[:x] = 8
    hash[:q] = 10
    hash[:z] = 10
    hash
  end
end

class String
  def letter_score
    ScrabbleScores.scores.send(:[], self.downcase.to_sym)
  end
end

class Scrabble

  attr_accessor :word, :modifiers

  def initialize(word, *modifiers)
    self.modifiers = modifiers.flatten
    self.word = word
  end

  def self.score(word, *modifiers)
    self.new(word, modifiers).score
  end

  def score
    letter_scores_with_modifiers(base_letter_scores).inject(0) { |carry, score| carry += score }
  end

  private

  def letter_scores_with_modifiers(letter_scores)
    letter_scores = scores_with_letter_bonuses(letter_scores) if letter_bonus?
    letter_scores = letter_scores.map {|s| s * 2} if double_word?
    letter_scores = letter_scores.map {|s| s * 3} if triple_word?
    letter_scores
  end

  def scores_with_letter_bonuses(scores)
    letter_bonuses.each do |bonus|
      scores[index_for_modifier(bonus)] = scores[index_for_modifier(bonus)] * multiplier_for_bonus(bonus)
    end
    scores
  end

  def base_letter_scores
    word.split(//).map(&:letter_score)
  end

  def double_word?
    modifiers.include?(:double_word)
  end

  def triple_word?
    modifiers.include?(:triple_word)
  end

  def index_for_modifier(bonus)
    bonus.to_s.gsub(/.*letter_/, "").to_i + 1
  end

  def multiplier_for_bonus(bonus)
    if bonus.match(/triple/)
      3
    elsif bonus.match(/double/)
      2
    else
      1
    end
  end

  def letter_bonuses
    modifiers.select { |modifier| modifier.match(/letter/) }
  end

  def letter_bonus?
    modifiers.any? { |mod| mod.match(/letter/) }
  end

end
