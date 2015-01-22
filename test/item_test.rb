require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/item.rb'
require_relative '../lib/item_parser.rb'
require 'pry'

class ItemTest < Minitest::Test

  def test_it_exists
    item = Item.new({}, nil)
    assert item
  end

end




class ItemParserTest < Minitest::Test

  def test_it_exists
    filename = "./test/support/items_test.csv"
    itemparser = ItemParser.new(filename)
    assert itemparser
  end

  def test_it_parses_a_csv
    filename = './test/support/items_test.csv'
    itemparser = ItemParser.new(filename)
    items = itemparser.parse

    first = items[0]
    assert_equal 1, first.id
    assert_equal "Item Qui Esse", first.name
    assert_equal "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.", first.description
    assert_equal 75107, first.unit_price
    assert_equal 1, first.merchant_id

    second = items[1]
    assert_equal 2, second.id
    assert_equal "Item Autem Minima", second.name
    assert_equal "Cumque consequuntur ad. Fuga tenetur illo molestias enim aut iste. Provident quo hic aut. Aut quidem voluptates dolores. Dolorem quae ab alias tempora.", second.description
    assert_equal 67076, second.unit_price
    assert_equal 1, second.merchant_id
  end

end
