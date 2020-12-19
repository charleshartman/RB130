# exercise4.rb - Empty Object Assertions

# Write a minitest assertion that will fail if the Array list is not empty.

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class EmptyTest < Minitest::Test
  def test_empty?
    arr = []
    assert_empty(arr)
  end
end
