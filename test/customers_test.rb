require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customers.rb'

class CustomersTest < Minitest::Test


  def test_it_exists?
    customers = CustomerRepository.new
    assert customers
  end


end
