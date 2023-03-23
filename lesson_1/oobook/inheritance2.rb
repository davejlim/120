=begin
Create a class 'Student' with attributes name and grade. Do NOT make the grade getter public, so joe.grade will raise an error. 
Create a better_grade_than? method, that you can call like so...
=end

class Student
  attr_accessor :name
  attr_reader :grade

  GRADES = %w(A B C D F)

  def initialize(name, grade)
   self.name = name
   @grade = grade.upcase
  end

  def better_grade_than?(compared_student)
    GRADES.index(self.grade) < GRADES.index(compared_student.grade)
  end
end

p student1 = Student.new('Bob', 'a')
p student2 = Student.new('Pete', 'b')
p student1.better_grade_than?(student2)
p student1.grade
p student2.grade
p student2.better_grade_than?(student1)