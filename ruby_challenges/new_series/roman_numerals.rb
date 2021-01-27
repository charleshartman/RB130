# roman_numerals.rb - Roman Numerals

=begin

The Romans were a clever bunch. They conquered most of Europe and ruled it for
hundreds of years. They invented concrete and straight roads and even bikinis.
One thing they never discovered though was the number zero. This made writing
and dating extensive histories of their exploits slightly more challenging, but
the system of numbers they came up with is still in use today. For example the
BBC uses Roman numerals to date their programmes.

The Romans wrote numbers using letters - I, V, X, L, C, D, M. Notice that these
letters have lots of straight lines and are hence easy to hack into stone
tablets.

 1  => I
10  => X
 7  => VII

There is no need to be able to convert numbers larger than about 3000.
(The Romans themselves didn't tend to go any higher)

Wikipedia says: Modern Roman numerals ... are written by expressing each digit
separately starting with the left most digit and skipping any digit with a value
of zero.

To see this in practice, consider the example of 1990. In Roman numerals,
1990 is MCMXC:

1000=M
900=CM
90=XC

2008 is written as MMVIII:
2000=MM
8=VIII

=end

=begin --> PEDAC

problem/rules:
  - given an integer, return the equivalent in Roman Numerals as a string
  - we only need to be concerned with years 1 to 3000

input: integer
output: string

data structure:
  - define class RomanNumeral with one parameter
  - define constructor with one parameter (num)
  - define instance method #to_roman to convert
  - possible helper method(s)
  - possible hash dictionary

algorithm:
  - main method:
    - split (num) integer into digits
    - initialize result to ''
    - iterate through each element in year
      - convert digit to roman numeral and push to result string
      - use helper, helper uses digits and builds array result, then reverses
        and joins array for final result
    - return result

    - conversion method:
      - four places: ones, tens, hundreds, thousands
        - at index -> 0     1       2          3
      - each place has primary marker and middle marker
        ones: primary I, middle V, next x
        tens: primary X, middle L, next C
        hundreds: primary C, middle D, next M
        thousands: primary M
      - 1-3 : x * primary
      - 4: 1 primary + 1 middle
      - 5: 1 middle
      - 6-8: 1 middle + x * primary
      - 9: 1 primary + 1 next
      { :ones => ['I', 'V', 'X'],
        :tens => ['X', 'L', 'C'],
        :hundreds => ['C', 'D', 'M'],
        :thousands => ['M'] }
=end

class RomanNumeral
  attr_reader :num

  ROMAN = { 0 => ['I', 'V', 'X'],
            1 => ['X', 'L', 'C'],
            2 => ['C', 'D', 'M'],
            3 => ['M'] }

  def initialize(num)
    @num = num.digits
  end

  def to_roman
    idx = 0
    num.each_with_object([]) do |digit, result|
      case digit
      when 1..3   then result << ROMAN[idx][0] * num[idx]
      when 4      then result << ROMAN[idx][0] + ROMAN[idx][1]
      when 5      then result << ROMAN[idx][1]
      when 6..8   then result << ROMAN[idx][1] + ROMAN[idx][0] * (num[idx] - 5)
      when 9      then result << ROMAN[idx][0] + ROMAN[idx][2]
      end
      idx += 1
    end.reverse.join
  end
end
