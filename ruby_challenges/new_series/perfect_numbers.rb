# perfect_numbers.rb - Perfect Number

# The Greek mathematician Nicomachus devised a classification scheme for natural
# numbers, identifying each as belonging uniquely to the categories of abundant,
# perfect, or deficient based on a comparison between the number and the sum of
# its positive divisors (the numbers that can be evenly divided into the target
# number with no remainder, excluding the number itself). For instance, the
# positive divisors of 15 are 1, 3, and 5. This sum is known as the Aliquot sum.

# Perfect numbers have an Aliquot sum that is equal to the original number.
# Abundant numbers have an Aliquot sum that is greater than the original number.
# Deficient numbers have an Aliquot sum that is less than the original number.
# Examples:

# 6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.

# 28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and
# 1 + 2 + 4 + 7 + 14 = 28.

# 15 is a deficient number since its divisors are 1, 3, and 5 and
# 1 + 3 + 5 = 9 which is less than 15.

# 24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and
# 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.

# Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.

# Write a program that can tell whether a number is perfect, abundant, or
# deficient.

=begin --> PEDAC

problem/rules:
  - given a number, determine if it is perfect, abundant or deficient
  - sum of divisors > number is abundant, < number is deficient, == is perfect
  - raise StandardError if number is less than 0

input: natural number
output: string (perfect, abundant, or deficient)

data structure:
  define class PerfectNumber
  define constructor #initialize with one parameter (number)
  define CLASS METHOD #classify:
    - guard clause
    - helper method for getting and summing divisors
    - determine perfect, abundant, or deficient
    - return result

algorithm:
  - helper: getting and summing divisors
    - initialize (divisors) to []
    - iterate from 1 to one less than number
      - if number % iterator == 0 then add iterator to (divisors)
    - return sum of (divisors) to #classify
  - main: determine output for valid input
    - guard clause
    - return output based on return of helper #sum_of_divisors
=end

class PerfectNumber
  def self.classify(number)
    raise StandardError if number < 1
    result = 1.upto(number - 1).select { |num| number % num == 0 }.sum
    return 'perfect' if result == number
    result < number ? 'deficient' : 'abundant'
  end
end
