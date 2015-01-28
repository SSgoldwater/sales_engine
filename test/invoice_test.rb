require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice.rb'
require_relative '../lib/invoice_parser.rb'
require 'pry'

class InvoiceTest < Minitest::Test

  def test_it_exists
    invoice = Invoice.new({:id => 1}, nil)
    assert invoice
  end

end

class InvoiceParserTest < Minitest::Test

  def test_it_exists
    filename = "./test/support/invoices_test.csv"
    invoiceparser = InvoiceParser.new(filename, nil)
    assert invoiceparser
  end

  def test_it_parses_a_csv
    filename = "./test/support/invoices_test.csv"
    invoiceparser = InvoiceParser.new(filename, nil)
    invoices = invoiceparser.parse

    first = invoices[0]
    assert_equal 1, first.id
    assert_equal 1, first.customer_id
    assert_equal 26, first.merchant_id
    assert_equal "shipped", first.status

    second = invoices[1]
    assert_equal 2, second.id
    assert_equal 1, second.customer_id
    assert_equal 75, second.merchant_id
    assert_equal "shipped", second.status
  end

end
