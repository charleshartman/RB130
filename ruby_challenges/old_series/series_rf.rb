# series.rb - Series

# Write a program that will take a string of digits and give you all the
# possible consecutive number series of length n in that string.

# For example, the string "01234" has the following 3-digit series:
# - 012
# - 123
# - 234

# And the following 4-digit series:
# - 0123
# - 1234

class Series
  def initialize(str)
    raise ArgumentError, 'argument must be a string' unless str.is_a? String
    @digits = str.each_char.map(&:to_i)
  end

  def slices(n)
    raise ArgumentError if n > @digits.size
    @digits.each_cons(n).to_a
  end
end

bob = Series.new('12345')
bob.slices(3)
# Series.new(34)

# p bob.result

=begin --> PEDAC

problem/rules:
  - given a string of digits, return all possible consecutive number series
    of n number of digits
  - result should be an array of subarrays representing the possible series

input: string
output: array

data structure: str, int, array
  - one class (SERIES)
  - initialize method with one parameter (string)
  - assign string to instance variable @digits

algorithm:
  - initialize RESULT array to []
  - split string and convert to integers
  - guard clause to check if n digits argument if greater than str length
  - iterate through each consecutive combo of n digits
    - push into RESULT
  - return RESULT

=end
