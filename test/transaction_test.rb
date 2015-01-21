require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/transaction.rb'

class TransactionsTest < Minitest::Test

  def test_it_exists
    transaction = Transaction.new
    assert transaction
  end

end
