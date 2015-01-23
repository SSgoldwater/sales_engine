require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customer_repository.rb'

class CustomerRepositoryTest < Minitest::Test

  def setup
    @customer_repository = CustomerRepository.new
  end

  def test_it_exists?
    assert @customer_repository
  end

  def test_it_has_an_all_method
    assert @customer_repository.all
  end

  def test_all_method_returns_all_customers
    expected = ["NAME: Joey Ondricka, ID: 1", "NAME: Cecelia Osinski, ID: 2", "NAME: Mariah Toy, ID: 3", "NAME: Leanne Braun, ID: 4", "NAME: Sylvester Nader, ID: 5", "NAME: Sylvester Nader, ID: 6"]
    assert_equal expected, @customer_repository.all
  end

  def test_it_has_a_random_method
    assert @customer_repository.random
  end

  def test_it_has_find_by_id_method
    assert @customer_repository.find_by_id
  end

  def test_find_by_id_returns_correct_match
    expected = "NAME: Cecelia Osinski, ID: 2"
    assert_equal expected, @customer_repository.find_by_id(2)
  end

  def test_it_has_find_by_name_method
    assert @customer_repository.find_by_name(name)
  end

  def test_find_by_name_returns_correct_match
    assert_equal "NAME: Cecelia Osinski, ID: 2", @customer_repository.find_by_name("Cecelia Osinski")
  end

  def test_it_has_a_find_all_records_by_name_method
    assert @customer_repository.find_all_by_name(name)
  end

  def test_find_all_by_name_returns_all_customers
    assert_equal ["NAME: Sylvester Nader, ID: 5", "NAME: Sylvester Nader, ID: 6"], @customer_repository.find_all_by_name("Sylvester Nader")
  end
end
