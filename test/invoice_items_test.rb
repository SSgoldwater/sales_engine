require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_items.rb'

class InvoiceItemsTest < Minitest::Test

  def test_it_exists
    invoice_items_repository = InvoiceItemsRepository.new
    assert invoice_items_repository
  end




end
