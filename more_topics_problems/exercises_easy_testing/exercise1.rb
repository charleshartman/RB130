# exercise1.rb - Boolean Assertions

# Write a minitest assertion that will fail if the value.odd? is not true.

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class BooleanTest < Minitest::Test
  def test_is_odd?
    value = 13
    assert_equal(true, value.odd?)
  end
end
