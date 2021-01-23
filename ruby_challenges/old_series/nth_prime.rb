# nth_prime.rb - Nth Prime

# Write a program that can tell you what the nth prime is.

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
# that the 6th prime is 13.

# Do not use Ruby's Prime class nor any of the prime-number testing methods
# in the Integer class. For an algorithm to determine whether a number is
# prime, check out this article.

=begin --> PEDAC

problem/rules:
  - return the nth prime from an array of primes numbers
  - build the array without using Prime or Integer 'prime-testing' methods

input: integer (nth prime)
output: integer (prime number nth place in list (array) of primes)

data structure:
  - class Prime
  - define class method #nth

algorithm:
  - guard clause raises ArgumentError of given num (nth) is less than 1
  - initialize (primes) to []
  - initialize starting counter (n) to 2
  - until (primes) length is equal to (nth)
    - iterate from 2 to the sqrt of counter (n)
      - if none of the iterations return true to % 0
        then number is prime and gets pushed to the (primes) array
    return last prime in (primes) array

=end

class Prime
  def self.nth(num)
    raise ArgumentError if num < 1
    primes = []
    n = 2
    until primes.length == num
      primes << n if 2.upto(Math.sqrt(n)).none? { |x| n % x == 0 }
      n += 1
    end
    primes.last
  end
end
