require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/item.rb'

class ItemTest < Minitest::Test

  def test_it_exists
    item = Item.new
    assert item
  end


end
