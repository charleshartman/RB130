# trinary.rb - Trinary

# Write a program that will convert a trinary number, represented as a string
# (e.g. '102012'), to its decimal equivalent using first principles (without
# using an existing method or library that can work with numeral systems).

# Trinary numbers can only contain three symbols: 0, 1, and 2. Invalid trinary
# entries should convert to decimal number 0.

# The last place in a trinary number is the 1's place. The second to last is
# the 3's place, the third to last is the 9's place, etc.

=begin

"102012"
    1       0       2       0       1       2    # the number
1*3^5 + 0*3^4 + 2*3^3 + 0*3^2 + 1*3^1 + 2*3^0    # the value
  243 +     0 +    54 +     0 +     3 +     2 =  302

=end

class Trinary
  def initialize(str)
    @str = str
  end

  def to_decimal
    return 0 if @str.match(/[^0-2]/)

    @str
      .to_i
      .digits
      .each_with_index.map { |num, idx| num * 3**idx }
      .inject(:+)
  end
end

# p Trinary.new('1122000120').to_decimal == 32_091
# p Trinary.new('0a1b2c').to_decimal == 0
# p Trinary.new('222').to_decimal == 26
# p Trinary.new('1').to_decimal == 1

=begin --> PEDAC

problem/rules:
  - convert a given trinary number, represented as a string to its decimal
    equivalent (manually)
  - trinary numbers may only contain 0, 1 and 2

input: string
output: integer

data structure:
  - class Trinary
  - initialize STR
  - convert to array and iterate doing computation/conversion

algorithm:
  - instantiate new Trinary object with one argument
  - define initialize with one parameter STR assigned to instance variable @STR
  - check string for validity, return 0 if string [^0-2]
  - comvert string to integer and then array (digits)
  - iterate with index, map the product of multipling each element by 3 to the
    power of its index
  - sum contents of array

=end