# series.rb - Series

=begin

Write a program that will take a string of digits and return all the possible
consecutive number series of a specified length in that string.

For example, the string "01234" has the following 3-digit series:

012
123
234
Likewise, here are the 4-digit series:

0123
1234
Finally, if you ask for a 6-digit series from a 5-digit string, you should
throw an error.

=end

=begin --> PEDAC

problem/rules:
  - given a string of digits, and an integer argument specifying a "length",
    return all possible consecutive number series of that length from the
    supplied string
  - guard: raise ArgumentError if given int arg is > length of string of digits

input: string (of digits)
output: array of arrays containing possible series

data structure:
  - define class Series
  - define constructive with one parameter (str)
  - define instance method #slices with one parameter (slice)

algorithm:
  - #initialize:
    - initialize instance variable @nums and assign str converted to array with
      each element converted to an integer

  - #slices:
    - raise ArgumentError if slice argument is greater than length of @nums
    - initialize result to []
    - iterate through @nums and push each consecutive slice into result array
    - return result
=end

class Series
  def initialize(str)
    @nums = str.chars.map(&:to_i)
  end

  def slices(slice)
    raise ArgumentError if slice > nums.length
    nums.each_cons(slice).to_a
  end

  private

  attr_reader :nums
end
