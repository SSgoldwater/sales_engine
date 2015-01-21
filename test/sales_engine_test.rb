require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sales_engine.rb'

class SalesEngineTest < Minitest::Test


  def test_it_exists?
    engine = SalesEngine.new
    assert engine
  end


end
