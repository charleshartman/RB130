# triangle.rb - Triangles

# Write a program to determine whether a triangle is equilateral, isosceles, or
# scalene.

# An equilateral triangle has all three sides the same length.

# An isosceles triangle has exactly two sides of the same length.

# A scalene triangle has all sides of different lengths.

# Note: For a shape to be a triangle at all, all sides must be of length > 0,
# and the sum of the lengths of any two sides must be greater than or equal
# to the length of the third side.

=begin --> PEDAC

problem/rules:
  - given three arguments representing the lengths of sides of a triangle,
    determine if the triangle is equilateral, isosceles, or scalene.
  - return error if any side is < 1 OR if the lengths of any two sides is not
    greater than or equal to the third side

input: three integers
output: one of three strings => ['equilateral', 'isosceles', 'scalene']

data structure:
  - define class Triangle
  - define #initialize method that
    - puts arguments into an array (sides)
    - tests for validity and returns error if not valid
  - define #kind to return (result)

algorithm:
  - #initialize
    - put arguments in (sides) array and sort array
    - if any side is < 1 OR
        - if sides[0] + sides[1] is not equal to or greater than sides [2]
        - then raise ArgumentError

  - #kind
    - if all sides are equal then equilateral
    - if no sides are equal then scalene
    - else isosceles
=end

class Triangle
  def initialize(len1, len2, len3)
    @sides = [len1, len2, len3].sort
    raise ArgumentError.new, "One or more lengths is invalid." unless valid?
  end

  def kind
    case sides.uniq.length
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    when 3 then 'scalene'
    end
  end

  private

  attr_reader :sides

  def valid?
    sides.all? { |len| len > 0 } && sides[0] + sides[1] > sides[2]
  end
end
