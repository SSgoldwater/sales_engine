require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/transaction.rb'

class TransactionsTest < Minitest::Test

  def setup
    @transaction = Transaction.new({:invoice_id => 3, :credit_card_number => 1234567887654321, :result => 'success'}, nil)
  end

  def test_it_exists
    assert @transaction
  end

  def test_it_stores_invoice_id
    assert_equal 3, @transaction.invoice_id
  end

  def test_it_stores_credit_card_number
    assert_equal 1234567887654321, @transaction.credit_card_number
  end

  def test_it_stores_result
    assert_equal 'success', @transaction.result
  end

end

require_relative '../lib/transaction_parser.rb'

class TransactionParserTest < Minitest::Test

  def test_it_exists
    filename = "./test/support/transactions_test.csv"
    transactionparser = TransactionParser.new(filename)
    assert transactionparser
  end

  def test_it_parses_a_csv
    filename = "./test/support/transactions_test.csv"
    transactionparser = TransactionParser.new(filename)
    transactions = transactionparser.parse

    first = transactions[0]
    assert_equal 1, first.invoice_id
    assert_equal 4654405418249632, first.credit_card_number
    assert_equal "success", first.result

    second = transactions[1]
    assert_equal 2, second.invoice_id
    assert_equal 4580251236515201, second.credit_card_number
    assert_equal "failure", second.result
  end

end
