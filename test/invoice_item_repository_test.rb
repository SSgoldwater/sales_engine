require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_item_repository.rb'

class InvoiceItemsTest < Minitest::Test

  def test_it_exists
    invoice_item_repository = InvoiceItemRepository.new
    assert invoice_item_repository
  end




end
