require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/item_repository.rb'

class ItemRepositoryTest < Minitest::Test

  def setup
    @item_repository = ItemRepository.new("./test/support/items.csv", nil)
  end

  def test_it_exists?
    assert @item_repository
  end

  def test_it_has_an_all_method
    assert @item_repository.all
  end

  def test_all_method_returns_all_items
    expected_items = [Item.new({:id => "1", :unit_price => "12345"}, nil), Item.new({:id => "2", :unit_price => "12345"}, nil), Item.new({:id => "3", :unit_price => "12345"}, nil), Item.new({:id => "4", :unit_price => "12345"}, nil), Item.new({:id => "5", :unit_price => "12345"}, nil)]
    actual_items = @item_repository.all

    expected_item_ids = expected_items.map{|item| item.id}
    actual_item_ids = actual_items.map{|item| item.id}

    assert_equal expected_item_ids, actual_item_ids
  end

  def test_it_has_random_method
    assert @item_repository.random
  end

  def test_it_has_find_by_id_method
    assert @item_repository.find_by_id
  end

  def test_find_by_id_returns_matching_item
    expected = Item.new({:id => "2", :unit_price => "12345"}, nil)
    actual = @item_repository.find_by_id(2)

    assert_equal expected.id, actual.id
  end

  def test_it_has_find_by_name_method
    assert @item_repository.find_by_name
  end

  def test_find_by_name_returns_matching_item
    expected = Item.new({:id => "2", :name => "Item Autem Minima", :unit_price => "12345"}, nil)
    actual = @item_repository.find_by_name("Item Autem Minima")

    assert_equal expected.name, actual.name
  end

  def test_it_has_find_by_description_method
    assert @item_repository.find_by_description
  end

  def test_find_by_description_returns_matching_item
    expected = Item.new({:id => "2", :description => "Sunt officia eum qui molestiae. Nesciunt quidem cupiditate reiciendis est commodi non. Atque eveniet sed. Illum excepturi praesentium reiciendis voluptatibus eveniet odit perspiciatis. Odio optio nisi rerum nihil ut.", :unit_price => "12345"}, nil)
    actual = @item_repository.find_by_description("Sunt officia eum qui molestiae. Nesciunt quidem cupiditate reiciendis est commodi non. Atque eveniet sed. Illum excepturi praesentium reiciendis voluptatibus eveniet odit perspiciatis. Odio optio nisi rerum nihil ut.")

    assert_equal expected.description, actual.description
  end

  def test_it_has_find_by_unit_price_method
    assert @item_repository.find_by_unit_price
  end

  def test_find_by_unit_price_returns_matching_item
    skip
    expected = Item.new({:unit_price => BigDecimal.new(12345)}, nil)
    actual = @item_repository.find_by_unit_price(BigDecimal.new(12345))

    assert_equal expected.unit_price, actual.unit_price
  end

  def test_it_has_find_by_merchant_id_method
    assert @item_repository.find_by_merchant_id
  end

  def test_find_by_merchant_id_returns_matching_item
    skip
    expected = Item.new({:id => "2", :merchant_id => "2", :unit_price => "12345"}, nil)
    actual = @item_repository.find_by_description("Sunt officia eum qui molestiae. Nesciunt quidem cupiditate reiciendis est commodi non. Atque eveniet sed. Illum excepturi praesentium reiciendis voluptatibus eveniet odit perspiciatis. Odio optio nisi rerum nihil ut.")

    assert_equal expected.description, actual.description
  end

  def test_it_has_find_all_by_unit_price_method
    assert @item_repository.find_all_by_unit_price
  end

  def test_find_all_by_unit_price_returns_matching_items
    skip
  end

  def test_it_has_find_all_by_merchant_id_method
    assert @item_repository.find_all_by_merchant_id
  end

  def test_find_all_by_merchant_id_returns_matching_items
    expected_item_ids = [1,2,3,4]
    actual = @item_repository.find_all_by_merchant_id(1)
    actual_item_ids = actual.map{|item| item.id}

    assert_equal expected_item_ids, actual_item_ids
  end

end
