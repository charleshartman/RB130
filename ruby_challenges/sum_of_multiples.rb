# sum_of_multiples.rb - Sum of Multiples

# Write a program that, given a number, can find the sum of all the multiples
# of particular numbers up to but not including that number.

# If we list all the natural numbers up to but not including 20 that are
# multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum
# of these multiples is 78.

# Write a program that can find the sum of the multiples of a given set of
# numbers. If no set of numbers is given, default to 3 and 5.

=begin --> PEDAC

problem/rules:
  - given three arguments, two 'multiples' and one greatest number, find all
    multiples of the two multiples up to but not including the greatest number
  - then sum that array of digits
  - default multiples are 3 and 5

input: up to three integers (first two default to 3 and 5)
output: single integer

data structure:
  - class SumOfMultiples
  - initialize *MULTIPLES
  - initialize RESULT array to []

algorithm:
  - initialize MULTIPLES array to *MULTIPLES argument
  - main method TO(NUM)
    - initialize local variable MULTIPLIER to 1
    - iterate through MULTIPLES
      - if M * MULTIPLIER < NUM then append M * MULTIPLIER to RESULT array
      - break if all? products >= NUM
      - add 1 to MULTIPLIER
    - return sum of RESULT

=end

require 'pry'

class SumOfMultiples
  # attr_reader :multiples

  def initialize(*multiples)
    @multiples = multiples
    @multiples = [3, 5] if @multiples.empty?
  end

  def to(num)
    result = []
    multiplier = 1
    loop do
      @multiples.each { |m| result << m * multiplier if m * multiplier < num }
      break if @multiples.all? { |m| m * multiplier >= num }
      multiplier += 1
    end
    result.uniq.sum
  end
end

# p SumOfMultiples.new.multiples
p SumOfMultiples.new(4, 6).to(15) == 30
p SumOfMultiples.new(43, 47).to(10_000) == 2_203_160
