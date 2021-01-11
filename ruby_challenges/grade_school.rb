# grade_school.rb - Grade School

=begin

Write a small archiving program that stores students' names along with the
grade that they are in.

In the end, you should be able to:

Add a student's name to the roster for a grade
"Add Jim to grade 2."
"OK."

Get a list of all students enrolled in a grade
"Which students are in grade 2?"
"We've only got Jim just now."

Get a sorted list of all students in all grades. Grades should sort as 1, 2, 3,
etc., and students within a grade should be sorted alphabetically by name.

{1=>["Anna", "Barb", "Charlie"], 2=>["Alex", "Peter"], ...}

The exact output format doesn't matter: what's important is that it shows all
of the students and grades in the proper order.

Note that all our students only have one name. (It's a small town, what do
you want?)

=end

=begin --> PEDAC

problem/rules:
  - store a name and grade level for each student
  - generate a sorted list students by grade level (hash)
  - return an empty array if no students in given grade lvl

input: 
output: 

data structure:
  - define class School
  - initialize with single instance variable (school) to {}
  - define instance method #add to add students, grade
  - define instance method to_h that returns the sorted list of each grade
    and students in that grade

algorithm:
  - essentially we are just writing a class that adds students and grades
    to a hash and returns a sorted hash master list or arrays based on specific
    grades depending on the method invocation (#to_h or #grade)
  - also need #add method to add to master hash (school)

=end

class School
  def initialize
    @roll_call = Hash.new([])
  end

  def add(name, grade)
    roll_call[grade] += [name]
  end

  def to_h
    roll_call.each_value(&:sort!).sort.to_h
  end

  def grade(num)
    roll_call[num]
  end

  private

  attr_reader :roll_call
end
