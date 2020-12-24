# sieve.rb - Sieve of Eratosthenes

# Write a program that uses the Sieve of Eratosthenes to find all the primes
# from 2 up to a given number.

# The Sieve of Eratosthenes is a simple, ancient algorithm for finding all
# prime numbers up to any given limit. It does so by iteratively marking
# as composite (i.e. not prime) the multiples of each prime, starting with
# the multiples of 2.

# Create your range, starting at two and continuing up to and including the
# given limit. (i.e. [2, limit]).

# The algorithm consists of repeating the following over and over:
# => take the next available unmarked number in your list (it is prime)
# => mark all the multiples of that number (they are not prime)
# => Repeat until you have processed each number in your range.

# When the algorithm terminates, all the numbers in the list that have not been
# marked are prime. The wikipedia article has a useful graphic that explains
# the algorithm.

# Notice that this is a very specific algorithm, and the tests don't check that
# you've implemented the algorithm, only that you've come up with the correct
# list of primes.

=begin --> PEDAC

problem/rules:
  - given a positive integer, return an array of all prime numbers up to and
    including that number
  - do this by implementing the Sieve of Eratosthenes algorithm

input: integer
output: array

data structure:
  - single class SIEVE
  - initialize with integer argument, assign to GREATEST
  - define method to compute and return primes from 2..GREATEST
  - NUMBERS is hash with keys as numbers and :marked or :unmarked values
  - RESULT is array of primes

algorithm:
  - initialize RESULT to []
  - initialize NUMS to Hash.new(0)
  - fill Hash from 2..GREATEST keys at default value (0)
  - iterate through NUMS matking multiples of each key with value (still) at 0
    to 1
  - iterate through NUMS, add unmarked keys to RESULT array
  - return RESULT

=end

class Sieve
  def initialize(int)
    @greatest = int
    @nums = (2..@greatest).each_with_object({}) { |num, col| col[num] = 0 }
    @result = []
  end

  def mark_not_prime
    @nums.each do |num, marker|
      if marker == 0
        multiple = num
        @nums.each { |k, _| @nums[k] = 1 if k != multiple && k % multiple == 0 }
      end
    end
  end

  def primes
    mark_not_prime
    @nums.each { |k, v| @result << k if v == 0 }
    @result
  end
end

p Sieve.new(10).primes
p Sieve.new(100).primes
