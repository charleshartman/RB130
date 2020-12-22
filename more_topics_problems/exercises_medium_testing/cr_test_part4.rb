# cr_test_part4.rb - Test Give Receipt Method - Cash Register

# Write a test for method CashRegister#give_receipt that ensures it
# displays a valid receipt.

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    drawer = CashRegister.new(500)
    transaction = Transaction.new(45)
    transaction.amount_paid = 45

    old_drawer = drawer.total_money
    drawer.accept_money(transaction)
    new_drawer = drawer.total_money
    assert_equal(old_drawer + 45, new_drawer)
  end

  def test_change
    drawer = CashRegister.new(500)
    transaction = Transaction.new(75)
    transaction.amount_paid = 100

    assert_equal(25, drawer.change(transaction))
  end

  def test_give_receipt
    drawer = CashRegister.new(500)
    transaction = Transaction.new(35)

    assert_output("You've paid $#{transaction.item_cost}.\n") do
      drawer.give_receipt(transaction)
    end
  end
end

# Note: cam also look at #capture_io
