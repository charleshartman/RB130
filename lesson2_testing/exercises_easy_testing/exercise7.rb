# exercise7.rb - Type Assertions

# Write a minitest assertion that will fail if value is not an instance of the
# Numeric class exactly. value may not be an instance of one of Numeric's
# superclasses.

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NumericExactTest < Minitest::Test
  def test_numeric_class?
    object = Numeric.new
    assert_instance_of(Numeric, object)
  end
end
