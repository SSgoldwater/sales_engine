require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/transaction_repository.rb'

class TransactionRepositoryTest < Minitest::Test

  def setup
    @transaction_repository = TransactionRepository.new('./test/support/transactions_test.csv', nil)
  end

  def test_it_exists
    assert @transaction_repository
  end

  def test_it_has_an_all_method
    assert @transaction_repository.all
  end

  def test_all_method_returns_all_records
    expected_transactions = [Transaction.new({:id => "1"}, nil), Transaction.new({:id => "2"}, nil), Transaction.new({:id => "3"}, nil), Transaction.new({:id => "4"}, nil), Transaction.new({:id => "5"}, nil), Transaction.new({:id => "6"}, nil)]
    actual_transactions = @transaction_repository.all

    expected_transaction_ids = expected_transactions.map{|transaction| transaction.id}
    actual_transaction_ids = actual_transactions.map{|transaction| transaction.id}
    assert_equal expected_transaction_ids, actual_transaction_ids
  end

  def test_it_has_a_random_method
    assert @transaction_repository.random
  end

  def test_it_has_find_by_id_method
    assert @transaction_repository.find_by_id
  end

  def test_it_can_find_a_transaction_by_id
    expected = Transaction.new({:id => "3", :invoice_id => "4", :credit_card_number => "4354495077693036", :result => "success"}, nil)
    actual = @transaction_repository.find_by_id(3)
    assert_equal expected.id, actual.id
  end

  def test_it_has_a_find_by_invoice_id_method
    assert @transaction_repository.find_by_invoice_id
  end

  def test_find_by_invoice_id_method_returns_a_match
    expected = Transaction.new({:id => "3", :invoice_id => "4", :credit_card_number => "4354495077693036", :result => "success"}, nil)
    actual = @transaction_repository.find_by_invoice_id(4)

    assert_equal expected.id, actual.id
  end

  def test_it_has_a_find_all_by_result_method
    assert @transaction_repository.find_all_by_result
  end

  def test_find_all_by_result_method_returns_all_matches
    assert_equal ["ID: 2, INVOICE_ID: 2, CREDIT_CARD_NUMBER: 4580251236515201, RESULT: failure", "ID: 6, INVOICE_ID: 7, CREDIT_CARD_NUMBER: 4580251236511201, RESULT: failure"], @transaction_repository.find_all_by_result("failure")
  end

end
