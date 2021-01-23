# octal_rf2.rb - Octal

# student solution I like:

class Octal
  def initialize(str)
    @digits = str.chars
  end

  def to_decimal
    return 0 if @digits.any? { |digit| digit =~ /[^0-7]/ }
    @digits
      .map(&:to_i)
      .reverse
      .each_with_index
      .map { |digit, index| digit * (8**index) }
      .inject(:+)
  end
end

p Octal.new('233').to_decimal == 155
p Octal.new('1').to_decimal == 1
p Octal.new('011').to_decimal == 9
p Octal.new('17').to_decimal == 15
p Octal.new('130').to_decimal == 88
p Octal.new('10').to_decimal == 8
p Octal.new('188').to_decimal
