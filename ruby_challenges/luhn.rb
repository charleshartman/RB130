# luhn.rb - Luhn Algorithm

# The Luhn formula is a simple checksum formula used to validate a variety of
# identification numbers, such as credit card numbers and Canadian Social
# Insurance Numbers.

# The formula verifies a number against its included check digit, which is
# usually appended to a partial number to generate the full number. This number
# must pass the following test:

# Counting from rightmost digit (which is the check digit) and moving left,
# double the value of every second digit.

# For any digits that thus become 10 or more, subtract 9 from the result.
# 1111 becomes 2121.
# 8763 becomes 7733 (from 2*6=12 -> 12-9=3 and 2*8=16 -> 16-9=7).
# Add all these digits together.
# 1111 becomes 2121 sums as 2+1+2+1 to give a checksum of 6.
# 8763 becomes 7733, and 7+7+3+3 is 20.
# If the total (the checksum) ends in 0 (put another way, if the total modulo 10
# is congruent to 0), then the number is valid according to the Luhn formula;
# else it is not valid. So, 1111 is not valid (as shown above, it comes out to
# 6), while 8763 is valid (as shown above, it comes out to 20).

# Write a program that, given a number

# Can check if it is valid per the Luhn formula. This should treat, for
# example, "2323 2005 7766 3554" as valid.
# Can return the checksum, or the remainder from using the Luhn method.
# Can add a check digit to make the number valid per the Luhn formula and
# return the original number plus that digit. This should give "2323 2005 7766
# 3554" in  response to "2323 2005 7766 355".

=begin --> PEDAC

problem/rules:
  - multiple methods:
    1. validates given number per Luhn
    2. returns the checksum of the given number
    3. creates a check digit to make a number valid per Luhn

input: integer
output: integer or boolean

data structure:
  - class Luhn
  - initialize has one parameter (number)
  - class method: Luhn#create - gets valid check digit
  - instance method - #addends - creates an array to prepare for validation
  - instance method - #checksum - takes return of #addends and makes checksum
  - instance method - #valid? - does #addends.sum return true? (sum % 10 == 0)

algorithm:
  - #addends
    - initialize (work) array to []
    - convert integer argument to (reversed) array with #digits
    - iterate through array
      (arg.digits.map.with_index { |ele, idx| ... } )
      - if index is odd then double the value
        if value is > 10, subtract 9 from value
        else value
    - reverse (work)
    - return (work)

  - #checksum
    - return the sum of the elements in the array returned by #addends

  - #valid?
    - return boolean based on return of (checksum % 10 == 0)

  - self#create
    - initialize (work) array to []
    - convert int arg to array with #digits.reverse
    - iterate through array (map.with_index)
    - if index is even then double the value
      if value is > 10, subtract 9 from value
      else value
    - sum the (work) array
    - determine the difference between the sum and the next number % 10 == 0
    - append the check digit to the given number and return

=end

class Luhn
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def addends
    number.digits
          .map.with_index { |val, idx| idx.odd? ? val * 2 : val }
          .map { |val| val > 9 ? val - 9 : val }
          .reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(input)
    work = input.digits
                .map.with_index { |val, idx| idx.even? ? val * 2 : val }
                .map { |val| val > 9 ? val - 9 : val }
                .sum
    count = 0
    count += 1 until (work + count) % 10 == 0
    (input.to_s << count.to_s).to_i
  end
end
