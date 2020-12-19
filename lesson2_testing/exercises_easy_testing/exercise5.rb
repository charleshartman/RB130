# exercise5.rb - Included Object Assertions

# Write a minitest assertion that will fail if the 'xyz' is not
# in the Array list.

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class IncludeTest < Minitest::Test
  def setup
    @list = ['abc', 34, :oak, 'xyz']
  end

  def test_includes?
    assert_includes(@list, 'xyz')
    assert_includes(@list, :oak)
  end
end
