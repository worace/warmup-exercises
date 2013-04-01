class School
  attr_accessor :name, :db

  def initialize(name)
    self.name = name
    self.db = {}
  end

  def add(student_name, grade)
    db[grade] = [] if db[grade].nil?
    db[grade] << student_name
  end

  def grade(grade)
    db[grade]
  end

  def sort
    sorted = {}
    db.keys.sort.map { |k| sorted[k] = grade(k).sort }
    sorted
  end
end
