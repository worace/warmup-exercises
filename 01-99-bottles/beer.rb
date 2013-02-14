class Beer
  attr_accessor :total_rounds, :current_round

  def initialize(rounds = 99)
    self.current_round = self.total_rounds = rounds
  end

  def self.song
    self.new.song
  end

  def song
    while current_round >= 0 do
      puts first_line
      puts second_line
      advance_round
    end
  end

private

  def next_round
    current_round - 1
  end

  def advance_round
    puts unless current_round == 0
    self.current_round = next_round
  end

  def first_line
    "#{bottles(current_round)} of beer on the wall, #{bottles(current_round)} of beer.".capitalize
  end

  def second_line
    case
    when current_round > 0
      standard_second_line
    else
      final_seond_line
    end
  end

  def standard_second_line
    "Take #{one_or_it} down and pass it around, #{bottles(next_round)} of beer on the wall."
  end

  def final_seond_line
    "Go to the store and buy some more, #{total_rounds} bottles of beer on the wall."
  end

  def one_or_it
    current_round > 1 ? "one" : "it"
  end

  def bottles(round)
    if round > 1
      "#{round} bottles"
    elsif round == 1
      "#{round} bottle"
    elsif round == 0
      "no more bottles"
    else
      "error"
    end
  end
end
