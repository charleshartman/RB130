# cr_test_part6.rb - Alter Prompt For Payment Method - Transaction

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(77)
    customer_payment = StringIO.new("77\n")
    take_out = StringIO.new
    transaction.prompt_for_payment(input: customer_payment, output: take_out)
    assert_equal(77, transaction.amount_paid)
  end
end
