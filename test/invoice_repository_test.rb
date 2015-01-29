require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_repository.rb'

class InvoiceRepositoryTest < Minitest::Test

  def setup
    @invoice_repository = InvoiceRepository.new("./test/support/invoices.csv", nil)
  end

  def test_it_exists
    assert @invoice_repository
  end

  def test_it_has_an_all_method
    assert @invoice_repository.all
  end

  def test_all_method_returns_all_invoices
    expected_invoices = [Invoice.new({:id => "1"}, nil), Invoice.new({:id => "2"}, nil), Invoice.new({:id => "3"}, nil), Invoice.new({:id => "4"}, nil), Invoice.new({:id => "5"}, nil)]
    actual_invoices =  @invoice_repository.all

    expected_invoices_ids = expected_invoices.map{|invoice| invoice.id}
    actual_invoices_ids = actual_invoices.map{|invoice| invoice.id}

    assert_equal expected_invoices_ids, actual_invoices_ids
  end

  def test_it_has_a_random_method
    assert @invoice_repository.random
  end

  def test_it_has_a_find_by_id_method
    assert  @invoice_repository.find_by_id
  end

  def test_find_by_id_returns_matching_invoice
    expected = Invoice.new({:id => "2"}, nil)
    actual = @invoice_repository.find_by_id(2)

    assert_equal expected.id, actual.id
  end

  def test_it_has_a_find_all_by_customer_id_method
    assert @invoice_repository.find_all_by_customer_id
  end

  def test_find_all_by_customer_id_returns_matching_invoices
    expected_invoices = [Invoice.new({:id => "1", :customer_id => "1", :merchant_id => "26", :status => "shipped"}, nil), Invoice.new({ :id => "2", :customer_id => "1", :merchant_id => "75", :status => "shipped"}, nil), Invoice.new({ :id => "3", :customer_id => "1", :merchant_id => "78", :status => "shipped"}, nil), Invoice.new({ :id => "4", :customer_id => "1", :merchant_id => "33", :status => "shipped" }, nil)]
    actual_invoices = @invoice_repository.find_all_by_customer_id(1)

    expected_customer_ids = expected_invoices.map { |invoice| invoice.customer_id }
    actual_customer_ids = actual_invoices.map { |invoice| invoice.customer_id }

    assert_equal expected_customer_ids, actual_customer_ids
  end

  def test_it_has_a_find_all_by_merchant_id_method
    assert @invoice_repository.find_all_by_merchant_id
  end

  def test_find_all_by_merchant_id_returns_matching_invoices
    expected_invoice_ids = [1, 5]

    actual_invoices = @invoice_repository.find_all_by_merchant_id(26)
    actual_invoice_ids = actual_invoices.map{|invoice| invoice.id}

    assert_equal expected_invoice_ids, actual_invoice_ids
  end

end
