class Fixnum
  def mod?(int)
    self % int == 0
  end
end
class Year
  attr_accessor :year
  def initialize(year)
    raise ArgumentError.new("give an int please") unless year.is_a?(Fixnum)
    self.year = year
  end

  def leap?
    year.mod?(400) || (year.mod?(4) && !(year.mod?(100)))
  end
end
