require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_item_repository.rb'

class InvoiceItemTest < Minitest::Test

  def setup
    @invoice_item_repository = InvoiceItemRepository.new("./test/support/invoice_items_test.csv", nil)
  end

  def test_it_exists
    assert @invoice_item_repository
  end

  def test_it_has_an_all_method
    assert @invoice_item_repository.all
  end

  def test_all_method_returns_all_invoice_items
    expected_invoice_items = [InvoiceItem.new({:id => "1", :item_id => "539", :invoice_id => "1", :quantity => "5", :unit_price => "13635"}, nil), InvoiceItem.new({:id => "2", :item_id => "528", :invoice_id => "2", :quantity => "9", :unit_price => "23324"}, nil), InvoiceItem.new({:id => "3", :item_id => "528", :invoice_id => "2", :quantity => "9", :unit_price => "23324"}, nil)]
    actual_invoice_items = @invoice_item_repository.all

    expected_item_ids = expected_invoice_items.map{|ii| ii.id}
    actual_item_ids = actual_invoice_items.map{|ii| ii.id}
    assert_equal expected_item_ids, actual_item_ids
  end

  def test_it_has_a_random_method
    assert @invoice_item_repository.random
  end

  def test_it_has_find_by_id_method
    assert @invoice_item_repository.find_by_id
  end

  def test_find_by_id_returns_correct_match
    expected = InvoiceItem.new({:id => "2", :item_id => "528", :invoice_id => "2", :quantity => "9", :unit_price => "23324"}, nil)
    actual = @invoice_item_repository.find_by_id(2)
    assert_equal expected.id, actual.id
  end

  def test_it_has_a_find_by_item_id_method
    assert @invoice_item_repository.find_by_item_id
  end

  def test_find_by_item_id_returns_correct_match
    expected = InvoiceItem.new({:id => "2", :item_id => "528", :invoice_id => "2", :quantity => "9", :unit_price => "23324"}, nil)
    actual = @invoice_item_repository.find_by_item_id(528)
    assert_equal expected.id, actual.id
  end

  def test_find_all_by_item_id_returns_all_matches_in_an_array
    expected_invoice_items = [InvoiceItem.new({:id => "2", :item_id => "528", :invoice_id => "2", :quantity => "9", :unit_price => "23324"}, nil), InvoiceItem.new({:id => "3", :item_id => "528", :invoice_id => "2", :quantity => "9", :unit_price => "23324"}, nil)]
    actual_invoice_items = @invoice_item_repository.find_all_by_item_id(528)

    expected_ids = expected_invoice_items.map{|i_i| i_i.id}
    actual_ids = actual_invoice_items.map{|i_i| i_i.id}

    assert_equal expected_ids,  actual_ids
  end


end
