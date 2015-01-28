require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchant_repository.rb'

class MerchantRepositoryTest < Minitest::Test

  def setup
    @merchant_repository = MerchantRepository.new("./test/support/merchants_test.csv", nil)
  end

  def test_it_exists?
    assert @merchant_repository
  end

  def test_it_has_an_all_method
    assert @merchant_repository.all
  end

  def test_all_method_returns_all_merchants
    expected_merchants = [Merchant.new({:name => "Schroeder-Jerde", :id => "1"}, nil), Merchant.new({:name => "Klein, Rempel and Jones", :id => "2"}, nil), Merchant.new({ :name => "Willms and Sons", :id => "3"}, nil ), Merchant.new({ :name => "Williamson Group", :id => "4"}, nil), Merchant.new({ :name => "Williamson Group", :id => "5"}, nil)]
    actual_merchants = @merchant_repository.all
    expected_names = expected_merchants.map{|merchant| merchant.name}
    actual_names = actual_merchants.map{|merchant| merchant.name}
    assert_equal expected_names, actual_names
  end

  def test_it_has_a_random_method
    assert @merchant_repository.random
  end

  def test_it_has_find_by_id_method
    assert @merchant_repository.find_by_id
  end

  def test_find_by_id_returns_correct_match
    expected = Merchant.new({ :name => "Willms and Sons", :id => "3"}, nil)
    actual = @merchant_repository.find_by_id(3)
    assert_equal expected.id, actual.id
  end

  def test_it_has_find_by_name_method
    assert @merchant_repository.find_by_name(name)
  end

  def test_find_by_name_returns_correct_match
    expected = Merchant.new({ :name => "Willms and Sons", :id => "3"}, nil)
    actual = @merchant_repository.find_by_name("willms and sons")
    assert_equal expected.name, actual.name
  end

  def test_it_had_find_all_by_name_method
    assert @merchant_repository.find_all_by_name(name)
  end

end
