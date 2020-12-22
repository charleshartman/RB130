# exercise4.rb - Divisors

# Write a method that returns a list of all of the divisors of the positive
# integer passed in as an argument. The return value can be in any sequence
# you wish.

def divisors(int)
  result = []
  (1..int / 2).each { |num| result << num if int % num == 0 }
  result << int
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

# another student (AJ):
# def divisors(n)
#   arr = []
#   1.upto(Math.sqrt(n)) { |i| (arr << i << n / i) if (n % i == 0) }
#   arr.uniq.sort
# end

=begin --> PEDAC

problem/rules:
  - eturn an array of all divisors of the given integer (argument)

input: integer
output: array

data structure: integers, array

algorithm:
  - initialize RESULT array to []
  - iterate from 1 to given integer
  - if given integer divided by iterator is 0, then add to result array

=end
