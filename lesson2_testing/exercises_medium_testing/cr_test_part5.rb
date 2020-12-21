# cr_test_part5.rb - Test Prompt For Payment Method - Transaction

# Write a test that verifies that Transaction#prompt_for_payment sets the
# amount_paid correctly.

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(77)
    customer_payment = StringIO.new("77\n")
    transaction.prompt_for_payment(input: customer_payment)
    assert_equal(77, transaction.amount_paid)
  end
end
