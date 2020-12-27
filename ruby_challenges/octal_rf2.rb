# octal_rf2.rb - Octal

class Octal
  def initialize(str)
    @str = str
    @str = '0' if @str.match?(/[a-zA-Z9]/) || @str.to_i.between?(2, 8)
    @digits = @str.split('').map(&:to_i).reverse
    @result = 0
  end

  def to_decimal
    @digits.each_with_index { |num, idx| @result += num * (8**idx) }
    @result
  end
end

p Octal.new('233').to_decimal == 155
p Octal.new('1').to_decimal == 1
p Octal.new('011').to_decimal == 9
p Octal.new('17').to_decimal == 15
p Octal.new('130').to_decimal == 88
p Octal.new('10').to_decimal == 8
