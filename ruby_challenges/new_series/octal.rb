# octal.rb - Octal

# Implement octal to decimal conversion. Given an octal input string, your
# program should produce a decimal output. Treat invalid input as octal 0.

# Note: Implement the conversion yourself. Don't use any built-in or library
# methods that perform the necessary conversions for you. In this exercise, the
# code necessary to perform the conversion is what we're looking for,

# About Octal (Base-8)

# Decimal is a base-10 system. A number 233 in base 10 notation can be
# understood as a linear combination of powers of 10:

=begin

The rightmost digit gets multiplied by 100 = 1
The next digit gets multiplied by 101 = 10
The digit after that gets multiplied by 102 = 100
The digit after that gets multiplied by 103 = 1000
...
The n*th* digit gets multiplied by 10n-1.
All of these values are then summed.
Thus:

  233 # decimal
= 2*10^2 + 3*10^1 + 3*10^0
= 2*100  + 3*10   + 3*1
Octal numbers are similar, but the use powers of 8 instead of powers of 10. Thus:

  233 # octal
= 2*8^2 + 3*8^1 + 3*8^0
= 2*64  + 3*8   + 3*1
= 128   + 24    + 3
= 155

=end

=begin --> PEDAC

problem/rules:
  - given an input string, return the octal value of the number represented
  - invalid input should return 0

input: string
output: integer

data structure:
  - define class Octal
  - define #initialize with one parameter (input)
  - define #to_decimal with no parameters

algorithm:
  - guard clause should return 0 if input includes anything other than 0-7
  - valid input should be converted to array and reversed in order (use #digits)
  - initialize (result) to 0
  - iterate through array with index
      - multiply element by 8 to the power of index and add product to (result)
  - return result
=end

class Octal
  def initialize(input)
    @input = input
  end

  def to_decimal
    return 0 if @input.match?(/[^0-7]/)
    result = 0
    @input.to_i.digits.each_with_index do |dig, idx|
      result += dig * 8**idx
    end
    result
  end
end
