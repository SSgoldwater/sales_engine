require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/transaction_repository.rb'

class TransactionRepositoryTest < Minitest::Test

  def test_it_exists
    transaction_repository = TransactionRepository.new
    assert transaction_repository
  end

end
