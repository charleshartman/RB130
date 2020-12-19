# exercise10.rb - Refutations

# Write a test that will fail if 'xyz' is one of the elements in the
# Array list.

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class RefuteTest < Minitest::Test
  def test_not_include?
    list = [1, 2, 3, 4, 5]
    refute_includes(list, 'xyz')
  end
end
