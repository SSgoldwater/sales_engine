require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/items.rb'

class ItemsTest < Minitest::Test

  def test_it_exists
    items_repository = ItemsRepository.new
    assert items_repository
  end
  

end
