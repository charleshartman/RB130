# cash_register_test.rb

require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @drawer = CashRegister.new(500)

    @transaction1 = Transaction.new(100)
    @transaction2 = Transaction.new(50)
    @transaction1.amount_paid = 100
    @transaction2.amount_paid = 60
  end

  def test_accept_money
    old_drawer = @drawer.total_money
    @drawer.accept_money(@transaction1)
    current_drawer = @drawer.total_money
    assert_equal(old_drawer + 100, current_drawer)
  end

  def test_change
    @drawer.accept_money(@transaction1)
    assert_equal(0, @drawer.change(@transaction1))
    @drawer.accept_money(@transaction2)
    assert_equal(10, @drawer.change(@transaction2))
  end

  def test_give_receipt
    assert_output("You've paid $#{@transaction1.item_cost}.\n") do
      @drawer.give_receipt(@transaction1)
    end
    assert_output("You've paid $#{@transaction2.item_cost}.\n") do
      @drawer.give_receipt(@transaction2)
    end
  end
end
