# roller_test.rb

require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'roller'

class RollDiceTest < Minitest::Test
  def test_roll_returns_truthy
    one_d20 = RollDice.new(1, 20)
    assert one_d20.roll
  end

  def test_is_rolldice_object
    four_d6 = RollDice.new(4, 6)
    assert_instance_of RollDice, four_d6
  end

  def test_roll_outputs
    two_d8 = RollDice.new(2, 8)
    two_d8.roll
    assert_equal 2, two_d8.result.size
  end

  def test_drop
    four_d6 = RollDice.new(4, 6)
    four_d6.roll.drop_and_sum
    assert_equal 3, four_d6.result.size
  end

  def test_drop_returns_nil
    four_d6 = RollDice.new(4, 6)
    assert_nil four_d6.roll.drop_and_sum
  end
end
