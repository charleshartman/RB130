# sum_of_multiples.rb - Sum of Multiples

# Write a program that, given a natural number and a set of one or more other
# numbers, can find the sum of all the multiples of the numbers in the set that
# are less than the first number. If the set of numbers is not given, use a
# default set of 3 and 5.

# For instance, if we list all the natural numbers up to, but not including,
# 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18.
# The sum of these multiples is 78.

=begin --> PEDAC

problem/rules:
  - given a natural number and a collection of other numbers, find the sum of
    all multiples of each number in the collection up to, but not including the
    given natual number... we could call this number the (upper_limit) and the
    collection the (multiples)
  - if no collection is provided, default to [3, 5]

input: single integer (limit) and collection of integers (multiples)
output: sum of resultant array of multiples

data structure:
  - define class SumOfMultiples
  - define constructor #initialize with one parameter (*multiples)
  - define instance method #to with one parameter (upper_limit)
  - define class method #to with one parameter (upper_limit)

algorithm:
  - constructor #initialize:
    - if multiples is empty then assign [3, 5] collection to @multiples
    - else assign multiples to @multiples

  - instance method #to:
    - inotialize multiplier to 1
    - initialize result to []
    - iterate through multiples array
      - if element * multiplier is less than (upper_limit)
        - then push to result array
        - break if all elements * multiplier are greater than or equal to upper
        - increment multiplier by 1
    - return result summed
  
  - class method #to:
    - create new SumOfMultiples object and pass through (upper_limit)
=end

class SumOfMultiples
  attr_reader :multiples

  def initialize(*multiples)
    @multiples = multiples.empty? ? [3, 5] : multiples
  end

  def to(upper_limit)
    result = []
    multiplier = 1
    loop do
      multiples.each do |num|
        result << num * multiplier if num * multiplier < upper_limit
      end
      break if multiples.all? { |n| (n * multiplier) >= upper_limit }
      multiplier += 1
    end
    result.uniq.sum
  end

  def self.to(upper_limit)
    new.to(upper_limit)
  end
end
