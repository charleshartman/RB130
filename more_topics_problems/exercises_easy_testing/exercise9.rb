# exercise9.rb - Same Object Assertions

# Write a test that will fail if list and the return value of list.process
# are different objects.

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class Collection
  def process
    self
  end
end

class SameTest < Minitest::Test
  def setup
    @list = Collection.new
  end

  def test_same?
    assert_same(@list, @list.process)
  end
end
