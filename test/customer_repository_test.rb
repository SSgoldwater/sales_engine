require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customer_repository.rb'
require 'pry'

class CustomerRepositoryTest < Minitest::Test

  def setup
    @customer_repository = CustomerRepository.new("./test/support/customers_test.csv", nil)
  end

  def test_it_exists?
    assert @customer_repository
  end

  def test_it_has_an_all_method
    assert @customer_repository.all
  end

  def test_all_method_returns_all_customers
    expected_customers = [Customer.new({:id => "1"}, nil), Customer.new({:id => "2"}, nil), Customer.new({:id => "3"}, nil), Customer.new({:id => "4"}, nil), Customer.new({:id => "5"}, nil), Customer.new({:id => "6"}, nil)]
    actual_customers = @customer_repository.all

    expected_customer_ids = expected_customers.map{|customer| customer.id}
    actual_customer_ids = actual_customers.map{|customer| customer.id}

    assert_equal expected_customer_ids, actual_customer_ids
  end

  def test_it_has_a_random_method
    assert @customer_repository.random
  end

  def test_it_has_find_by_id_method
    assert @customer_repository.find_by_id
  end

  def test_find_by_id_returns_correct_match
    expected = Customer.new({:id => "2", :first_name => "Cecelia", :last_name => "Osinski" }, nil)
    actual = @customer_repository.find_by_id(2)
    assert_equal expected.id, actual.id
  end

  def test_it_has_find_by_last_name_method
    assert @customer_repository.find_by_last_name(name)
  end

  def test_find_by_last_name_returns_correct_match
    expected = Customer.new({:id => "2", :first_name => "Cecelia", :last_name => "Osinski" }, nil)
    actual = @customer_repository.find_by_last_name("Osinski")
    assert_equal expected.last_name, actual.last_name
  end

  def test_it_has_a_find_all_records_by_name_method
    assert @customer_repository.find_all_by_first_name(name)
  end

  def test_find_all_by_first_name_returns_matches
    expected_customers = [Customer.new({:first_name => "Sylvester"}, nil), Customer.new({:first_name => "Sylvester"}, nil)]
    actual_customers = @customer_repository.find_all_by_first_name("Sylvester")

    expected_first_names = expected_customers.map{|customer| customer.first_name}
    actual_first_names = actual_customers.map{|customer| customer.first_name}

    assert_equal expected_first_names, actual_first_names
  end
end
