require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_item.rb'

class InvoiceItemsTest < Minitest::Test

  def test_it_exists
    invoice_item = InvoiceItem.new
    assert invoice_item
  end




end
