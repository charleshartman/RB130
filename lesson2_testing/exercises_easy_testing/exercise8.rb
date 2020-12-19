# exercise8.rb - Kind Assertions

# Write a minitest assertion that will fail if the class of value is not
# Numeric or one of Numeric's subclasses (e.g., Integer, Float, etc).

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class KindTest < Minitest::Test
  def test_kind?
    object = 13
    assert_kind_of(Numeric, object)
    [1, 1.0, 1r, Complex(1)].each { |num| assert_kind_of(Numeric, num) }
  end
end
