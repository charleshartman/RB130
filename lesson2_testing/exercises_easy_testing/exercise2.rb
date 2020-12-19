# exercise2.rb - Equality Assertions

# Write a minitest assertion that will fail if value.downcase does not
# return 'xyz'.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class CaseTest < MiniTest::Test
  def test_downcase?
    value = 'XYZ'
    assert_equal('xyz', value.downcase)
  end
end

# #assert_equal tests whether its first two arguments are equal using #==.
# Failure messages issued by #assert_equal assume that the first argument
# represents the expected value, while the second argument represents the
# actual value to be tested. It's important to maintain this convention so
# that failure messages make sense.
