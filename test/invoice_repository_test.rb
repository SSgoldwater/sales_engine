require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_repository.rb'

class InvoiceRepositoryTest < Minitest::Test

  def setup
    @invoice_repository = InvoiceRepository.new("./test/support/invoices_test.csv", nil)
  end

  def test_it_exists
    assert @invoice_repository
  end

  def test_it_has_an_all_method
    assert @invoice_repository.all
  end

  def test_the_all_method_returns_all_invoices
    assert_equal ["ID: 1, CUSTOMER: 1, MERCHANT: 26, STATUS: shipped", "ID: 2, CUSTOMER: 1, MERCHANT: 75, STATUS: shipped", "ID: 3, CUSTOMER: 1, MERCHANT: 78, STATUS: shipped", "ID: 4, CUSTOMER: 1, MERCHANT: 33, STATUS: shipped"], @invoice_repository.all
  end

  def test_it_has_a_random_method
    assert @invoice_repository.random
  end

  def test_it_has_a_find_by_id_method
    assert  @invoice_repository.find_by_id(1)
  end

  def test_it_has_a_find_by_customer_id_method
    assert @invoice_repository.find_by_customer_id
  end

  def test_find_by_customer_id_method_returns_a_correct_match
    assert_equal "ID: 1, CUSTOMER: 1, MERCHANT: 26, STATUS: shipped", @invoice_repository.find_by_customer_id(1)
  end

  def test_it_has_a_find_all_by_customer_id_method
    assert @invoice_repository.find_all_by_customer_id
  end

  def test_find_all_by_customer_id_returns_all_matches
    expected_invoices = [Invoice.new({:id => "1", :customer_id => "1", :merchant_id => "26", :status => "shipped"}, nil), Invoice.new({ :id => "2", :customer_id => "1", :merchant_id => "75", :status => "shipped"}, nil), Invoice.new({ :id => "3", :customer_id => "1", :merchant_id => "78", :status => "shipped"}, nil), Invoice.new({ :id => "4", :customer_id => "1", :merchant_id => "33", :status => "shipped" }, nil)]
    actual_invoices = @invoice_repository.find_all_by_customer_id(1)
    expected_customer_ids = expected_invoices.map { |invoice| invoice.customer_id }
    actual_customer_ids = actual_invoices.map { |invoice| invoice.customer_id }

    assert_equal expected_customer_ids, actual_customer_ids
  end

end
