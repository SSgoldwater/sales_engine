require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchants.rb'

class MerchantsTest < Minitest::Test

  def setup
    @merchant_repository = MerchantRepository.new
  end


  def test_it_exists?
    assert @merchant_repository
  end

  def test_it_returns_all_merchants
    expected = [["id", "name", "created_at", "updated_at"],
    ["1", "Schroeder-Jerde", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC"],
    ["2", "Klein, Rempel and Jones", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC"],
    ["3", "Willms and Sons", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC"],
    ["4", "Cummings-Thiel", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC"],
    ["5", "Williamson Group", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC"],
    ["6", "Williamson Group", "2012-03-27 14:53:59 UTC", "2012-03-27 16:12:25 UTC"],
    ["7", "Bernhard-Johns", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC"],
    ["8", "Osinski, Pollich and Koelpin", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC"],
    ["9", "Hand-Spencer", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC"],
    ["10", "Bechtelar, Jones and Stokes", "2012-03-27 14:54:00 UTC", "2012-03-27 14:54:00 UT"]]
    result = @merchant_repository.all
    assert_equal expected, result
  end

  def test_it_returns_random_merchant
    @merchant_repository.random

  end



end
