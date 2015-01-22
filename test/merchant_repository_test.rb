require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchant_repository.rb'

class MerchantRepositoryTest < Minitest::Test

  def setup
    @merchant_repository = MerchantRepository.new
  end

  def test_it_exists?
    assert @merchant_repository
  end

  def test_it_has_an_all_method
    assert @merchant_repository.all
  end

  def test_all_method_returns_all_merchants
    expected = ["NAME: Schroeder-Jerde, ID: 1", "NAME: Klein, Rempel and Jones, ID: 2", "NAME: Willms and Sons, ID: 3", "NAME: Cummings-Thiel, ID: 4", "NAME: Williamson Group, ID: 5"]
    assert_equal expected, @merchant_repository.all
  end


  def test_it_has_a_random_method
    assert @merchant_repository.random
    puts @merchant_repository.random
  end




end
