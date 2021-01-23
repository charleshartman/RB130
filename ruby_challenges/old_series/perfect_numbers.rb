# perfect_numbers.rb - Perfect Number

# The Greek mathematician Nicomachus devised a classification scheme for natural
# numbers, identifying each as belonging uniquely to the categories of abundant,
# perfect, or deficient. A perfect number equals the sum of its positive
# divisors - the pairs of numbers whose product yields the target number,
# excluding the number itself. This sum is known as the Aliquot sum.

# Perfect: Sum of factors = number
# Abundant: Sum of factors > number
# Deficient: Sum of factors < number

# Examples:
# 6 is a perfect number because its divisors are 1, 2, 3 and 6 = 1 + 2 + 3.
# 28 is a perfect number because 28 = 1 + 2 + 4 + 7 + 14.
# Prime numbers 7, 13, etc are deficient by the Nicomachus classification.

# Write a program that can tell if a number is perfect, abundant or deficient.

=begin --> PEDAC

problem/rules:
  - given a positive integer return if it is either a perfect, abundant or
    deficient number
  - raise error if argument is not positive

input: integer
output: string

data structure:
  - class PerfectNumber
  - define classify method

algorithm:
  - raiseerror if number.negative?
  - initialize (factors) array to []
  - iterate from 1..number/2
    - if number % iterator is 0 then add iterator to (factors)
  - case factors.sum
    - return appropriate string

=end

class PerfectNumber
  def self.classify(number)
    raise StandardError unless number.positive?
    factors_sum = (1..number / 2).select { |n| number % n == 0 }.sum
    return 'perfect' if factors_sum == number
    factors_sum > number ? 'abundant' : 'deficient'
  end
end

p PerfectNumber.classify(33_550_336)
