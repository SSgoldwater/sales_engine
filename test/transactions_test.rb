require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/transactions.rb'

class TransactionsTest < Minitest::Test

  def test_it_exists
    transactions_repository = TransactionsRepository.new
    assert transactions_repository
  end
  
end
