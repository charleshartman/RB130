# cr_test_part2.rb - Test Accept Money Method - Cash Register

# We now have the foundation of our CashRegister test class set up. Let's start
# testing! We'll start with the CashRegister#accept_money method. Write a test
# for the #accept_money method.

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
end
