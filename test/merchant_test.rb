require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchant.rb'
require 'pry'

class MerchantTest < Minitest::Test

  def test_it_stores_an_id
    merchant = Merchant.new({:id => 6}, nil)
    assert_equal 6, merchant.id
  end

  def test_it_stores_a_name
    merchant = Merchant.new({:name => "Jeff"}, nil)
    assert_equal "Jeff", merchant.name
  end

end


require_relative '../lib/merchant_parser.rb'

class MerchantParserTest < Minitest::Test

  def test_it_exists
    filename = "./test/support/merchants_test.csv"
    merchantparser = MerchantParser.new(filename)
    assert merchantparser
  end

  def test_it_parses_a_csv
    filename = "./test/support/merchants_test.csv"
    merchantparser = MerchantParser.new(filename)
    merchants = merchantparser.parse

    first = merchants[0]
    assert_equal 1, first.id
    assert_equal "Schroeder-Jerde", first.name

    second = merchants[1]
    assert_equal 2, second.id
    assert_equal "Klein, Rempel and Jones", second.name

  end


end
