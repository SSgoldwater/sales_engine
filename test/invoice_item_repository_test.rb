require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_item_repository.rb'

class InvoiceItemRepositoryTest < Minitest::Test

  def setup
    @invoice_item_repository = InvoiceItemRepository.new("./test/support/invoice_items.csv", nil)
  end

  def test_it_exists
    assert @invoice_item_repository
  end

  def test_it_has_all_method
    assert @invoice_item_repository.all
  end

  def test_it_can_return_all_invoice_items
    actual_invoice_items = @invoice_item_repository.all

    expected_item_ids = [1,2,3,4,5]
    actual_item_ids = actual_invoice_items.map{|ii| ii.id}
    assert_equal expected_item_ids, actual_item_ids
  end

  def test_it_has_random_method
    assert @invoice_item_repository.random
  end

  def test_it_has_find_by_id_method
    assert @invoice_item_repository.find_by_id
  end

  def test_it_can_find_an_invoice_item_by_id
    expected = InvoiceItem.new({:id => "2", :item_id => "528", :invoice_id => "2", :quantity => "9", :unit_price => "23324"}, nil)
    actual = @invoice_item_repository.find_by_id(2)

    assert_equal expected.id, actual.id
  end

  def test_it_has_find_by_item_id_method
    assert @invoice_item_repository.find_by_item_id
  end

  def test_it_can_find_an_invoice_item_by_item_id
    expected = InvoiceItem.new({:id => "2", :item_id => "528", :invoice_id => "2", :quantity => "9", :unit_price => "23324"}, nil)
    actual = @invoice_item_repository.find_by_item_id(528)

    assert_equal expected.id, actual.id
  end

  def test_it_has_find_by_invoice_id_method
    assert @invoice_item_repository.find_by_invoice_id
  end

  def test_it_can_find_an_invoice_item_by_invoice_id
    expected = InvoiceItem.new({:id => "2", :invoice_id => "2", :quantity => "9", :unit_price => "23324"}, nil)
    actual = @invoice_item_repository.find_by_invoice_id(2)

    assert_equal expected.id, actual.id
  end

  def test_it_has_find_all_by_item_id_method
    assert @invoice_item_repository.find_all_by_item_id
  end

  def test_it_can_find_all_invoice_items_by_item_id
    expected_invoice_items = [InvoiceItem.new({:id => "2", :item_id => "528", :invoice_id => "2", :quantity => "9", :unit_price => "23324"}, nil), InvoiceItem.new({:id => "3", :item_id => "528", :invoice_id => "2", :quantity => "9", :unit_price => "23324"}, nil)]
    actual_invoice_items = @invoice_item_repository.find_all_by_item_id(528)

    expected_ids = expected_invoice_items.map{|i_i| i_i.id}
    actual_ids = actual_invoice_items.map{|i_i| i_i.id}

    assert_equal expected_ids,  actual_ids
  end

  def test_it_has_find_all_by_invoice_id_method
    assert @invoice_item_repository.find_all_by_invoice_id
  end

  def test_it_finds_all_invoice_items_by_invoice_id
    actual_invoice_items = @invoice_item_repository.find_all_by_invoice_id(2)

    expected_ids = [2, 3]
    actual_ids = actual_invoice_items.map{|i_i| i_i.id}

    assert_equal expected_ids,  actual_ids
  end

end
