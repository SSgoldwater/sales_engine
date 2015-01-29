require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sales_engine.rb'

class SalesEngineTest < Minitest::Test

  def test_it_exists?
    engine = SalesEngine.new("/Users/Goldwater/Desktop/Development/sales_engine/test/support")
    assert engine
  end

end
