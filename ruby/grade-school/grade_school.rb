class School
  def initialize
    @grades = Hash.new { |h, k| h[k] = Grade.new(k) }
  end

  def students(grade)
    @grades[grade].students
  end

  def add(student_name, grade)
    @grades[grade] << student_name
  end

  def students_by_grade
    @grades.values.sort.map(&:to_h)
  end
end

class Grade
  include Comparable

  attr_reader :students, :number

  def initialize(number)
    @number = number
    @students = []
  end

  def add(student_name)
    @students << student_name
    @students.sort!
  end
  alias << add

  def <=>(grade)
    @number <=> grade.number
  end

  def to_h
    { grade: @number, students: @students }
  end
end

module BookKeeping
  VERSION = 3
end
