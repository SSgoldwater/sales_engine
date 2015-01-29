require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_item.rb'

class InvoiceItemsTest < Minitest::Test

  def setup
    @invoice_item = InvoiceItem.new({:item_id => 123, :invoice_id => 5, :quantity => 3, :unit_price => 54321}, nil)
  end

  def test_it_exists
    assert @invoice_item
  end

  def test_it_stores_item_id
    assert_equal 123, @invoice_item.item_id
  end

  def test_it_stores_invoice_id
    assert_equal 5, @invoice_item.invoice_id
  end

  def test_it_stores_quantity
    assert_equal 3, @invoice_item.quantity
  end

  def test_it_stores_unit_price
    assert_equal 54321, @invoice_item.unit_price
  end

end

require_relative '../lib/invoice_item_parser.rb'

class InvoiceItemParserTest < Minitest::Test

  def test_it_exists
    filename = ".test/support/invoice_items.csv"
    invoice_item_parser = InvoiceItemParser.new(filename, nil)
    assert invoice_item_parser
  end

  def test_it_parses_a_csv
    filename = "./test/support/invoice_items.csv"
    invoice_item_parser = InvoiceItemParser.new(filename, nil)
    invoice_items = invoice_item_parser.parse

    first = invoice_items[0]
    assert_equal 539, first.item_id
    assert_equal 1, first.invoice_id
    assert_equal 5, first.quantity
    assert_equal 13635, first.unit_price

    second = invoice_items[1]
    assert_equal 528, second.item_id
    assert_equal 2, second.invoice_id
    assert_equal 9, second.quantity
    assert_equal 23324, second.unit_price
  end

end
