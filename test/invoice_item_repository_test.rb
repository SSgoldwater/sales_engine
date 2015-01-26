require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_item_repository.rb'

class InvoiceItemTest < Minitest::Test

  def setup
    @invoice_item_repository = InvoiceItemRepository.new
  end

  def test_it_exists
    assert @invoice_item_repository
  end

  def test_it_has_an_all_method
    assert @invoice_item_repository.all
  end

  def test_all_method_returns_all_invoice_items
    expected = ["ID: 1, ITEM ID: 539, INVOICE ID: 1, QUANTITY: 5, UNIT PRICE: 13635", "ID: 2, ITEM ID: 528, INVOICE ID: 2, QUANTITY: 9, UNIT PRICE: 23324", "ID: 3, ITEM ID: 528, INVOICE ID: 2, QUANTITY: 9, UNIT PRICE: 23324"]
    assert_equal expected, @invoice_item_repository.all
  end

  def test_it_has_a_random_method
    assert @invoice_item_repository.random
  end

  def test_it_has_find_by_id_method
    assert @invoice_item_repository.find_by_id
  end

  def test_find_by_id_returns_correct_match
    expected = "ID: 2, ITEM ID: 528, INVOICE ID: 2, QUANTITY: 9, UNIT PRICE: 23324"
    assert_equal expected, @invoice_item_repository.find_by_id(2)
  end

  def test_it_has_a_find_by_item_id_method
    assert @invoice_item_repository.find_by_item_id
  end

  def test_find_by_item_id_returns_correct_match
    assert_equal "ID: 2, ITEM ID: 528, INVOICE ID: 2, QUANTITY: 9, UNIT PRICE: 23324", @invoice_item_repository.find_by_item_id(528)
  end

  def test_find_all_by_item_id_returns_all_matches_in_an_array
    assert_equal ["ID: 2, ITEM ID: 528, INVOICE ID: 2, QUANTITY: 9, UNIT PRICE: 23324", "ID: 3, ITEM ID: 528, INVOICE ID: 2, QUANTITY: 9, UNIT PRICE: 23324"], @invoice_item_repository.find_all_by_item_id(528)
  end


end
