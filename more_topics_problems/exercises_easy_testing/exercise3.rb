# exercise3.rb - Nil Assertions

# Write a minitest assertion that will fail if value is not nil.

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NilTest < Minitest::Test
  def test_nil?
    value = nil
    assert_nil(value)
  end
end
