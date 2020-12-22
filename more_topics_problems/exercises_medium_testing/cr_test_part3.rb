# cr_test_part3.rb - Test Change Method - Cash Register

# Write a test for the method, CashRegister#change.

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
end
