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
    assert_equal nil, @merchant_repository.all
  end

  def test_all_method_returns_all_merchants
    
    #create a repository of fake merchants
    #assert

  end

  def abc

  end




end
