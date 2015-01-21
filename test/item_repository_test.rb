require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/item_repository.rb'

class ItemTest < Minitest::Test

  def test_it_exists
    item_repository = ItemRepository.new
    assert item_repository
  end


end
